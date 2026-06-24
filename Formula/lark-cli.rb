class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.57"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.57/lark-cli-1.0.57-darwin-arm64.tar.gz"
      sha256 "82509aadf08480a4425c8d7ca588649090dbc312c6cb0b7dc90b5d13848cdefe"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.57/lark-cli-1.0.57-darwin-amd64.tar.gz"
      sha256 "5ff67490c9f80fbc6a7d28bd5da959a47566a1d388c364e92edf08f86bb98fd9"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.57/lark-cli-1.0.57-linux-arm64.tar.gz"
      sha256 "fee3a490bd150ce67da8bac117c4d7ae42e08d460f9269d7a37d0f4e054f734d"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.57/lark-cli-1.0.57-linux-amd64.tar.gz"
      sha256 "ff61a0f8f8114418e76e88a8a7d852e7f33397a52ebd97bf58d62c0ed79f9c4d"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
