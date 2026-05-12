class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.29"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.29/lark-cli-1.0.29-darwin-arm64.tar.gz"
      sha256 "a83c0464d113f34a7a0a4f715f5b92cd6c3da470b71e16b06ae517cbb5179919"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.29/lark-cli-1.0.29-darwin-amd64.tar.gz"
      sha256 "73069ab0d4207a4b69fe0401c46d4449737d9d43bc8b6bd3748e8c2c17784826"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.29/lark-cli-1.0.29-linux-arm64.tar.gz"
      sha256 "66c1d0700652b59c71afbfd3756d4311b1eb0af53ff9dcfea658e6b9a027afc6"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.29/lark-cli-1.0.29-linux-amd64.tar.gz"
      sha256 "b5256ac302ad38d79719ad6fbd6e742a3efda97a6472543af45cbe937e99cee5"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
