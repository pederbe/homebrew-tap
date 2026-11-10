class Esdieff < Formula
  desc "SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  url "https://github.com/pederbe/esdieff/releases/download/v0.4.0/esdieff-aarch64-apple-darwin.tar.xz"
  sha256 "07996456a702a629ade54f40df3362025367fd0b07ebd82a66b18591574bbe00"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.4.0/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9833344de24e7d5f5d03654796915876feb3338f986af23d444f2e7efeb1ced6"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.4.0/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1e1fb143085321312761dcd40413bf00d6af2c8a0d739d3f5150482a2e9364cc"
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
