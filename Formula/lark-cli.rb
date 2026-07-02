class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.64"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.64/lark-cli-1.0.64-darwin-arm64.tar.gz"
      sha256 "cdc3855abf55997f183fcf33ec649496ca197418dec98a45fd11faa102e89f95"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.64/lark-cli-1.0.64-darwin-amd64.tar.gz"
      sha256 "707d4b96040a656dc94c6f86c44c081ba0d58f24c12c0ad9d258ebb7babff771"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.64/lark-cli-1.0.64-linux-arm64.tar.gz"
      sha256 "53aa3b3ef1d6e9cafa1e00cca92f0d4804c3ea99da7f8ded00145537f229de5a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.64/lark-cli-1.0.64-linux-amd64.tar.gz"
      sha256 "27ffb3f7c36d31feab0a9f1d670700c355bf8ef34ce237dcb7e205e0d254acc5"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
