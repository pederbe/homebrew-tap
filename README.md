# Peder Bergan's Homebrew tap

Install [Fastmash](https://fastmash.io), a command-line tool for statistics
and table transformations, on Linux x86-64 or Apple Silicon macOS 15 and later:

```sh
brew install pederbe/tap/fastmash
```

Homebrew installs a prebuilt bottle when one is published for your platform,
without needing Rust or Python. Otherwise it builds the published source with
its locked Rust dependencies. Use `--build-from-source` to request a source build.
The formula installs `fastmash`, both project licenses, and the dependency
licenses and notices. Linux installations also include `fastmash-sort-supervisor`.
Rust and Python are build dependencies. Homebrew builds do not carry the
performance qualification of the project's downloadable binaries.

To check or remove the installation:

```sh
brew test pederbe/tap/fastmash
brew uninstall pederbe/tap/fastmash
```

On Linux, the package test exercises the optional system-sort route and requires
Linux 5.11 or later and coreutils at `/usr/bin/sort`. Older kernels can
use Fastmash's built-in sorting. On macOS, it checks the built-in sorter and
confirms that no Sort supervisor is installed.

Report formula problems in this repository. Report program problems in
the [Fastmash issue tracker](https://github.com/pederbe/fastmash/issues).

See [the maintenance guide](CONTRIBUTING.md) for source checks and bottle publication.

The formula and documentation are available under either the MIT or
Apache-2.0 license. Fastmash and its dependencies retain their own licenses.
