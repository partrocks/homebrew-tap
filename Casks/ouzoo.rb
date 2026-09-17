cask "ouzoo" do
  version "0.2.11"
  sha256 "0967dea3f4a72fc9c12b2f342bf9e63b8ffd240c9d1dfc11d4b16e3f5c088370"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/brew.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.config/rocks/ouzoo"
end
