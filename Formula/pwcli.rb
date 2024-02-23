require "formula"
require_relative "../auth_dl.rb"

class Pwcli < Formula
  desc "Parallel Works CLI"
  homepage "https://github.com/parallelworks/homebrew-brew/tree/master"

  #What if Hardware::CPU.intel?
  url "https://github.com/parallelworks/core/releases/download/v4.14.6/pwcli-darwin-arm64", :using => GitHubPrivateRepositoryReleaseDownloadStrategy 
  sha256 "61c88eb8a4b09f9f9bd08d77fbd75fb61e3acc0533036ff2f6e86ab648404716"

  def install
    prefix.install Dir["*"]
    system "mkdir", "#{prefix}/bin"
    system "mv", "#{prefix}/pwcli-darwin-arm64", "#{prefix}/bin/pw"
  end

  test do
    system "#{bin}/pw --version"
  end
end