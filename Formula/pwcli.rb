require "formula"
require_relative "../auth_dl.rb"

class Pwcli < Formula
  desc "Parallel Works CLI"
  homepage "https://github.com/parallelworks/homebrew-brew/tree/master"

  #if Hardware::CPU.intel?
  url "https://github.com/parallelworks/core/releases/download/v4.10.2/pwcli-darwin-arm64", :using => GitHubPrivateRepositoryReleaseDownloadStrategy 
  sha256 "2505b477d0aa0004a346d8fe043a4e2a07db0d16e48a55ca249fdaeca420974a"

  def install
    system "mkdir", "#{bin}/pw"
    bin.install "pw"
  end

  test do
    system "#{bin}/pw --version"
  end
end