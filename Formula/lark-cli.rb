class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.44"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.44/lark-cli-1.0.44-darwin-arm64.tar.gz"
      sha256 "2287970779800035ddf9c558a4e70b929108e895b9dd23db7c99e23054d1d8aa"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.44/lark-cli-1.0.44-darwin-amd64.tar.gz"
      sha256 "be3159a8a5b3454add18bcdc142158d42d4c826169b185258dee689448691c54"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.44/lark-cli-1.0.44-linux-arm64.tar.gz"
      sha256 "7087c3c0b6fb0bd8bd629f80ce7c43d3a68eae939eb7d63df8a9e34c5e23f38d"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.44/lark-cli-1.0.44-linux-amd64.tar.gz"
      sha256 "0e7e0e59b6cb223052ebdd9e5b642dc8f316968e7a24fb0a4cfb426fd4e577b4"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
