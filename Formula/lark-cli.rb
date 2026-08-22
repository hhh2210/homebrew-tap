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
      url "https://github.com/larksuite/cli/releases/download/v1.0.89/lark-cli-1.0.89-darwin-arm64.tar.gz"
      sha256 "62417d641a2a15fddec9bac0c70f939570d5e2f3fa1410703b93f3284d02d044"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.89/lark-cli-1.0.89-darwin-amd64.tar.gz"
      sha256 "1991736631266a2fa852664562260a2c2665bc9b1cbee35fadb4f6e40958656f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.89/lark-cli-1.0.89-linux-arm64.tar.gz"
      sha256 "9bff1d415e761e431aa12e01b1609c6ab8f84f1d30824fe5182c2c702e8b456b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.89/lark-cli-1.0.89-linux-amd64.tar.gz"
      sha256 "a07a603d29ed58e8b5b0d7395cae10dfabed2b860be31b7134f8bf39705e7cff"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
