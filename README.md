# Peder Bergan's Homebrew tap

Install [Fastmash](https://fastmash.io), a command-line tool for statistics
and table transformations, on Linux x86-64:

```sh
brew install pederbe/tap/fastmash
```

Homebrew builds the published source with its locked Rust dependencies.
The formula installs `fastmash`, `fastmash-sort-supervisor`, both project
licenses, and the dependency licenses and notices. Rust and Python are
build dependencies. These source builds do not carry the performance
qualification of the project's downloadable binaries.

To check or remove the installation:

```sh
brew test pederbe/tap/fastmash
brew uninstall pederbe/tap/fastmash
```

The package test exercises the optional system-sort route and requires
Linux 5.11 or later and coreutils at `/usr/bin/sort`. Older kernels can
use Fastmash's built-in sorting.

Report formula problems in this repository. Report program problems in
the [Fastmash issue tracker](https://github.com/pederbe/fastmash/issues).

## Maintaining the formula

When updating `Formula/fastmash.rb`, use a published source tag and its
SHA-256 hash. Check the source build, installed tests, audit and style:

```sh
brew reinstall --build-from-source pederbe/tap/fastmash
brew test pederbe/tap/fastmash
brew audit --strict pederbe/tap/fastmash
brew style pederbe/tap/fastmash
```

Verify that both executable links and the package's Cellar directory are
removed after `brew uninstall`.

The formula and documentation are available under either the MIT or
Apache-2.0 license. Fastmash and its dependencies retain their own licenses.
