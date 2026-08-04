cask "dogger" do
  version "0.3.3"
  sha256 "42da8ec0904b739772759453b4dbe226fa92729a1c3ef12316ec08da5c30fedd"

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
