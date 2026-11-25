class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/releases/download/v0.7.2/fastmash-v0.7.2-aarch64-apple-darwin.tar.gz"
  sha256 "f24b57b31837e234949d6dfbd1fe722623f2ea0a3d92b0d19286191f3b54b45c"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
    on_intel do
      url "https://github.com/pederbe/fastmash/releases/download/v0.7.2/fastmash-v0.7.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ebdc9c1a5e78d7ade29d109dedc16f819627092d8f57ef40b86cc6f8639b195d"
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
