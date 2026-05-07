class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.25"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.25/lark-cli-1.0.25-darwin-arm64.tar.gz"
      sha256 "a7765ea6e1f9ccfc8d17a4a03cd2c1856d28640cc2c173b616dfb3ee1e79104b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.25/lark-cli-1.0.25-darwin-amd64.tar.gz"
      sha256 "1f9d61ce373583958042f7d2466072be9f65050e4732749e3301ee16ae2156d2"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.25/lark-cli-1.0.25-linux-arm64.tar.gz"
      sha256 "68499efdf752e028e2010ff828b65409dc600ddd47b2e50b8cd70ca43ae73a5b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.25/lark-cli-1.0.25-linux-amd64.tar.gz"
      sha256 "ed5db1a7e0794446a3d95c0110b3af11245f48288710b2d86645fbca5a8a0724"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
