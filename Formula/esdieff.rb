class Esdieff < Formula
  desc "SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  url "https://github.com/pederbe/esdieff/releases/download/v0.3.0/esdieff-aarch64-apple-darwin.tar.xz"
  sha256 "2c03de4e80d0489d4b18b01ac65a1b71963f4761170afb558c300dcabe0d52b2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.3.0/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2b0ce6e50d260ad9260770b0c1c8bcdee5beaae3693070390d326456c310c956"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.3.0/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ae7219f1391539d64e74b55071ed3968d412cbb5431be33e6fe6d9763b58e4e6"
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
