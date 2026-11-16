class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/releases/download/v0.7.0/fastmash-v0.7.0-aarch64-apple-darwin.tar.gz"
  sha256 "fde6a8b3c5706a282e531cf6b321030dba64a3521599135af206e53c2dd67b5b"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/pederbe/fastmash/releases/download/v0.7.0/fastmash-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6efe270d35b5b3be347ce5e07d8ba8d949160c1a93fbed48ff0a6bc7a9ad5e9d"
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
