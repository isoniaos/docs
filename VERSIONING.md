# Versioning Rules

**Active tokenomics/governance target:** IsoniaOS Draft v0.2
**Active accountability/product baseline:** IsoniaOS v0.8 accountability and integration preview

IsoniaOS uses SemVer package versions and Git tags with a leading `v`.

## Current Active Documentation Targets

Draft v0.2 root docs define the active ISO tokenomics, identity-aware governance, treasury, legal, risk, decision, and architecture baseline:

```text
WHITEPAPER.md
ROADMAP.md
TOKENOMICS.md
GOVERNANCE.md
IDENTITY.md
TREASURY.md
LEGAL_ROADMAP.md
RISK_REGISTER.md
DECISION_LOG.md
ARCHITECTURE.md
```

The active accountability/product implementation baseline remains:

```text
v0.8/
```

The v0.7 Protocol Hardening Alpha and older docs are archived and must not be treated as the active documentation surface.

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

## v0.7 Compatibility Matrix

The v0.7 compatibility matrix is archived at:

```text
archive/v0.7/compatibility-matrix.md
```

Do not invent v0.7 tag sets.

## Semantic Versioning

Package versions use:

```text
MAJOR.MINOR.PATCH[-PRERELEASE]
```

Examples:

```text
0.7.0-alpha.1
0.7.0-alpha.2
0.7.0
```

Git tags use the same version with a leading `v`:

```text
v0.7.0-alpha.1
v0.7.0-alpha.2
v0.7.0
```

## Rules

1. `package.json.version` values use SemVer without a leading `v`.
2. Git tags use the same version with a leading `v`.
3. GitHub dependency refs use tag names, for example `github:isoniaos/types#v0.7.0-alpha.1`.
4. Draft v0.2 root docs are active for ISO tokenomics, reserve, treasury, identity, governance, Council, legal, risk, decision, and architecture scope.
5. v0.8 docs under `v0.8/` remain active for accountability/product implementation scope.
6. Strategic/root docs may live at repository root or under `strategy/`.
7. Historical v0.7 docs live under `archive/v0.7/` and should not be edited as active docs.
8. Historical v0.6 docs live under `archive/v0.6/` and should not be edited as active docs.
9. Historical v0.5 docs live under `archive/v0.5/` and should not be edited as active docs.
10. Historical v0.1 docs live under `archive/v0.1/` and should not be edited as active docs.
11. Do not create future-version documentation until that version is explicitly scoped.
12. Do not tag automatically during pre-tag hardening.
13. Do not invent compatibility sets before tags exist.
14. When a package depends on a tag from the same compatibility set, create the upstream tag first, then refresh the consumer lockfile before tagging the consumer package.
15. Keep `CHANGELOG.md` under `Unreleased` until a release is intentionally cut.
16. Codex tasks must not create tags or release sections unless explicitly instructed.

## Version Communication

For public roadmap communication, use product milestone labels and design baseline labels separately.

Design baseline:

```text
Draft v0.2 ISO tokenomics and identity-aware governance design
```

Product/accountability milestones:

```text
v0.7 -> v0.8 -> v0.9 -> v1.0 -> v1.x -> v2.x -> v3.x+
```

For package/API compatibility, use SemVer precisely.

## Active Roadmap Labels

- `Draft v0.2` - ISO tokenomics, identity-aware governance, treasury, legal, risk, decision, and architecture design.
- `v0.6` - Usable Governance Console Alpha. Archived baseline.
- `v0.7` - Protocol Hardening Alpha. Archived protocol foundation.
- `v0.8` - Public Governance Archive, Accountability Dashboard, and Integration Preview. Active accountability/product baseline.
- `v0.9` - Optional AI Governance Digest Preview.
- `v1.0` - Design Partner Release.
