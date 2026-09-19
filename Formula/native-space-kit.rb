class NativeSpaceKit < Formula
  desc "Native macOS Space control with a C API and JSON CLI"
  homepage "https://github.com/Fjx-dylanZ/native-space-kit"
  url "https://github.com/Fjx-dylanZ/native-space-kit/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b344cd5f6d3bbac217081feb8cbb48f468db7c8e72e8c0c51c081848586c7d5f"
  license "MIT"
  revision 1

  depends_on :macos

  # Keep the merged display selectors until the next upstream release includes them.
  patch do
    url "https://github.com/Fjx-dylanZ/native-space-kit/commit/639d5b21ba89349b03c3073a189adbf6d9b69f6f.patch?full_index=1"
    sha256 "1d1d1709c3480b8c069f8016710181ac23bc251a854974170a2927879ae4dc06"
  end

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install "build/nsk"
    lib.install "build/libnative-space-kit.a"
    include.install "include/native_space_kit.h"
    pkgshare.install "examples/list_spaces.c"
  end

  test do
    assert_equal version.to_s, JSON.parse(shell_output("#{bin}/nsk --version"))["version"]
    assert_match "Usage: nsk", shell_output("#{bin}/nsk --help")
    assert_match "--display DISPLAY", shell_output("#{bin}/nsk --help")
    error = JSON.parse(shell_output("#{bin}/nsk activate 0 2>&1", 2)).fetch("error")
    assert_equal "invalid_argument", error.fetch("code")
    assert_equal false, error.fetch("request_may_have_applied")

    # Verify the installed public header and static library without a GUI session.
    (testpath/"consumer.c").write <<~C
      #include <native_space_kit.h>
      #include <string.h>
      int main(void) {
        nsk_error error;
        nsk_error_clear(&error);
        return error.status != NSK_OK || strcmp(nsk_status_name(NSK_OK), "ok");
      }
    C
    system ENV.cc, "consumer.c", "-I#{include}", "-L#{lib}", "-lnative-space-kit",
           "-ObjC", "-lobjc", "-framework", "Cocoa", "-o", "consumer"
    system "./consumer"
  end
end
