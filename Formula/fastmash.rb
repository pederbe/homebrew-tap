class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e4428c19785a5de60d2788769a4c7a99d6b61cbe9927899bb7b34495ab0a28b4"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :sequoia
  end

  on_linux do
    depends_on arch: :x86_64
  end

  def install
    if OS.mac?
      # Match the release archives' deployment target.
      ENV["MACOSX_DEPLOYMENT_TARGET"] = "15.0"
      # The selected source determines which executables Cargo installs.
      system "cargo", "install", "--bin", "fastmash", *std_cargo_args(path: "crates/cli")
      target = "aarch64-apple-darwin"
    else
      system "cargo", "install", *std_cargo_args(path: "crates/cli")
      target = "x86_64-unknown-linux-gnu"
    end
    notices = Utils.safe_popen_read("cargo", "run", "--locked", "--release", "-p", "fastmash-license-notices",
                                    "--", "--target", target)
    (buildpath/"THIRD-PARTY-LICENSES.md").write notices
    doc.install "README.md", "LICENSE-MIT", "LICENSE-APACHE", "THIRD-PARTY-LICENSES.md"
    cd "packaging/homebrew" do
      system "rustc", "--edition=2024", "--target", target, "-C", "linker=#{ENV.cc}",
             "-C", "opt-level=2", "-C", "strip=symbols", "run_test.rs", "-o", "fastmash-test-homebrew"
      libexec.install "fastmash-test-homebrew"
    end
  end

  test do
    system libexec/"fastmash-test-homebrew", bin, doc, version.to_s
  end
end
