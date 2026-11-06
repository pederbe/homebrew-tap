# The Homebrew formula template for the shared pederbe/tap, from the
# release's binary archives. The Release workflow renders it with the
# release's version and SHA256SUMS (render-formula.sh) and attaches the
# result as udpstp.rb; the tap's Update udpstp workflow
# tests and commits it. Users: `brew install pederbe/tap/udpstp`.
class Udpstp < Formula
  desc "IP-Layer Capacity measurement with UDPSTP (RFC 9946)"
  homepage "https://udpstp.com"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/pederbe/udpstp/releases/download/v0.1.2/udpstp-v0.1.2"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "dfd1f8b813bb762a59fe225a23712b80d31fd9bd3cc4fd180246387836b5a81c"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "bea3a90e8b6179cceeb46202bad65d9fd20da5d380c07ca8203124d40d7050bb"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48816447ac6c6469a83837b243b50dfd0a42f9328b324c8cb2bd0098351f617f"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d1de52dbc4af0b686f842e157e95ef7dd737dc480467baf2ccaf3bb0a1472c0"
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
