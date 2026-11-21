# The Homebrew formula template for the shared pederbe/tap, from the
# release's binary archives. The Release workflow renders it with the
# release's version and SHA256SUMS (render-formula.sh) and attaches the
# result as udpstp.rb; the tap's Update udpstp workflow
# tests and commits it. Users: `brew install pederbe/tap/udpstp`.
class Udpstp < Formula
  desc "IP-Layer Capacity measurement with UDPSTP (RFC 9946)"
  homepage "https://udpstp.com"
  license any_of: ["MIT", "Apache-2.0"]

  base = "https://github.com/pederbe/udpstp/releases/download/v0.4.0/udpstp-v0.4.0"

  on_macos do
    on_arm do
      url "#{base}-aarch64-apple-darwin.tar.gz"
      sha256 "2185a7546d8b692fe15e2558dbea68f51c041b3c95ef45adf8f204d4e5db9cba"
    end
    on_intel do
      url "#{base}-x86_64-apple-darwin.tar.gz"
      sha256 "a51ccc41772cc81cff000c197ae0ea754e934190338ceca61b4033e8a001690c"
    end
  end

  on_linux do
    on_arm do
      url "#{base}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea6d0058e3c5dbd3eeabb51b6d2d3b62170b65bf7d76e4032f0043f4931d0a1b"
    end
    on_intel do
      url "#{base}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e099ac331e5dbb376dc52d4a7e552794e155718d2911d64ec50119d13e04c894"
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
