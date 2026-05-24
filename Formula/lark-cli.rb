class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.39"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.39/lark-cli-1.0.39-darwin-arm64.tar.gz"
      sha256 "5cc74c0e742b8c6ef3b328fbd40afa88eb3a5e4c3279d4651df1ee45a61969c2"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.39/lark-cli-1.0.39-darwin-amd64.tar.gz"
      sha256 "e6802b81135b6467533ea6b17efa03796c3fb8c4cde6d71afef7730d9f9fe452"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.39/lark-cli-1.0.39-linux-arm64.tar.gz"
      sha256 "f70375faa020121ea5a765574f88ca5b3671a5a821f6672559cc0b49045a26df"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.39/lark-cli-1.0.39-linux-amd64.tar.gz"
      sha256 "e86f530989bb8573dbe481761e233bda4e6265a012f85f6a59bb977acdb857dc"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
