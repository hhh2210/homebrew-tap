class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.41"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.41/lark-cli-1.0.41-darwin-arm64.tar.gz"
      sha256 "5ed74939c3edb686957d7a56991a45a9c9c290b789079a4c6f12aa69527f7ca3"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.41/lark-cli-1.0.41-darwin-amd64.tar.gz"
      sha256 "e3c09546b63cc84419df22671d8c940c0eeb17e2d0e6c64536e980553315fa49"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.41/lark-cli-1.0.41-linux-arm64.tar.gz"
      sha256 "d6fadb7265327147e0fb608c35891fffc648c0fc40c4907b809ed18477c584a1"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.41/lark-cli-1.0.41-linux-amd64.tar.gz"
      sha256 "f2593ca0fa03fd085a050bc938b76808b42afb6c8d9f6dab6c9b995412b9c1c0"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
