# Versioning Rules

**Active target:** IsoniaOS v0.6 alpha

IsoniaOS uses SemVer package versions and Git tags with a leading `v`.

## Current Active Documentation Target

Active docs live under:

```text
v0.6/
```

The active product target is:

```text
v0.6 — Usable Governance Console Alpha
```

The v0.5 Developer Preview is archived and must not be treated as the active documentation surface.

## Archived Compatibility Set

The v0.5 Developer Preview known-good compatibility set is archived at:

```text
archive/v0.5/compatibility-matrix.md
```

Archived v0.5 package references may include:

```txt
@isonia/evm-contracts     0.5.0-alpha.3 -> v0.5.0-alpha.3
@isonia/types             0.5.0-alpha.5 -> v0.5.0-alpha.5
@isonia/control-plane     0.5.0-alpha.3 -> v0.5.0-alpha.3
@isonia/sdk               0.5.0-alpha.6 -> v0.5.0-alpha.6
@isonia/theme-default     0.5.0-alpha.2 -> v0.5.0-alpha.2
@isonia/app-core          0.5.0-alpha.7 -> v0.5.0-alpha.7
docs                      v0.5.0-alpha.4
```

Do not update archived compatibility data unless explicitly correcting archive metadata.

## v0.6 Compatibility Matrix

A v0.6 compatibility matrix should be created or updated only when v0.6 package/tag sets are actually prepared.

Do not invent v0.6 tag sets.

## Semantic Versioning

Package versions use:

```text
MAJOR.MINOR.PATCH[-PRERELEASE]
```

Examples:

```text
0.6.0-alpha.1
0.6.0-alpha.2
0.6.0
```

Git tags use the same version with a leading `v`:

```text
v0.6.0-alpha.1
v0.6.0-alpha.2
v0.6.0
```

## Rules

1. `package.json.version` values use SemVer without a leading `v`.
2. Git tags use the same version with a leading `v`.
3. GitHub dependency refs use tag names, for example `github:isoniaos/types#v0.6.0-alpha.1`.
4. Active v0.6 docs live under `v0.6/`.
5. Strategic/root docs may live at repository root or under `strategy/`.
6. Historical v0.5 docs live under `archive/v0.5/` and should not be edited as active docs.
7. Historical v0.1 docs live under `archive/v0.1/` and should not be edited as active docs.
8. Do not create future-version documentation until that version is explicitly scoped.
9. Do not tag automatically during pre-tag hardening.
10. Do not invent compatibility sets before tags exist.
11. When a package depends on a tag from the same compatibility set, create the upstream tag first, then refresh the consumer lockfile before tagging the consumer package.
12. Keep `CHANGELOG.md` under `Unreleased` until a release is intentionally cut.
13. Codex tasks must not create tags or release sections unless explicitly instructed.

## Version Communication

For public roadmap communication, use product milestone labels:

```text
v0.6 → v0.7 → v0.8 → v0.9 → v1.0 → v1.x → v2.x → v3.x+
```

For package/API compatibility, use SemVer precisely.

## Active Roadmap Labels

- `v0.6` — Usable Governance Console Alpha.
- `v0.7` — Integration Preview.
- `v0.8` — Public Governance Archive and Accountability Dashboard.
- `v0.9` — Optional AI Governance Digest Preview.
- `v1.0` — Design Partner Release.
