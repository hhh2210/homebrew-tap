class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.38"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.38/lark-cli-1.0.38-darwin-arm64.tar.gz"
      sha256 "da1148121b5df4691d1ef0bf81f4181059cdff9c335f24f764eb3ebe2113bcab"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.38/lark-cli-1.0.38-darwin-amd64.tar.gz"
      sha256 "6ce0d2264362b07f22ddb9e7480b8996e0f5502714bf5558efb5af4df07c89ab"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.38/lark-cli-1.0.38-linux-arm64.tar.gz"
      sha256 "fdc1ff6c224dbf6ae396f6f427a0da653adfde49b564419670e1a96f13ae3fd6"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.38/lark-cli-1.0.38-linux-amd64.tar.gz"
      sha256 "19b2d143417144c4153129bf4a051ce65d71fed860d0845ccf395e3d6e0f527b"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
