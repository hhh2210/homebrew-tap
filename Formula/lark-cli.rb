class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.30"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.30/lark-cli-1.0.30-darwin-arm64.tar.gz"
      sha256 "55a339e558a466d1c47e962564cf9f0149baf782a1c82d4aac6adb4cea5e6485"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.30/lark-cli-1.0.30-darwin-amd64.tar.gz"
      sha256 "8312449a32a2a063b396e392d716813711f73dade56f8a0a4870981e90e7e157"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.30/lark-cli-1.0.30-linux-arm64.tar.gz"
      sha256 "ac493bbd7ae28e647811120b30a6eb80c939179d594ed33389449445b1ce7ac9"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.30/lark-cli-1.0.30-linux-amd64.tar.gz"
      sha256 "f5a49e503e308ece32b1e80adc84e0275f68ba538d804d064d82ced5b07a41b6"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
