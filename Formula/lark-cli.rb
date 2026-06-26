class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.58"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.58/lark-cli-1.0.58-darwin-arm64.tar.gz"
      sha256 "0a0e2009d83887f04eb6db523c52825501b05d38e47b901b449f745e67920dc4"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.58/lark-cli-1.0.58-darwin-amd64.tar.gz"
      sha256 "eebb2ed73de1c72596bfde297a3e9bd1ff0b80d608fa6c6b82c7f1101500d8dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.58/lark-cli-1.0.58-linux-arm64.tar.gz"
      sha256 "e2cc0e90fa591a15239318c0d45180e181bbb72a238e4b733cd0f792dc8d861a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.58/lark-cli-1.0.58-linux-amd64.tar.gz"
      sha256 "8914bd6c2040d927fd7e03370dd9207108651836242b111db32713bb92951349"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
