cask "dogger" do
  version "0.7.0"
  sha256 "dc751c12a6ad92624d7fd83d564650e0d96b1ea8a2c16a6705c09af0871e7fea"

  url "https://doggerapp.com/releases/dogger-v#{version}/Dogger_#{version}_aarch64.dmg"
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

  zap trash: "~/.dogger"
end
