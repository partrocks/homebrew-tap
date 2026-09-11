cask "ouzoo" do
  version "0.2.6"
  sha256 "c32f167e1308f223b130f88206aaaf44afc58f238a9908f5bcc0b2a2e8ba4a3d"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/Ouzoo_#{version}_aarch64.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.config/rocks/ouzoo"
end
