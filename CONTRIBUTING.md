# Contributing to the Homebrew tap

This tap installs the published Esdieff, Fastmash and udpstp executables.
Recipe changes must preserve the released binaries and their checksums.
Report application bugs in the upstream project's tracker and recipe or
installation problems here.

## Recipe changes

Change the recipe at its source before submitting the resulting change here.

- [Fastmash's recipe and installation check](https://github.com/pederbe/fastmash/tree/main/packaging/homebrew).
- [Esdieff's release tooling](https://github.com/pederbe/esdieff/tree/main/tools/release).
- [udpstp's recipe template and renderer](https://github.com/pederbe/udpstp/tree/main/contrib/homebrew).

Open a focused pull request and describe the installation behavior and any
upgrade consequences. The [Formula workflow](.github/workflows/formula.yml)
checks style, supported platform loading and installation. Fastmash recipe
changes also exercise upgrades. Let the required checks pass before merging.
A recipe pull request does not need a separate package upload.

## Public issues and pull requests

Use the issue template's **Problem**, **Desired outcome** and **Evidence**
sections. Include the command, operating system, observed result and relevant
error output. Pull requests use **Problem**, **Solution** and **Validation**.
Explain compatibility effects and upgrade steps in Solution.

Keep discussion focused on technical facts and evidence. Remove private data,
attribute checks accurately and preserve other people's observations and wording
when updating a report.

## Checking updater changes

The updater workflows own release selection and their current inputs.
Fastmash's [updater](.github/workflows/update.yml) has a check-only mode for
preparing and checking a recipe without changing the tap. Esdieff and udpstp
have [dedicated](.github/workflows/update-esdieff.yml)
[updaters](.github/workflows/update-udpstp.yml) for their published recipes.

Preserve installation, upgrade and removal checks. A failed update must leave
the previous recipe available. Keep historical release files available for
existing installations. Inspect the failed workflow's output before retrying.
