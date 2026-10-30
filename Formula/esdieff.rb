class Esdieff < Formula
  desc "An SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    depends_on arch: :arm64
    url "https://github.com/pederbe/esdieff/releases/download/v0.2.0/esdieff-aarch64-apple-darwin.tar.xz"
    sha256 "c888799104974f8beb42004ebd3099011dcf66c035b6aca47dda2ae5a370b30d"
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.2.0/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5f18cc3001bbb8852221d2bfc0c902bd096aa39882987d398d8e29b321ee38fc"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.2.0/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2d8b4b5c422b13d4b2a524630bd0f4689006517ee98dad23a6203e9f3b212518"
    end
  end

  def install
    bin.install "esdieff"
    doc.install "README.md", "CHANGELOG.md", "LICENSE-MIT", "LICENSE-APACHE", "THIRD-PARTY-LICENSES.md"
  end

  test do
    assert_equal "esdieff #{version}\n", shell_output("#{bin}/esdieff --version")
    (testpath/"model.sdf.json").write '{"sdfObject":{"Thermostat":{"sdfProperty":{"temperature":{"type":"number"}}}}}'
    system bin/"esdieff", "check", "model.sdf.json"
  end
end
