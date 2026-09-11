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
      url "https://github.com/larksuite/cli/releases/download/v1.0.95/lark-cli-1.0.95-darwin-arm64.tar.gz"
      sha256 "7ae7241b7de5ebfe86aa6b2b24af3600bd5019ec5b6206ea3bfdc0894f6fd925"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.95/lark-cli-1.0.95-darwin-amd64.tar.gz"
      sha256 "b8b817e7ffe793c9be2579e0b3f9165610b01ca3d425a7b8ee6fb4d528dc6cef"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.95/lark-cli-1.0.95-linux-arm64.tar.gz"
      sha256 "063012a63bb22479855e335d922cc588b883e00d115de51da76a8ffe22db987a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.95/lark-cli-1.0.95-linux-amd64.tar.gz"
      sha256 "7da92d426b7d000908c76a36b87a7d0357c270debf4c7149bbc6010b20d2541e"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
