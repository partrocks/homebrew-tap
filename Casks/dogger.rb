cask "dogger" do
  version "0.6.8"
  sha256 "57d377ea52ae79a6e5e44ad74ea2920edc6d53d6fc9691160f039202999d1905"

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
