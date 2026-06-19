# partrocks/homebrew-tap

Homebrew tap for [Dogger](https://github.com/partrocks/dogger) — your development
Docker dog.

## Install

```bash
brew install --cask partrocks/tap/dogger
```

Dogger is currently **unsigned** (no Apple Developer ID yet). The cask strips
macOS quarantine after install so the app opens without the "damaged" Gatekeeper
dialog.

Upgrade later with:

```bash
brew upgrade --cask dogger
```

## Updating the cask for a new release

**Automatic:** each Dogger release (after `make bump` + push) updates `version` and
`sha256` here via GitHub Actions in `partrocks/dogger` (requires
`HOMEBREW_TAP_TOKEN` on that repo).

**Manual** (only if CI skipped or you need to fix a cask by hand):

```bash
scripts/update-cask.sh 0.1.2
git commit -am "dogger 0.1.2"
git push
```

Edit `Casks/dogger.rb` directly for cask structure changes (e.g. `postflight`).
Those are **not** overwritten by CI — only `version` and `sha256` are updated.
