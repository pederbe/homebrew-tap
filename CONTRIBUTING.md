# Maintaining the formula

When updating `Formula/fastmash.rb`, use a published source tag and its
SHA-256 hash. Check the source build, installed tests, audit and style:

```sh
brew reinstall --build-from-source pederbe/tap/fastmash
brew test pederbe/tap/fastmash
brew audit --strict pederbe/tap/fastmash
brew style pederbe/tap/fastmash
```

Verify that the installed executable links and the package's Cellar directory are
removed after `brew uninstall`.

## Bottles

Formula pull requests build bottles on Apple Silicon macOS 15 and 26 and Linux
x86-64. Homebrew's `test-bot` checks source builds, bottles, installed tests and
linkage. The workflow retains bottle archives and checksum metadata for 14 days
and checks that installations are removed afterwards. These are Homebrew source
builds, separate from Fastmash's qualified release archives.

Once the formula pull request passes, publish it with Homebrew's `pr-pull`.
The manually dispatched `Publish bottles` workflow takes the pull request number
and its full head commit SHA. It checks that exact revision, publishes the tested
bottles to this tap's GitHub Releases, attests them, and pushes the formula and
its generated bottle checksums to `main`. This replaces ordinary merging for a
formula pull request. Workflow changes must reach `main` before the publishing
workflow can be used.

For the first bottles, use local Homebrew to publish the tested formula pull
request after reviewing its CI results. Start with the tap on `main` and a clean
working tree. This shell block uses Bash. Replace the two placeholders with
the reviewed full commit SHA and pull request number:

```bash
git -C "$(brew --repository pederbe/tap)" switch main
brew pr-pull --tap=pederbe/tap --workflows=formula.yml --head-sha=FULL_COMMIT_SHA PR_NUMBER
git -C "$(brew --repository pederbe/tap)" push origin main
```

After publication, verify an installation from the tap with
`brew install --force-bottle pederbe/tap/fastmash`, run `brew test`, and check removal.
Public repositories use GitHub's free standard runners. Bottle publication uses
the repository's built-in token and requires no additional credentials.

See Homebrew's [bottle documentation](https://docs.brew.sh/Bottles) and
[`tap-new` templates](https://github.com/Homebrew/brew/tree/main/.github/workflows)
for the supported workflow.
