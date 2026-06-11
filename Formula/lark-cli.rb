class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.51"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.51/lark-cli-1.0.51-darwin-arm64.tar.gz"
      sha256 "8ec0d3422ea54c81e36044b135714dadd7be2b8846d69e44cc99b9523082f03c"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.51/lark-cli-1.0.51-darwin-amd64.tar.gz"
      sha256 "1026741418164589e0e1b7db42cb8eb920ad5ac275b17e9631eddb33a8f5dbd9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.51/lark-cli-1.0.51-linux-arm64.tar.gz"
      sha256 "3011997357c0c2101dbcaf2ccc13ac4aa2f2b5c748e1d8570c1fa6571690df60"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.51/lark-cli-1.0.51-linux-amd64.tar.gz"
      sha256 "307c5f0b03185da976911d9cf8ca7ccb0854eebc6ead6ae49f5293217161e70c"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
