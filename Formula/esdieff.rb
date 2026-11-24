class Esdieff < Formula
  desc "SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  url "https://github.com/pederbe/esdieff/releases/download/v0.5.1/esdieff-aarch64-apple-darwin.tar.xz"
  sha256 "845cfdb9245008133d36449dd8dc80949fe1dd86c6803188efc768aea34de2a7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.5.1/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6e4c9fc771d6446b278c429248e9003af332129b69275895db1e1f49f6d6836d"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.5.1/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "863168bd5698bdd103c933c474370f62f4f2ef82c9766026bca92a789d78e497"
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
