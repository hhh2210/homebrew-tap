class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.59"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.59/lark-cli-1.0.59-darwin-arm64.tar.gz"
      sha256 "981c87ed1e5f75c80564b6176cfae6da2ce122292c10bd867f7715ca9333c42d"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.59/lark-cli-1.0.59-darwin-amd64.tar.gz"
      sha256 "14ae008b68722f8e169c5ae52bdbfc04a605a9a5d94b7488988ec83e3c06ce92"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.59/lark-cli-1.0.59-linux-arm64.tar.gz"
      sha256 "b5ef3d4f2548500586b504f002fa4a67c86c62a6705c77a925fd29ec1ecd1e0a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.59/lark-cli-1.0.59-linux-amd64.tar.gz"
      sha256 "e43ac8185eea32ce0f9ec338756d8b9a6a2b17d748aa46473a0aa74958bf8a1a"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
