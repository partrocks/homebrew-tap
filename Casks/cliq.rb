cask "cliq" do
  version "0.5.7"
  sha256 "76865ed5fc60e55997c653feaa049362df9fe144af71f0d192742c0d7f7c1df7"

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
