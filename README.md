# Peder Bergan's Homebrew tap

## Fastmash

Install [Fastmash](https://fastmash.io), a command-line tool for statistics
and table transformations, on Linux x86-64 or Apple Silicon macOS 15 and later:

```sh
brew install pederbe/tap/fastmash
```

Homebrew installs a prebuilt bottle on macOS 15, macOS 26 and Linux x86-64,
without needing Rust. Otherwise it builds the published source with its locked
Rust dependencies. Use `--build-from-source` to request a source build.
The formula installs `fastmash`, both project licenses, and the dependency
licenses and notices. Linux installations also include `fastmash-sort-supervisor`.
Rust is a build dependency only. Homebrew builds do not carry the
performance qualification of the project's downloadable binaries.

New Fastmash releases usually reach this tap within a day. To update, check or
remove the installation:

```sh
brew upgrade fastmash
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

## Esdieff

Install [Esdieff](https://esdieff.com), a toolkit for understanding, checking and
testing SDF device models, on macOS 15+ or Linux:

```sh
brew install pederbe/tap/esdieff
```

The formula installs the prebuilt release and its licenses. New releases usually
reach this tap within a day. Update with `brew upgrade esdieff`, check it with
`brew test pederbe/tap/esdieff`, and remove it with `brew uninstall esdieff`.

Report program problems in the [Esdieff issue tracker](https://github.com/pederbe/esdieff/issues).

The formulae and documentation are available under either the MIT or
Apache-2.0 license. Both programs and their dependencies retain their own licenses.
