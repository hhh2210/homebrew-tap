class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.97/lark-cli-1.0.97-darwin-arm64.tar.gz"
      sha256 "64e856a05c8dfdac5dbecd316766e4b05299f230f54833b674a623df3ac13f1c"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.97/lark-cli-1.0.97-darwin-amd64.tar.gz"
      sha256 "1f5d3899138bc058662a027d0034ed69d21287d83322993afc01fee559b78de0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.97/lark-cli-1.0.97-linux-arm64.tar.gz"
      sha256 "2dec3e362ecce05b535854a0205035bb4ccdb72dbbed9a321890c2089da16bc5"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.97/lark-cli-1.0.97-linux-amd64.tar.gz"
      sha256 "7ce11848724f0b0bc8204012140adbf76fe7c1fc8abd41c1878bc97b7228126b"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
