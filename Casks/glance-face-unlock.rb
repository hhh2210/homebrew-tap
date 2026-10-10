cask "glance-face-unlock" do
  version "1.2.1"
  sha256 "c331a9c9c711c166cf6a914c9117390dfbea7b607137306858e656969869b107"

  url "https://github.com/hhh2210/glance/releases/download/v#{version}/Glance-Fork-#{version}.zip"
  name "Glance Fork"
  desc "Local face unlock with guided enrollment"
  homepage "https://github.com/hhh2210/glance"

  depends_on macos: :sequoia

  app "Glance Fork.app"

  uninstall quit: "io.github.hhh2210.glance"

  caveats do
    <<~EOS
      Glance Fork is ad-hoc signed and has not been notarized by Apple.
      macOS may block its first launch.
      Grant Camera and Accessibility permissions to Glance Fork separately.
      After an update, you may need to re-grant Accessibility to Glance Fork
      in System Settings > Privacy & Security > Accessibility.
    EOS
  end
end
