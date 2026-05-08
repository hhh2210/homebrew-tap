class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.26"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.26/lark-cli-1.0.26-darwin-arm64.tar.gz"
      sha256 "a02c688086180b995fe8bd1a98ae7c1f033e3663a187c283f5e962c9ca566e85"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.26/lark-cli-1.0.26-darwin-amd64.tar.gz"
      sha256 "c61883540bf50360e42bd07fde9058b2ef614d9b799f5cd8ab16d4fc1cb9cbd1"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.26/lark-cli-1.0.26-linux-arm64.tar.gz"
      sha256 "dbb506264c7af2f2d40d6acb03561def21f4f7fb963e2064c35affe55fe436c8"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.26/lark-cli-1.0.26-linux-amd64.tar.gz"
      sha256 "dadf7eb96313ec90300122c1fa40e949cb9a823ef2fab0537052ba44f683b702"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
