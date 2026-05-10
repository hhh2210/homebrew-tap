class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.27"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.27/lark-cli-1.0.27-darwin-arm64.tar.gz"
      sha256 "3986dadfd6ddfe807bb7f394a98a04b739cf2c7fd05c7b15d4a2f788d10f02d0"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.27/lark-cli-1.0.27-darwin-amd64.tar.gz"
      sha256 "a58226a45c44b562ab80ebd1992b4f71746d629974c367812e13d386109800ce"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.27/lark-cli-1.0.27-linux-arm64.tar.gz"
      sha256 "49152f38c2b74911266dada59baa51829a9615065903223c53b767287edcf696"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.27/lark-cli-1.0.27-linux-amd64.tar.gz"
      sha256 "f7b3f3379bf52303f8f239af2e671362aac04486c7068e49cd88eec55ac47108"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
