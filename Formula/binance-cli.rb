class BinanceCli < Formula
  desc "Command-line interface for Binance REST APIs"
  homepage "https://github.com/binance/binance-cli"
  url "https://registry.npmjs.org/@binance/binance-cli/-/binance-cli-1.3.0.tgz"
  sha256 "cfafd462dcc16d2ffc3d377c7a417ac5337b9c49e5a74de7923ab90f14b98c00"

  livecheck do
    url :stable
    strategy :npm
  end

  depends_on "node"

  deny_network_access! :test

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/binance-cli"
  end

  test do
    ENV["HOME"] = testpath
    assert_equal version.to_s, shell_output("#{bin}/binance-cli --version").strip
    assert_match "Binance Spot REST API", shell_output("#{bin}/binance-cli --help")
  end
end
