class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.53"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.53/lark-cli-1.0.53-darwin-arm64.tar.gz"
      sha256 "f0a1aacaea7a2af3eb15786a5e8fdb96e690124af7f6186eb406c6a46dc5e665"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.53/lark-cli-1.0.53-darwin-amd64.tar.gz"
      sha256 "9cb8a0325aa37971fd470776791dabcea526c3ed62d9f563691fd92c3261e889"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.53/lark-cli-1.0.53-linux-arm64.tar.gz"
      sha256 "bb874ff340b57e28f0bb27f63bc654d7f4d20ce535549d38854aba51c648818a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.53/lark-cli-1.0.53-linux-amd64.tar.gz"
      sha256 "4b2223241074417f61d8b2e174f2647d26a37d0628a89494b6991a1e3f4f954e"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
