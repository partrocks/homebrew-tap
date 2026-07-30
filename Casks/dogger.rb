cask "dogger" do
  version "0.2.2"
  sha256 "b719512a7713e151c77b5d101d4e45a180ce4dcb76520e1ee260b339b9013508"

  url "https://github.com/partrocks/dogger/releases/download/v#{version}/Dogger_#{version}_aarch64.dmg"
  name "Dogger"
  desc "Your development Docker dog — run reusable shell-script tasks in containers"
  homepage "https://doggerapp.com"

  depends_on arch: :arm64

  app "Dogger.app"
  binary "#{appdir}/Dogger.app/Contents/MacOS/dogger"

  # Unsigned build: strip Gatekeeper quarantine after install (Homebrew removed
  # --no-quarantine in 4.7+).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Dogger.app"]
  end

  zap trash: [
    "~/.dogger",
  ]
end
