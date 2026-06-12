class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.52"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.52/lark-cli-1.0.52-darwin-arm64.tar.gz"
      sha256 "bf75766fb9f262a7fae7a46645ed2493086fc0ccd7df786a33ad8191e0ca80e6"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.52/lark-cli-1.0.52-darwin-amd64.tar.gz"
      sha256 "6b85a4ff5e7ced55f0fbfdeb0b9ca122518a3cffef09444dce2dbae2db30b379"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.52/lark-cli-1.0.52-linux-arm64.tar.gz"
      sha256 "6b99b4927c00a24e3271e55a2ba297cdb20a03d8092d0abbb1408420b1355481"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.52/lark-cli-1.0.52-linux-amd64.tar.gz"
      sha256 "5f3eac829ec2d05affe8fbf121b3a86d2f09ef6570dbafcf1f3c953d47ab1322"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
