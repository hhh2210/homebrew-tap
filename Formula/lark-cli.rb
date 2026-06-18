class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.55"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.55/lark-cli-1.0.55-darwin-arm64.tar.gz"
      sha256 "d2e3d8cf0b055144606904b503ae1379e3d50a6dac90b0643912fd2e9072c1f2"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.55/lark-cli-1.0.55-darwin-amd64.tar.gz"
      sha256 "575be44bf803a94f81b5fb30bb8653841e4a4c9b1931a5d62adf4807dbac06aa"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.55/lark-cli-1.0.55-linux-arm64.tar.gz"
      sha256 "b5ca0b25d6e87744c38280b837a6473d01fb063c3598ec5beaf6051a803c3dfb"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.55/lark-cli-1.0.55-linux-amd64.tar.gz"
      sha256 "d345e54527b37575d33e0b860550d4e49034c97a193a5b4810fb684d247677f9"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
