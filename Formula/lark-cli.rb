class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.99/lark-cli-1.0.99-darwin-arm64.tar.gz"
      sha256 "f24f4106d1b0b1a4ee9a24ec0953dee6e518476bbe3d9758f78a732477525b21"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.99/lark-cli-1.0.99-darwin-amd64.tar.gz"
      sha256 "31f900409082728761346a94b7b81038c78b302883b69c36b849b23d843d7de1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.99/lark-cli-1.0.99-linux-arm64.tar.gz"
      sha256 "2837145e72922d558538494d0da30ac6c509681fc0791f8818f4ddb87f5125b4"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.99/lark-cli-1.0.99-linux-amd64.tar.gz"
      sha256 "fd29f51030dde6919b6ca9173bc87852d3846f253d198022ea2d9ee63527b945"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
