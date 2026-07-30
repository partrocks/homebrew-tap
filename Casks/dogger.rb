cask "dogger" do
  version "0.1.6"
  sha256 "8f06930ac671d629e28cde1401a82f1904dfc55f8dd71d0ba6fe006ac7185fc4"

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
