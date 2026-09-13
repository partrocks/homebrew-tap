cask "ouzoo" do
  version "0.2.8"
  sha256 "01523752dc6275fe32203288964038ae8928b6a331eea82468de4835eb24161d"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/Ouzoo_#{version}_aarch64.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.config/rocks/ouzoo"
end
