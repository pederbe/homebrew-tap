class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/releases/download/v0.7.1/fastmash-v0.7.1-aarch64-apple-darwin.tar.gz"
  sha256 "38766bb8d9605a8d0bb202118c1d777ff03f23e753924f4295f38abce630d59f"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/pederbe/fastmash/releases/download/v0.7.1/fastmash-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4d14da3f9e9d30f47b1c4012e6a842230c6437044987d2ff0d020c36c5296ee7"
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
