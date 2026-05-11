class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.28"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.28/lark-cli-1.0.28-darwin-arm64.tar.gz"
      sha256 "b93acf4e66a6837b56f0814e36bfcd7ac82b97c3cb69ad8836e19b934bf07d35"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.28/lark-cli-1.0.28-darwin-amd64.tar.gz"
      sha256 "092ef3dc2567ea819d67886825a02a71c4cc4f4b494dc580b8c50b8d5eef9871"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.28/lark-cli-1.0.28-linux-arm64.tar.gz"
      sha256 "7feb970255c879505f6a0c12883e8f35b4dcac53420dd6e411334d1184eafe8a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.28/lark-cli-1.0.28-linux-amd64.tar.gz"
      sha256 "f6f60ec53a30270b7d41b66c10db56a4bd1d71607d1c7396c144946bf5bbfba3"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
