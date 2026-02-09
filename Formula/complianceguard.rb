# Homebrew Formula for ComplianceGuard
# This file should be placed in your homebrew-tap repository
# at Formula/complianceguard.rb

class Complianceguard < Formula
  desc "ComplianceGuard - Cross-platform CLI application"
  homepage "https://github.com/weekendsprints/ComplianceGuard"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-0.0.1-darwin-arm64.tar.gz"
      sha256 "52ace32cb6341a80e6720d28e9af49b3bc35f5abb0e7ff69d7aeeb1a0ec93d14"
    else
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-0.0.1-darwin-amd64.tar.gz"
      sha256 "84a776bdcb62512d321a4e7049b9b3fdc58d3265eb01c7e53352033aad8ef9af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-0.0.1-linux-arm64.tar.gz"
      sha256 "72fa31e860d13f36cc956c63e557df9351334727a3e970c2914ee5255a8dd662"
    else
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-0.0.1-linux-amd64.tar.gz"
      sha256 "56279abf4bd9768447e851b27bd42cbc62d33ee9d093fd093ce19daf793de281"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "complianceguard-darwin-arm64" => "complianceguard"
      else
        bin.install "complianceguard-darwin-amd64" => "complianceguard"
      end
    else
      if Hardware::CPU.arm?
        bin.install "complianceguard-linux-arm64" => "complianceguard"
      else
        bin.install "complianceguard-linux-amd64" => "complianceguard"
      end
    end
  end

  test do
    system "#{bin}/complianceguard", "--version"
  end
end
