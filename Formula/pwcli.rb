require "formula"
require_relative "../auth_dl.rb"

class Pwcli < Formula
  homepage "https://github.com/parallelworks/homebrew-brew/tree/master"
  url "https://github.com/parallelworks/core/releases/download/v4.10.2/pwcli-darwin-arm64", :using => GitHubPrivateRepositoryReleaseDownloadStrategy 
  sha256 "2505b477d0aa0004a346d8fe043a4e2a07db0d16e48a55ca249fdaeca420974a"

  def install
    system "mv", "pwcli-darwin-arm64", "#{bin}/pw"
    system "chmod", "+x", "#{bin}/pw" 
    #system "./configure", "--prefix=#{prefix}"
    #system "make", "install"
  end

  test do
      system "#{bin}/pw --help"
  end
end