class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.42"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.42/lark-cli-1.0.42-darwin-arm64.tar.gz"
      sha256 "d3b1980cc7d31d7273b922bf70fe66025d1bec2dd9f4474d0a899c3c141a4470"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.42/lark-cli-1.0.42-darwin-amd64.tar.gz"
      sha256 "07f6e598430bb40ff4a7895d035522900131377622ed6877f2c8da2123d6d1e6"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.42/lark-cli-1.0.42-linux-arm64.tar.gz"
      sha256 "3096f45deda918da22dcc2aa365230a8d497a07ffc2b4d762c3da8fe61841eee"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.42/lark-cli-1.0.42-linux-amd64.tar.gz"
      sha256 "46bd1f3720cb532d3a64badd8ee3007ff61de18a15db2c891a6efbe90cadbb3e"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
