# Maintaining Homebrew installations

This repository tells Homebrew how to install the published Esdieff and
Fastmash release files. Both programs use the same executables tested by their
release pipelines. This repository does not rebuild them or publish another
set of release files.

## Automatic updates

The `Update` workflow checks Fastmash releases daily at 06:17 UTC. `Update
Esdieff` checks Esdieff releases at 06:23 UTC. Both also support manual dispatch.
They use the repository's built-in token.

Fastmash's updater reads its maintained installation recipe from
[`packaging/homebrew/fastmash.rb`](https://github.com/pederbe/fastmash/blob/main/packaging/homebrew/fastmash.rb),
then selects the latest published archives and their SHA-256 hashes. Esdieff
supplies a complete recipe with each release.

The workflows check installation, upgrade and removal before updating the
recipe on `main`. Fastmash also compares the installed executable with the
release archive. Application correctness is established by the original
release tests rather than another build here. A failure leaves the previous
recipe in place. Retry the workflow after repairing the cause. The program's
release and its other installation channels remain available.

Fastmash's `check_only` input runs preparation and installation checks without
changing `main`. Its optional `recipe_ref` input selects a Fastmash ref instead
of the default `main` recipe. A new version resets the recipe revision to zero.
The 0.4.0 recipe uses revision 1 so existing users migrate from the previous
Homebrew-built package through `brew upgrade`.

## Recipe changes

Change Fastmash's recipe and shared installation check in its own repository
first. Change Esdieff's recipe generator in its own repository. Submit the
resulting recipe changes here through a pull request. The `Formula` workflow
checks style, supported platform loading and installation on macOS 15, macOS
26 and Linux. It checks upgrades when the Fastmash recipe changes.

Ordinary pull request merging completes the update. No separate package
publication workflow or release credentials are needed. Keep historical
package releases available for users who have not upgraded yet.

GitHub pauses scheduled workflows after 60 days without repository activity
and emails the owner first. If an updater is paused, enable it in the Actions
tab and dispatch it once.
