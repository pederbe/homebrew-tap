class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/releases/download/v0.5.0/fastmash-v0.5.0-aarch64-apple-darwin.tar.gz"
  sha256 "2a6659e6d60f5cf3bb2403953e7631674399a4bc5f410937f21fc8980b5c2916"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/pederbe/fastmash/releases/download/v0.5.0/fastmash-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a796427f78c42f6f925c4cbf1ab5b3b9a83b1f204f06b9e457c8c165a3b3b64a"
    end
  end

  def install
    bin.install "fastmash"
    doc.install "README.md", "CHANGELOG.md", "LICENSE-MIT", "LICENSE-APACHE", "THIRD-PARTY-LICENSES.md"
  end

  test do
    system bin/"fastmash", "--version"
  end
end
