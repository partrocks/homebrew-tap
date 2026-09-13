#!/usr/bin/env bash
#
# Update Casks/ouzoo.rb to a given Ouzoo release: downloads the .dmg from
# ouzoo.app, computes its sha256, and rewrites version, sha256, and url
# (brew.dmg).
#
# Usage:
#   scripts/update-ouzoo-cask.sh 0.2.6
#
set -euo pipefail

VERSION="${1:?Usage: $(basename "$0") <version>   (e.g. 0.2.6)}"
ASSET="Ouzoo_${VERSION}_aarch64.dmg"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK="$DIR/Casks/ouzoo.rb"
URL="https://ouzoo.app/releases/ouzoo-v${VERSION}/brew.dmg"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

echo "Downloading ${ASSET} from ouzoo.app"
curl -fSL -o "$tmp" "$URL"

SHA="$(shasum -a 256 "$tmp" | awk '{print $1}')"
echo "version  $VERSION"
echo "sha256   $SHA"
echo "url      $URL"

CASK_URL='https://ouzoo.app/releases/ouzoo-v#{version}/brew.dmg'
perl -i -pe 's/^(\s*version\s+)"[^"]*"/${1}"'"$VERSION"'"/' "$CASK"
perl -i -pe 's/^(\s*sha256\s+)"[^"]*"/${1}"'"$SHA"'"/'   "$CASK"
perl -i -pe 's|^(\s*url\s+)"[^"]*"|${1}"'"$CASK_URL"'"|' "$CASK"

echo "Updated $CASK"
echo
echo "Next:"
echo "  git -C \"$DIR\" commit -am \"ouzoo $VERSION\" && git -C \"$DIR\" push"
