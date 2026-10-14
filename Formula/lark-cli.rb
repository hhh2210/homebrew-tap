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
      url "https://github.com/larksuite/cli/releases/download/v1.0.98/lark-cli-1.0.98-darwin-arm64.tar.gz"
      sha256 "ee4a3209bbf8b74ea5c00a07d0da89b79f5e7f6abfd518a8b2d78a7a4f7e3f40"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.98/lark-cli-1.0.98-darwin-amd64.tar.gz"
      sha256 "44a4ff98e969385fc4bb4d701735ba319307e50560fa6c4c956178d70ccc3525"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/larksuite/cli/releases/download/v1.0.98/lark-cli-1.0.98-linux-arm64.tar.gz"
      sha256 "f798b26ce4b369d70411945e7f66bbe4382c411bc47d81950a662de7b69b41ed"
    else
      url "https://github.com/larksuite/cli/releases/download/v1.0.98/lark-cli-1.0.98-linux-amd64.tar.gz"
      sha256 "4a12dcb7a0aab25986d8bcd046cb45b08278531a9aac3a12b53cf3d94738fe80"
    end
  end

  def install
    bin.install "lark-cli"
  end

  test do
    assert_match "lark-cli version #{version}", shell_output("#{bin}/lark-cli --version")
  end
end
