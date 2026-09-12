cask "ouzoo" do
  version "0.2.7"
  sha256 "3b0133b8a0d72d7b9d996f5d54b7f6e3da99f32f88c20d44ed5aa020025cdd34"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/Ouzoo_#{version}_aarch64.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.config/rocks/ouzoo"
end
