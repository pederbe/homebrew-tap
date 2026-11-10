# The Homebrew formula template for the shared pederbe/tap, from the
# release's binary archives. The Release workflow renders it with the
# release's version and SHA256SUMS (render-formula.sh) and attaches the
# result as udpstp.rb; the tap's Update udpstp workflow
# tests and commits it. Users: `brew install pederbe/tap/udpstp`.
class Udpstp < Formula
  desc "IP-Layer Capacity measurement with UDPSTP (RFC 9946)"
  homepage "https://udpstp.com"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/pederbe/udpstp/releases/download/v0.1.3/udpstp-v0.1.3"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "478fead3d59ea7079e00943a9231f251851babe59fbff883c30fae6663227e46"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "879b68e6fa469e057466817c7fea495b0a07a4097a7e8392381502c01e9bfff8"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cab35238293593d218eda4b0813d3cac53e4cd0a669649b6eed44cf829d1bb0f"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "496c709c9b99911c259c01739147214162af6cd68082858b7ebe8a987df85dd6"
    end
  end

  def install
    bin.install "udpstp"
    doc.install "README.md", "CHANGELOG.md", "LICENSE-MIT", "LICENSE-APACHE", "THIRD-PARTY-LICENSES.md"
  end

  test do
    assert_match "udpstp #{version}", shell_output("#{bin}/udpstp --version")
  end
end
