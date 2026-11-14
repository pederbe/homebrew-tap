class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/releases/download/v0.6.0/fastmash-v0.6.0-aarch64-apple-darwin.tar.gz"
  sha256 "f190ca919d5a43140fb65f5bd09ef9f91789b10e5679aea5269ee34902f0c125"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/pederbe/fastmash/releases/download/v0.6.0/fastmash-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "710d5543f467a1910c9cbd9f96c096a9541595f9fb0cecaf5dc94ebdc3a35369"
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
