#!/usr/bin/env bash
#
# Update Casks/cliq.rb to a given cliq release: downloads the archive from the
# GitHub release, computes its sha256, and rewrites the version + sha256
# lines.
#
# Usage:
#   scripts/update-cliq-cask.sh 0.3.2
#
set -euo pipefail

VERSION="${1:?Usage: $(basename "$0") <version>   (e.g. 0.3.2)}"
REPO="partrocks/homebrew-tap"
TAG="cliq-v${VERSION}"
ASSET="cliq_${VERSION}_aarch64.tar.gz"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK="$DIR/Casks/cliq.rb"
URL="https://github.com/${REPO}/releases/download/${TAG}/${ASSET}"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

echo "Downloading ${TAG} from the public tap releases"
curl -fSL -o "$tmp" "$URL"

SHA="$(shasum -a 256 "$tmp" | awk '{print $1}')"
echo "version  $VERSION"
echo "sha256   $SHA"
echo "url      $URL"

perl -i -pe 's/^(\s*version\s+)"[^"]*"/${1}"'"$VERSION"'"/' "$CASK"
perl -i -pe 's/^(\s*sha256\s+)"[^"]*"/${1}"'"$SHA"'"/'   "$CASK"

echo "Updated $CASK"
echo
echo "Next:"
echo "  git -C \"$DIR\" commit -am \"cliq $VERSION\" && git -C \"$DIR\" push"
