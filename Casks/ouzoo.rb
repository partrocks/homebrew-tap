cask "ouzoo" do
  version "0.0.1"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/Ouzoo_#{version}_aarch64.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.ouzoo"
end
