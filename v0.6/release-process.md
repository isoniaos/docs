# IsoniaOS v0.6 Release Process

## Versioning

Package versions use SemVer without a leading v.

Git tags use the same version with a leading v.

Example:
- package version: 0.6.0-alpha.1
- Git tag: v0.6.0-alpha.1

## Active development

All new work goes under the topmost CHANGELOG section:

Unreleased

Do not create a new version section until the user explicitly says to cut a release.

## Compatibility matrix

Because IsoniaOS is split across multiple repositories, every known-good tag set must be recorded in docs.

For v0.5 archive:
- docs/archive/v0.5/compatibility-matrix.md

For v0.6:
- docs/v0.6/compatibility-matrix.md once the first v0.6 alpha tag set exists.

## Recommended tag order

When cutting a new compatibility set, tag lower-level packages first:

1. types
2. evm-contracts if changed
3. sdk
4. control-plane
5. theme-default
6. app-core
7. docs

The exact order may vary depending on what changed, but app-core should normally be tagged after its package dependencies.

## Before tagging

For each changed repository:
- run typecheck;
- run build;
- run tests where available;
- update CHANGELOG;
- update README if install or usage changed;
- update package.json version if this repository is being tagged;
- confirm dependency refs point at intended tags.

## After tagging

Update compatibility matrix with:
- repository name;
- tag;
- purpose/scope;
- notable compatibility notes;
- date.

## Do not

- Do not tag from a dirty working tree.
- Do not point deployable packages at main/master.
- Do not create version sections without user instruction.
- Do not make production/audit claims for alpha releases.
