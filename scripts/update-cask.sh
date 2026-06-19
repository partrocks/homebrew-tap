#!/usr/bin/env bash
#
# Update Casks/dogger.rb to a given Dogger release: downloads the .dmg from the
# GitHub release, computes its sha256, and rewrites the version + sha256 lines.
#
# Usage:
#   scripts/update-cask.sh 0.1.1
#
set -euo pipefail

VERSION="${1:?Usage: $(basename "$0") <version>   (e.g. 0.1.1)}"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK="$DIR/Casks/dogger.rb"
URL="https://github.com/partrocks/dogger/releases/download/v${VERSION}/Dogger_${VERSION}_aarch64.dmg"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

echo "Downloading $URL"
curl -fSL -o "$tmp" "$URL"

SHA="$(shasum -a 256 "$tmp" | awk '{print $1}')"
echo "version  $VERSION"
echo "sha256   $SHA"

perl -i -pe 's/^(\s*version\s+)"[^"]*"/${1}"'"$VERSION"'"/' "$CASK"
perl -i -pe 's/^(\s*sha256\s+)"[^"]*"/${1}"'"$SHA"'"/'   "$CASK"

echo "Updated $CASK"
echo
echo "Next:"
echo "  git -C \"$DIR\" commit -am \"dogger $VERSION\" && git -C \"$DIR\" push"
