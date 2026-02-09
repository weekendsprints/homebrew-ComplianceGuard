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
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-darwin-arm64.tar.gz"
      sha256 "cca6f626112dd8d70ea431a29de62ae18e251d428bbde4d32ee8649d57fb9f75"
    else
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-darwin-amd64.tar.gz"
      sha256 "efb4d774407a3a079dc04988a3d05f0989ae5291d732623d2d244f4a964e583b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-linux-arm64.tar.gz"
      sha256 "6250edd25a0c8088d548ccb9ea07f6fc3d78c924a9c23fdffe2458cc1d71166f"
    else
      url "https://github.com/weekendsprints/ComplianceGuard/releases/download/v0.0.1/complianceguard-linux-amd64.tar.gz"
      sha256 "a8c7684e2dac533421fdf4af6c33bb0aa2aa66e857d302aec0d44fae32f2de53"
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
