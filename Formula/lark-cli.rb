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
      url "https://github.com/larksuite/cli/releases/download/v1.0.100/lark-cli-1.0.100-darwin-arm64.tar.gz"
      sha256 "d068a27f608335016a8a7fb1b3cd1fccfb96bda92075a027e2bf1c4c23134e30"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.100/lark-cli-1.0.100-darwin-amd64.tar.gz"
      sha256 "7f5d442e5da3ae62b03a5b552880b651637b16b2eed91b588afaca6d72a6643a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.100/lark-cli-1.0.100-linux-arm64.tar.gz"
      sha256 "166e95ffaec34f82123f50316480250329884c09e71a6f92313047e2c5c3fa5d"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.100/lark-cli-1.0.100-linux-amd64.tar.gz"
      sha256 "cd7363f731c9e5dd2becd909837922cffea8aad229d581a84eb13c6aa0ce6808"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
