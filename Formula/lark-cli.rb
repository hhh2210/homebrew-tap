class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.35"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.35/lark-cli-1.0.35-darwin-arm64.tar.gz"
      sha256 "f7f06660e5009e528bf773256a13d3e1fc8104fc8cb2bdcd5f06746f76b5cc41"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.35/lark-cli-1.0.35-darwin-amd64.tar.gz"
      sha256 "307800f656d82b5cdfd06b0fd3c1d8cc624a73e168e4bdb20be2766b22ec3f93"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.35/lark-cli-1.0.35-linux-arm64.tar.gz"
      sha256 "2a9f072f3432d1caf9e1efad8eec3d4b748b21d56454361ff56b8174785721d9"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.35/lark-cli-1.0.35-linux-amd64.tar.gz"
      sha256 "3125da591c0432cea480ccf6f0b323577521fc4a28118204e14fff5edae5080e"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
