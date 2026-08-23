cask "dogger" do
  version "0.5.8"
  sha256 "cb1ff7cadc773b94eee76790d01bbc1e71ec137a62e8a03231bb152a3c203a82"

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
