class Xexplain < Formula
  desc "System Intelligence CLI for macOS - btop-like monitor with AI insights"
  homepage "https://github.com/xdev-asia-labs/xExplain"
  url "https://github.com/xdev-asia-labs/xExplain/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "921cf94ef26c59b718c2f9278f53cb0daa368d2827144b9f5a8cc56145c3361a"
  license "MIT"
  head "https://github.com/xdev-asia-labs/xExplain.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xExplain-CLI" => "xexplain"
  end

  test do
    assert_match "xExplain CLI", shell_output("#{bin}/xexplain --help")
  end
end
