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
      url "https://github.com/larksuite/cli/releases/download/v1.0.94/lark-cli-1.0.94-darwin-arm64.tar.gz"
      sha256 "cdf66d35c950c56f17cc180276c16b8ad4b7241eab715d809114cb57c88a825b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.94/lark-cli-1.0.94-darwin-amd64.tar.gz"
      sha256 "ec53158a51f2d30fefacfb70904f503d5c6e92e934ca98510ad80112d680000e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.94/lark-cli-1.0.94-linux-arm64.tar.gz"
      sha256 "87ddcba89557936958d8dcba4269d02837a32bb605dc0ac9c1aea8d653cbb7a3"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.94/lark-cli-1.0.94-linux-amd64.tar.gz"
      sha256 "60f505be65b43b5e58b01ec671199723483c5f630a03dfdd32d89f7f40f47d53"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
