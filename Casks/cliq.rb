cask "cliq" do
  version "0.3.2"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
