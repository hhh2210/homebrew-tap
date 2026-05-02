class LarkCli < Formula
  desc "Lark/Feishu CLI tool"
  homepage "https://github.com/larksuite/cli"
  version "1.0.23"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.23/lark-cli-1.0.23-darwin-arm64.tar.gz"
      sha256 "fa741daf946b494548b92828dc1ba55661080468e0bfa238a38e594705656698"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.23/lark-cli-1.0.23-darwin-amd64.tar.gz"
      sha256 "aa8cb7e52f79ee73eaa3dee30becbc84be290cb22614528ec459f06ed591992f"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.23/lark-cli-1.0.23-linux-arm64.tar.gz"
      sha256 "e216f85f25a102bfeac4d6af22d5754140a0838c6462f56ea0b41dc35e51012a"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.23/lark-cli-1.0.23-linux-amd64.tar.gz"
      sha256 "513c1e5e6c717cc06d27360dff12cc86e979b78363b896f6e35ae99e82dddff2"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
