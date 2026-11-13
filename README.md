# Peder Bergan's Homebrew tap

Install the published release executables of Fastmash, Esdieff and udpstp
on Linux and macOS. Homebrew installs the release files and licenses without
compiling the programs or requiring Rust. Each formula defines its supported
platforms.

## Fastmash

[Fastmash](https://fastmash.io) provides command-line statistics and table
transformations.

```sh
brew install pederbe/tap/fastmash
```

## Esdieff

[Esdieff](https://esdieff.com) helps you understand, check and test SDF device
models.

```sh
brew install pederbe/tap/esdieff
```

## udpstp

[udpstp](https://udpstp.com) measures network-path capacity, loss and delay
using authenticated tests.

```sh
brew install pederbe/tap/udpstp
```

## Update, check or remove

Replace `fastmash` with the program you installed.

```sh
brew upgrade fastmash
brew test pederbe/tap/fastmash
brew uninstall fastmash
```

Report recipe and installation problems in this repository. Report application
bugs in the [Fastmash](https://github.com/pederbe/fastmash/issues),
[Esdieff](https://github.com/pederbe/esdieff/issues) or
[udpstp](https://github.com/pederbe/udpstp/issues) tracker.
See [Contributing](CONTRIBUTING.md) for recipe changes and checks.

The formulae and documentation are available under either the MIT or
Apache-2.0 license. The programs and their dependencies retain their own licenses.
