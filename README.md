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

When a new Dogger version is published, point the cask at it.

**While `partrocks/dogger` is private**, downloads need auth. Pick one:

### Option A — make the repo public (best long-term)

Settings → General → Change visibility → Public. Then:

```bash
scripts/update-cask.sh 0.1.1
git commit -am "dogger 0.1.1"
git push
```

No token, no `gh`, and Homebrew users can install too.

### Option B — use a GitHub token (no `gh` required)

1. GitHub → Settings → Developer settings → Personal access tokens → create a
   token with **read access to `partrocks/dogger`** (classic: `repo` scope).
2. Run:

```bash
export GITHUB_TOKEN=ghp_your_token_here
scripts/update-cask.sh 0.1.1
git commit -am "dogger 0.1.1"
git push
```

### Option C — install `gh` (handy if you keep the repo private)

```bash
brew install gh
gh auth login
scripts/update-cask.sh 0.1.1
git commit -am "dogger 0.1.1"
git push
```

### Option D — manual (browser download)

1. Download `Dogger_0.1.1_aarch64.dmg` from the GitHub release page (while logged in).
2. `shasum -a 256 ~/Downloads/Dogger_0.1.1_aarch64.dmg`
3. Edit `Casks/dogger.rb`: set `version` and `sha256` to match.

---

The script downloads the `.dmg`, computes `sha256`, and rewrites `Casks/dogger.rb`.

**Private repo note:** Unauthenticated `curl` gets HTTP 404 even when the release
URL looks correct in your browser. Homebrew users hit the same wall until the
`.dmg` is on a **public** URL (public repo, or host on `doggerapp.com`).
