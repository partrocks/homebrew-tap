#!/usr/bin/env bash
#
# Update Casks/dogger.rb to a given Dogger release: downloads the .dmg from the
# GitHub release, computes its sha256, and rewrites the version + sha256 lines.
#
# Usage:
#   scripts/update-cask.sh 0.1.1
#
# Downloads require access to the release. If partrocks/dogger is private, use
# `gh auth login` first, or set GITHUB_TOKEN with repo read access.
#
set -euo pipefail

VERSION="${1:?Usage: $(basename "$0") <version>   (e.g. 0.1.1)}"
REPO="partrocks/dogger"
TAG="v${VERSION}"
ASSET="Dogger_${VERSION}_aarch64.dmg"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK="$DIR/Casks/dogger.rb"
URL="https://github.com/${REPO}/releases/download/${TAG}/${ASSET}"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

download_release() {
  if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    echo "Downloading ${TAG} via gh (authenticated)"
    gh release download "$TAG" --repo "$REPO" --pattern "$ASSET" --clobber --output "$tmp"
    return
  fi

  local -a curl_args=(-fSL -o "$tmp")
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    echo "Downloading ${TAG} via curl (GITHUB_TOKEN)"
    curl_args=(-fSL -L -H "Authorization: Bearer ${GITHUB_TOKEN}" -o "$tmp")
  else
    echo "Downloading ${TAG} via curl (unauthenticated)"
  fi

  if ! curl "${curl_args[@]}" "$URL"; then
    echo >&2
    echo "error: download failed." >&2
    echo "  If ${REPO} is private, unauthenticated requests get HTTP 404." >&2
    echo "  Fix for this script:  gh auth login   (or set GITHUB_TOKEN)" >&2
    echo "  Fix for Homebrew users: make the repo public, or host the .dmg at a" >&2
    echo "  public URL (e.g. doggerapp.com) and point the cask url there." >&2
    exit 1
  fi
}

download_release

SHA="$(shasum -a 256 "$tmp" | awk '{print $1}')"
echo "version  $VERSION"
echo "sha256   $SHA"
echo "url      $URL"

perl -i -pe 's/^(\s*version\s+)"[^"]*"/${1}"'"$VERSION"'"/' "$CASK"
perl -i -pe 's/^(\s*sha256\s+)"[^"]*"/${1}"'"$SHA"'"/'   "$CASK"

echo "Updated $CASK"
echo
echo "Next:"
echo "  git -C \"$DIR\" commit -am \"dogger $VERSION\" && git -C \"$DIR\" push"
