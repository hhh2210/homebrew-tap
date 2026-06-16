class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.54"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.54/lark-cli-1.0.54-darwin-arm64.tar.gz"
      sha256 "3b971f98dc9f142751b143107929669de5bd7cadd67e4d4077b5435c4e7aeefe"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.54/lark-cli-1.0.54-darwin-amd64.tar.gz"
      sha256 "7cd3f875064797ec2430da7faf20376a4be881abee1fffc216facbd83ed43829"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.54/lark-cli-1.0.54-linux-arm64.tar.gz"
      sha256 "10aa0383711dfe3f0f8d6724decab8944661107b96f2536925979bf246d1e21b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.54/lark-cli-1.0.54-linux-amd64.tar.gz"
      sha256 "ea9e95c657c87853c738226088f259319bef056b3819944361bfccddcbaa5156"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
