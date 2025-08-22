class Md < Formula
  desc "Terminal-based markdown viewer"
  homepage "https://github.com/getangry/md"
  url "https://github.com/getangry/md/releases/download/v1.0.0/md-v1.0.0-darwin-arm64.tar.gz"
  sha256 "sha256:5f5b5acae2b2b65b1d23baaeaa6f29fb6612761774272b926100301fbfae2bd7"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/md --version 2>&1", 1)
  end
end
