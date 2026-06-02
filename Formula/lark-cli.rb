class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.45"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.45/lark-cli-1.0.45-darwin-arm64.tar.gz"
      sha256 "9caed7157c9f0f3e2198ce15c8a50b9f8b81c140783113046fe36e9f48852c7c"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.45/lark-cli-1.0.45-darwin-amd64.tar.gz"
      sha256 "66801df0d46dc3538940c5f69d2c7f1f83f8b7b38f9986d742dcad1a6f0eda98"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.45/lark-cli-1.0.45-linux-arm64.tar.gz"
      sha256 "b493b288c3bb261401f42c8e2b55d65ac65a4168fc5278a19c9ed992bef50010"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.45/lark-cli-1.0.45-linux-amd64.tar.gz"
      sha256 "12d43b72a2751dd52091b97ea808b0db12fd01fcfdc585620149329eca43c819"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
