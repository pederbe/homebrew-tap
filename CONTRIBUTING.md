# Maintaining the formula

The Fastmash repository keeps the recipe in
[`packaging/homebrew/fastmash.rb`](https://github.com/pederbe/fastmash/tree/main/packaging/homebrew).
Change the recipe there first. This tap publishes that recipe with each
release's source URL, checksum and bottles.

## Automatic release updates

The `Update` workflow runs daily at 06:17 UTC on GitHub-hosted runners, and on
manual dispatch. It compares `Formula/fastmash.rb` with the latest published
Fastmash release:

1. When the versions match, it stops after this check.
2. For a newer release, it takes the recipe from the release tag and sets the
   tag's source URL and SHA-256 hash.
3. It calls the `Formula` workflow, which builds and tests bottles on Apple
   Silicon macOS 15 and 26 and Linux x86-64 with Homebrew's `test-bot`.
4. It commits the formula, uploads the bottles to this tap's GitHub Releases
   with `brew pr-upload`, attests them and pushes the formula and bottle
   checksums to `main`.
5. On each platform, it installs the previous bottle, upgrades to the new
   one, runs `brew test` and checks removal.

`main` changes only in step 4, after every bottle passes. The run uses the
repository's built-in token and needs no other credentials. Fastmash releases
do not wait for this workflow, so a tap failure leaves the release and its
other packages unaffected.

When a run fails, open it in the Actions tab and choose **Re-run failed jobs**.
This reuses the bottles that already passed. A retry of step 4 replaces any
partial upload, since `main` does not refer to it yet. If the problem is in a
release's recipe, fix the recipe on Fastmash's `main` and dispatch `Update` with
`recipe_ref` set to `main`. Otherwise the next daily run starts again.

If publication succeeded but the final installation check needs a workflow fix,
merge the fix and dispatch `Update` with `verify_from` set to the full tap commit
SHA that still contains the previous version. Leave `recipe_ref` empty. This
installs the previous bottles, upgrades to the current published bottles and
checks removal on all three platforms, without rebuilding or publishing anything.
For the 0.2.0 to 0.3.0 upgrade, the previous tap commit is
`ac96fe433ae71717b68c26d1fcef4afe68eaa774`.

GitHub pauses scheduled workflows after 60 days without repository activity
and emails the owner first. Renovate's merges usually keep the tap active. If
`Update` is paused, enable it again in the Actions tab and dispatch it once.

## Manual formula changes

For a change that is not a new release, such as a revision, open a pull request
here. Use a published source tag and its SHA-256 hash. Check the source build,
installed tests, audit and style locally:

```sh
brew reinstall --build-from-source pederbe/tap/fastmash
brew test pederbe/tap/fastmash
brew audit --strict pederbe/tap/fastmash
brew style pederbe/tap/fastmash
```

Verify that the installed executable links and the package's Cellar directory are
removed after `brew uninstall`.

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
formula pull request.

After publication, verify an installation from the tap with
`brew install --force-bottle pederbe/tap/fastmash`, run `brew test`, and check removal.
Public repositories use GitHub's free standard runners.

See Homebrew's [bottle documentation](https://docs.brew.sh/Bottles) and
[`tap-new` templates](https://github.com/Homebrew/brew/tree/main/.github/workflows)
for the supported workflow.
