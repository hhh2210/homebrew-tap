class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.32"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.32/lark-cli-1.0.32-darwin-arm64.tar.gz"
      sha256 "91d7d2e7ed749a608ca44ca773e198d58f35aee7e3a1368eba19b1f1920f5f79"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.32/lark-cli-1.0.32-darwin-amd64.tar.gz"
      sha256 "f416aaec401bd28fad385b0c254dbe3c50e7c78d5b06c2ed4236933c8cfcbb59"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.32/lark-cli-1.0.32-linux-arm64.tar.gz"
      sha256 "9523ad4a95224ae739221f07f2e1ff1313098323cd9fb43dc135aefe669af3ae"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.32/lark-cli-1.0.32-linux-amd64.tar.gz"
      sha256 "9fb554e14bc4a5751d75c5f14d61080efe47a551e4589d15e9a2dec265704c05"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
