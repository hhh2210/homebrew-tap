class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.65"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.65/lark-cli-1.0.65-darwin-arm64.tar.gz"
      sha256 "9135e0412cf6bcb0ce6e6de3308ba878f6f16a887af46c806bdaa17d7d86e768"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.65/lark-cli-1.0.65-darwin-amd64.tar.gz"
      sha256 "7d8a4539ade2b1bda46936ceae2a73e42a414e444a75b9e2e0f39294b8e61b07"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.65/lark-cli-1.0.65-linux-arm64.tar.gz"
      sha256 "f3f11a2e163b2ea9698ae4c5f923a4fbca28274f44cd0a4689bf7588f229242e"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.65/lark-cli-1.0.65-linux-amd64.tar.gz"
      sha256 "2d8fbd33e79d06efcd7243971d3a4e1a049ad91d04f0ca97214c6730e10c24c8"
    end
  end

  def install
    bin.install "lark-cli"
  end

  def post_install
    system bin/"lark-cli", "update"
  rescue
    opoo "lark-cli installed, but agent skills were not synced. Run `lark-cli update` manually."
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
