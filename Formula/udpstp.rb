# The Homebrew formula template for the shared pederbe/tap, from the
# release's binary archives. The Release workflow renders it with the
# release's version and SHA256SUMS (render-formula.sh) and attaches the
# result as udpstp.rb; the tap's Update udpstp workflow
# tests and commits it. Users: `brew install pederbe/tap/udpstp`.
class Udpstp < Formula
  desc "IP-Layer Capacity measurement with UDPSTP (RFC 9946)"
  homepage "https://udpstp.com"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/pederbe/udpstp/releases/download/v0.3.0/udpstp-v0.3.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "67023d1b949024c9e75846dec3cfab31fa23402efca5ddde653f2238a1de6393"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "5c44e2498751f66f327f772277a1bcfeb9eb3bb059f19dd0ae6d855cafd9aaae"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55d20fd228ee987188ce2a31438f2c7986fb8f3865ad686cf6fc3f04728f0eaa"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "522967242132a3584beed3d1e8e2fbaf88d07e4982d06d99f2c319df34aaea22"
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
