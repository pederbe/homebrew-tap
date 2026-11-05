# The Homebrew formula template for the shared pederbe/tap, from the
# release's binary archives. The Release workflow renders it with the
# release's version and SHA256SUMS (render-formula.sh) and attaches the
# result as udpstp.rb; the tap's Update udpstp workflow
# tests and commits it. Users: `brew install pederbe/tap/udpstp`.
class Udpstp < Formula
  desc "IP-Layer Capacity measurement with UDPSTP (RFC 9946)"
  homepage "https://udpstp.com"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/pederbe/udpstp/releases/download/v0.1.1/udpstp-v0.1.1"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "6a4fddd088cb8e63fd992015c63de02189686c759f6b46e1f6ca94d041d7052f"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "ed9c1227db2e11ea1880c78ce34b37d108d2d5a71a0308fd6d460e2e2df05641"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "573dcacf39fd02382435e27b022559cb343f333229a3ad5c9829081683b65d64"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7def7cadacdbd593dafaf366e6c365eca412c0199d084727504ac0e37aee744"
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
