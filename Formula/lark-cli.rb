class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.31"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.31/lark-cli-1.0.31-darwin-arm64.tar.gz"
      sha256 "479a281205ed6e96cbe5e414fe6459bd1999022d2471aa95bcda59c25dca9f62"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.31/lark-cli-1.0.31-darwin-amd64.tar.gz"
      sha256 "c1a54d3826cc81c6bd936527239de85d0eed146e5f508bd549506539b96f16c6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.31/lark-cli-1.0.31-linux-arm64.tar.gz"
      sha256 "68b49e6338663978407828dc815596aa52fe7fbccb34a72ec2c65e8a83bf68ad"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.31/lark-cli-1.0.31-linux-amd64.tar.gz"
      sha256 "db679baf4d5986a07f2c3600242f448bb80d215d9515d7423fe1ecc64e8ee90a"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
