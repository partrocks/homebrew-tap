cask "dogger" do
  version "0.2.35"
  sha256 "5d79cc9f977dcc58a33048964d3cee8badab0e19a8b81ed55c698448f801d839"

  url "https://github.com/partrocks/dogger/releases/download/v#{version}/Dogger_#{version}_aarch64.dmg"
  name "Dogger"
  desc "Your development Docker dog — run reusable shell-script tasks in containers"
  homepage "https://doggerapp.com/"

  depends_on arch: :arm64
  depends_on :macos

  app "Dogger.app"
  binary "#{appdir}/Dogger.app/Contents/MacOS/dogger"
  bash_completion "#{appdir}/Dogger.app/Contents/Resources/completions/dogger.bash"
  fish_completion "#{appdir}/Dogger.app/Contents/Resources/completions/dogger.fish"
  zsh_completion "#{appdir}/Dogger.app/Contents/Resources/completions/_dogger"

  # Unsigned build: strip Gatekeeper quarantine after install (Homebrew removed
  # --no-quarantine in 4.7+).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dogger.app"]
  end

  zap trash: "~/.dogger"
end
