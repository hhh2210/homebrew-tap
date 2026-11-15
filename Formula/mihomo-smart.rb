class MihomoSmart < Formula
  desc "Mihomo alpha with the Smart proxy group (vernesong fork)"
  homepage "https://github.com/vernesong/mihomo"
  version "2026.11.14.1727"
  license "GPL-3.0-only"

  # Upstream replaces the assets of one rolling tag on every build. The
  # version is the arm64 asset's upload time; the commit is in the URL.
  if Hardware::CPU.arm?
    url "https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-darwin-arm64-alpha-smart-c4df732.gz"
    sha256 "b80e04ab945e2b9eb48b2265bcb1df9c09122980d5cd0e0c7718b2768f99571d"
  else
    url "https://github.com/vernesong/mihomo/releases/download/Prerelease-Alpha/mihomo-darwin-amd64-compatible-alpha-smart-c4df732.gz"
    sha256 "11476780810d0fe867377555d28f9cd25506cb84dc0aea5d6d8ba74500713374"
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
