class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.63"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.63/lark-cli-1.0.63-darwin-arm64.tar.gz"
      sha256 "cf30e294d259644263b1efe73f0d699439eeae2d78ef38580d2ba065611fc8a9"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.63/lark-cli-1.0.63-darwin-amd64.tar.gz"
      sha256 "22a06f48a4529c08a020ab8afe279f52905ab3cf13c839967ef1e6a533e3adf5"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.63/lark-cli-1.0.63-linux-arm64.tar.gz"
      sha256 "e24c3e44a7af29a2764813b717b15940c9fbf6b46d7c11fe0e0fd5be6bc90b2b"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.63/lark-cli-1.0.63-linux-amd64.tar.gz"
      sha256 "d0cdc77649f51ff436d235383131f0fa71e35b04fc2964811d7228964c56d095"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
