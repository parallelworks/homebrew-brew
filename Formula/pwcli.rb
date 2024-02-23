require "formula"
require_relative "../auth_dl.rb"

class Pwcli < Formula
  desc "Parallel Works CLI"
  homepage "https://github.com/parallelworks/homebrew-brew/tree/master"

  #Note: Does not currently support Intel Mac or ARM Linux.

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/parallelworks/core/releases/download/v4.14.6/pwcli-darwin-arm64", :using => GitHubPrivateRepositoryReleaseDownloadStrategy 
    sha256 "61c88eb8a4b09f9f9bd08d77fbd75fb61e3acc0533036ff2f6e86ab648404716"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/parallelworks/core/releases/download/v4.14.6/pwcli-linux-amd64", :using => GitHubPrivateRepositoryReleaseDownloadStrategy 
    sha256 "0acdc0c12fea958be5e5ec9f4e8002ceb4eb6a2a78b1dd7b2522450b693e1555"
  end

  def install
    prefix.install Dir["*"]
    system "mkdir", "#{prefix}/bin"

    if OS.mac? && Hardware::CPU.arm?
      system "mv", "#{prefix}/pwcli-darwin-arm64", "#{prefix}/bin/pw"
    end

    if OS.linux? && Hardware::CPU.intel?
      system "mv", "#{prefix}/pwcli-darwin-amd64", "#{prefix}/bin/pw"
    end
  end

  test do
    system "#{bin}/pw --version"
  end
end