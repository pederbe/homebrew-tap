class Fastmash < Formula
  desc "Fast command-line statistics and table transformations"
  homepage "https://fastmash.io"
  url "https://github.com/pederbe/fastmash/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9b4f2ffc01fabe03aacef9742c10dcedb02281d07b2fc5137dc7b78306b09258"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/pederbe/homebrew-tap/releases/download/fastmash-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ec0ee57917c33dbd6ab6a77adee0c87e0563c34ae736de847b364bf03aad8409"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "42121b19587d1036728365fdd64747237acc294e9b6b564c149c209e784ef8fa"
    sha256 cellar: :any,                 x86_64_linux:  "4810f0106d34c2664a402e7b9e697ab0ba10eee9c0495319e2df331a9f559bd0"
  end

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
      # The Sort supervisor is Linux-only; macOS sorts with the built-in sorter.
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
