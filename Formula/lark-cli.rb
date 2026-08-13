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
      url "https://github.com/larksuite/cli/releases/download/v1.0.86/lark-cli-1.0.86-darwin-arm64.tar.gz"
      sha256 "b3f1ddd38c46a5397c7ae5f1ad6fcb8c8c2d76736d89587eda03bf5706c8571c"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.86/lark-cli-1.0.86-darwin-amd64.tar.gz"
      sha256 "8f4055e93bc2469388f0c52cefa5c26a27fbd056cb15d73f2092801e2c5055dc"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.86/lark-cli-1.0.86-linux-arm64.tar.gz"
      sha256 "fcea7fef8c4b8f7a144beaa388049c2ff43685cecdcd5a2adf550a9eff1d131d"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.86/lark-cli-1.0.86-linux-amd64.tar.gz"
      sha256 "91d05829c78bfb77eec46d89449aa2786e81f55f7a99b9788ee5d68d62727cfa"
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
