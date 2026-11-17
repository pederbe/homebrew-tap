class Esdieff < Formula
  desc "SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  url "https://github.com/pederbe/esdieff/releases/download/v0.5.0/esdieff-aarch64-apple-darwin.tar.xz"
  sha256 "8289ce8432cc842ae55fb27c77d580e6396529f8a79b01d352008128fc8ca9a1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.5.0/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cab653b77af6bf87425e8a24045000c9983722d6df8ab81a0e8ede97a5d65d26"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.5.0/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5e91ce8dd9ff2e63834c4fa80f03d476ac11eb0240acd40c1c6fa3837b189239"
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
