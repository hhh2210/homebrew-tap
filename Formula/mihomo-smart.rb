class MihomoSmart < Formula
  desc "Mihomo alpha with the Smart proxy group (vernesong fork)"
  homepage "https://github.com/vernesong/mihomo"
  version "2026.10.12.0231"
  license "GPL-3.0-only"

  # Upstream replaces the assets of one rolling tag on every build. The
  # version is the arm64 asset's upload time; the commit is in the URL.
  if Hardware::CPU.arm?
    url "https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-darwin-arm64-alpha-smart-daf3ad0.gz"
    sha256 "db8b1ba1fa6b54e45b423efab12a593f4109ec15496d360f8f247b1c0a370a2f"
  else
    url "https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-darwin-amd64-compatible-alpha-smart-daf3ad0.gz"
    sha256 "56c4ccb1abeacc340a511542506a4fb3ea3ebb953443c58318f1e1ad6918fcd9"
  end

  livecheck do
    url :stable
    strategy :github_releases do |json|
      release = json.find { |item| item["tag_name"] == "Prerelease-Alpha" }
      asset = release&.dig("assets")&.find do |item|
        item["name"]&.match?(/\Amihomo-darwin-arm64-alpha-smart-\h+\.gz\z/)
      end
      stamp = asset&.dig("updated_at")&.match(/\A(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2})/)
      next if stamp.nil?

      "#{stamp[1]}.#{stamp[2]}.#{stamp[3]}.#{stamp[4]}#{stamp[5]}"
    end
  end

  depends_on :macos

  def install
    # Installed beside homebrew/core's mihomo, which has no Smart group.
    bin.install Dir["mihomo-darwin-*"].fetch(0) => "mihomo-smart"
  end

  test do
    assert_match "alpha-smart", shell_output("#{bin}/mihomo-smart -v")
    (testpath/"config.yaml").write <<~YAML
      proxies:
        - { name: direct-out, type: direct }
      proxy-groups:
        - { name: auto, type: smart, uselightgbm: false, collectdata: false, proxies: [direct-out] }
    YAML
    output = shell_output("#{bin}/mihomo-smart -d #{testpath} -t -f #{testpath}/config.yaml")
    assert_match "test is successful", output
  end
end
