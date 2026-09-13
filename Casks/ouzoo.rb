cask "ouzoo" do
  version "0.2.9"
  sha256 "36e0b7319e580be1f66604703fef2ae6ba932711a964c2eccfde4607f129253d"

  url "https://ouzoo.app/releases/ouzoo-v#{version}/brew.dmg"
  name "Ouzoo"
  desc "Identity-aware link router for macOS"
  homepage "https://ouzoo.app/"

  depends_on arch: :arm64
  depends_on :macos

  app "Ouzoo.app"

  zap trash: "~/.config/rocks/ouzoo"
end
