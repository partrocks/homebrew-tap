cask "dogger" do
  version "0.1.9"
  sha256 "4946d41de953bdee366baba3f0e9315465077d5c3d963daca272ed4ca732a61f"

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
