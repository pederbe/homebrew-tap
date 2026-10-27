class Esdieff < Formula
  desc "An SDF toolkit for connected-device models"
  homepage "https://esdieff.com"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on macos: :sequoia
    depends_on arch: :arm64
    url "https://github.com/pederbe/esdieff/releases/download/v0.1.0/esdieff-aarch64-apple-darwin.tar.xz"
    sha256 "5854c22ad0189e28662171fe265bfd08e412cb4af906c40eccb418c714074b59"
  end

  on_linux do
    on_intel do
      url "https://github.com/pederbe/esdieff/releases/download/v0.1.0/esdieff-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4b0546007af78922593254cf46dcb862fd63ed019caf9e841146fc2d6dbb61f2"
    end
    on_arm do
      url "https://github.com/pederbe/esdieff/releases/download/v0.1.0/esdieff-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "07c9719b822769353ea5fa86dbd9af991b157714b022779987995a82acfdcb45"
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
