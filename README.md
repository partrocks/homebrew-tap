# partrocks/homebrew-tap

Homebrew tap for [Dogger](https://github.com/partrocks/dogger) — your development
Docker dog.

## Install

```bash
brew install --cask partrocks/tap/dogger
```

The cask installs both `Dogger.app` and the bundled `dogger` command. For
example, run `dogger ls` to list tasks after installation.

Dogger is currently **unsigned** (no Apple Developer ID yet). The cask strips
macOS quarantine after install so the app opens without the "damaged" Gatekeeper
dialog.

Upgrade later with:

```bash
brew update
brew upgrade --cask dogger
```

Run `brew update` first so Homebrew fetches the latest tap. Without it,
`brew upgrade` may report the current version is already installed even when a
newer Dogger release is available.

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
