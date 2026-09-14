cask "cliq" do
  version "0.3.2"
  sha256 "c0a52c6f14b5143d28eaa317af532740f606f678c922c4403f084cf4c1245fca"

  url "https://github.com/partrocks/homebrew-tap/releases/download/cliq-v#{version}/cliq_#{version}_aarch64.tar.gz"
  name "cliq"
  desc "Turn a short natural-language task into ranked shell command options"
  homepage "https://github.com/partrocks/cliq"

  depends_on arch: :arm64
  depends_on :macos

  binary "cliq"
  manpage "cliq.1"

  zap trash: [
    "~/.cache/rocks/cliq",
    "~/.config/rocks/cliq",
  ]
end
