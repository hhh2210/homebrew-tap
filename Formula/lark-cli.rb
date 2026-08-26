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
      url "https://github.com/larksuite/cli/releases/download/v1.0.90/lark-cli-1.0.90-darwin-arm64.tar.gz"
      sha256 "894c68176bd4015e8478094ded6d9c7ad76abf9d9cd5679d36b23d0b74d4db02"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.90/lark-cli-1.0.90-darwin-amd64.tar.gz"
      sha256 "d5fac57d8b0b674144a5ff2f1f408d0cca8ec9a1d923ed136d6e08522c3b01f0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.90/lark-cli-1.0.90-linux-arm64.tar.gz"
      sha256 "dd591e9ae956d8cf34bed23901017ab842d25534fe1579e9b9bbabed267864d7"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.90/lark-cli-1.0.90-linux-amd64.tar.gz"
      sha256 "301db5eb6d64b295e8bd366036dd839cc6686471c68e54c2602d274de0bf032a"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
