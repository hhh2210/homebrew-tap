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
      url "https://github.com/larksuite/cli/releases/download/v1.0.87/lark-cli-1.0.87-darwin-arm64.tar.gz"
      sha256 "b4cf7b1b7ff9c3d8c9ac3dd577fd178f3c8a84ec82184a82de809335840d5b20"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.87/lark-cli-1.0.87-darwin-amd64.tar.gz"
      sha256 "40f005dc39e955ad3fa51a05b1a91619f0ccec1e781038fa247058e4c85b02a7"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.87/lark-cli-1.0.87-linux-arm64.tar.gz"
      sha256 "fade9a22d363172a9c18a8287c99c80d6d106a2900f3fce4015e4e156c5fc776"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.87/lark-cli-1.0.87-linux-amd64.tar.gz"
      sha256 "6027b1ddc12440400581bbdf9554850d8e119c7dd400439b1220e7a87b9673c5"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
