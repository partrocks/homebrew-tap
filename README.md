# partrocks/homebrew-tap

Homebrew tap for PartRocks macOS apps and CLIs.

## cliq

```bash
brew install --cask partrocks/tap/cliq
```

Installs the `cliq` binary and `cliq.1` man page. See [partrocks/cliq](https://github.com/partrocks/cliq).

cliq is a CLI, not a `.app`. Releases are signed with a Developer ID and
notarized by Apple. Homebrew installs the binary and man page from this
tap's public `cliq-v*` GitHub release (the cliq source repo stays private).

cliq CI publishes that archive, then updates `Casks/cliq.rb` `version`
and `sha256` (`HOMEBREW_TAP_TOKEN` on `partrocks/cliq`). A missing token
fails that release.

Upgrade later with:

```bash
brew update
brew upgrade --cask cliq
```

**Manual** (only if CI skipped or you need to fix a cask by hand):

```bash
scripts/update-cliq-cask.sh 0.3.2
git commit -am "cliq 0.3.2"
git push
```

Edit `Casks/cliq.rb` directly for cask structure changes.
Those are **not** overwritten by CI — only `version` and `sha256` are updated.


## Ouzoo

```bash
brew install --cask partrocks/tap/ouzoo
```

Installs `Ouzoo.app`. See [ouzoo.app](https://ouzoo.app).

Ouzoo CI updates `Casks/ouzoo.rb` `version`, `sha256`, and `url`
(`brew.dmg`) on each release (`HOMEBREW_TAP_TOKEN` on `partrocks/ouzoo`).
A missing token fails that release.

Upgrade later with:

```bash
brew update
brew upgrade --cask ouzoo
```

**Manual** (only if CI skipped or you need to fix a cask by hand):

```bash
scripts/update-ouzoo-cask.sh 0.2.6
git commit -am "ouzoo 0.2.6"
git push
```

Edit `Casks/ouzoo.rb` directly for cask structure changes.
Those are **not** overwritten by CI — only `version`, `sha256`, and `url`
are updated.

## Dogger

## Install

```bash
brew install --cask partrocks/tap/dogger
```

The cask installs `Dogger.app`, the bundled `dogger` command on your `PATH`, and
completion scripts for Zsh, Bash, and Fish.

```bash
# List aliases, task names, and projects
dogger ls

# Run a task by its globally unique alias
dogger run database-migrate

# Show help or the installed version
dogger --help
dogger --version
```

Task aliases are lowercase slugs managed in the app. `dogger run` streams
output, blocks until completion, records the run in the same history as the
desktop app, and returns the task's exit code. Docker and the task's configured
container must already be running. Shell completion queries current aliases and
shows their task, project, and context without running them.

Dogger releases are signed with an Apple Developer ID and notarized by Apple,
so the cask follows the normal macOS Gatekeeper installation flow.

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

Edit `Casks/dogger.rb` directly for cask structure changes.
Those are **not** overwritten by CI — only `version` and `sha256` are updated.
