# partrocks/homebrew-tap

Homebrew tap for [Dogger](https://github.com/partrocks/dogger) — your development
Docker dog.

## Install

```bash
brew install --cask partrocks/tap/dogger --no-quarantine
```

`--no-quarantine` is required because Dogger is currently distributed **unsigned**
(no Apple Developer ID yet); it tells macOS not to quarantine the downloaded app.

Upgrade later with:

```bash
brew upgrade --cask dogger
```

## Updating the cask for a new release

When a new Dogger version is published, point the cask at it:

```bash
scripts/update-cask.sh 0.1.1
git commit -am "dogger 0.1.1"
git push
```

The script downloads that version's `.dmg`, computes its `sha256`, and rewrites
the `version` + `sha256` lines in `Casks/dogger.rb`.
