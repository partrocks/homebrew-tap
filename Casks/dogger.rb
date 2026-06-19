cask "dogger" do
  version "0.1.1"
  sha256 "16d8b95b60bb929a2c8572aabf9300c8d551d8a299719448431b4c07b0bfc797"

  url "https://github.com/partrocks/dogger/releases/download/v#{version}/Dogger_#{version}_aarch64.dmg"
  name "Dogger"
  desc "Your development Docker dog — run reusable shell-script tasks in containers"
  homepage "https://doggerapp.com"

  depends_on arch: :arm64

  app "Dogger.app"

  zap trash: [
    "~/.dogger",
  ]
end
