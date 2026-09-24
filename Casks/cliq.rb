cask "cliq" do
  version "0.5.2"
  sha256 "cdf66266dafa8eea8cc7efb0e5342a2a9a7c6ab6eda8bf7d65fee8051b6b2d1f"

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
