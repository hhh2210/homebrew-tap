class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.60"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.60/lark-cli-1.0.60-darwin-arm64.tar.gz"
      sha256 "3c9ae7a6f98a13e4f429add6f845f25b4099e9275e56fe0b82b587bad8d633f6"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.60/lark-cli-1.0.60-darwin-amd64.tar.gz"
      sha256 "5a42a244cd3ae95725514f1f8d264f95a82f99d20f769fc27fdece44b7c38b6d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.60/lark-cli-1.0.60-linux-arm64.tar.gz"
      sha256 "66e279ea24fc58238a753bac3c8422b8efb05be9c47ceab1e89491aa77f90238"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.60/lark-cli-1.0.60-linux-amd64.tar.gz"
      sha256 "006a4508d4a1b2b2c474e43b2f44e443f8d46d314ac548994c2a9a79e3266382"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
