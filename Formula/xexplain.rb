class Xexplain < Formula
  desc "System Intelligence CLI for macOS - btop-like monitor with AI insights"
  homepage "https://github.com/xdev-asia-labs/xExplain"
  url "https://github.com/xdev-asia-labs/xExplain/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "25e0c7fadae2c67fc7f60214c8caf6914a4ed50f50841de389467535173bb680"
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
