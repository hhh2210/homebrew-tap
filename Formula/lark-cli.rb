class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.46"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.46/lark-cli-1.0.46-darwin-arm64.tar.gz"
      sha256 "51da594fbe9f3614c16431dddb0e5f1b959a118f4438de64e725ffed709f3d39"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.46/lark-cli-1.0.46-darwin-amd64.tar.gz"
      sha256 "5b1d24a8b3462abb73b0bc74e531467808ed110d0d54aad4cc614bc22beecf43"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.46/lark-cli-1.0.46-linux-arm64.tar.gz"
      sha256 "577b056a0b8c0f5b55820f915d91ce94398507ab6d83552db22ee131a713cb10"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.46/lark-cli-1.0.46-linux-amd64.tar.gz"
      sha256 "e4ca7965caabf64216dc6b493d94be01891937ca9cafb2dffda57af1983eccc5"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
