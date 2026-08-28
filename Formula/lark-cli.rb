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
      url "https://github.com/larksuite/cli/releases/download/v1.0.92/lark-cli-1.0.92-darwin-arm64.tar.gz"
      sha256 "abb1b96eee5ad32da4e12f434e44d48a9e01ebb0e81772419ac0347f91c34265"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.92/lark-cli-1.0.92-darwin-amd64.tar.gz"
      sha256 "421b36f95966028fb047231cb6351c4224a0fdcb076d2bc434d4aed1bb6d1891"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.92/lark-cli-1.0.92-linux-arm64.tar.gz"
      sha256 "683546b6754c780e0f828e87cb00ccf7c0710798a9f1ddb8c6b956afbfb570ae"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.92/lark-cli-1.0.92-linux-amd64.tar.gz"
      sha256 "ef0e19799c1edd94eb52d3bb5d587e00d0a2898e0a4b407a1b8dc66d56181ef1"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
