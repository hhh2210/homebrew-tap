class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.56"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.56/lark-cli-1.0.56-darwin-arm64.tar.gz"
      sha256 "229f02e97992a802d1df311b9580e14100822e8295b955280660c27cdbb4eff0"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.56/lark-cli-1.0.56-darwin-amd64.tar.gz"
      sha256 "266db83c5794cc720f0b6275d7df1c18ba312eb67931b4c721f66d101b4c424e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.56/lark-cli-1.0.56-linux-arm64.tar.gz"
      sha256 "bf95085ed20f67a3bbff9691c76b509bf299b2879fe7f0f6cbc7e5cf860ee041"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.56/lark-cli-1.0.56-linux-amd64.tar.gz"
      sha256 "93c1254889ebf0a3a562869515af15188075a95bbe9a15e5711d9c9a4af4d8c2"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
