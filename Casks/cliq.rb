cask "cliq" do
  version "0.5.5"
  sha256 "7656fd10679c56a8ed3452a1836ce5c157eb8026964f7cb6a82a9f7b5d057ca0"

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
