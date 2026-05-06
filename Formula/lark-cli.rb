class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.24"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.24/lark-cli-1.0.24-darwin-arm64.tar.gz"
      sha256 "bf1050f31d2a301f7cf890aad67aa3a7daeec9e7ec915bb90efbeab632498996"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.24/lark-cli-1.0.24-darwin-amd64.tar.gz"
      sha256 "f61b3c34ba952e005060f814bc51c4b9a2377103a611f4d90d1369c82113cf1e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.24/lark-cli-1.0.24-linux-arm64.tar.gz"
      sha256 "d9dd61f805e8f0b1dbb907c1a6f4b910fe510251dddbc9aa5f315d610309cee0"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.24/lark-cli-1.0.24-linux-amd64.tar.gz"
      sha256 "7d41ac2da3cf985c639a9a675610da7e0e0910b91fbb0f9a775d3265b926240d"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
