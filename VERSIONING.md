# Versioning Rules

**Active product target:** IsoniaOS v0.8 accountability and integration preview
**Supporting design target:** ISO / Isonia Draft v0.2 funding and protocol self-governance layer

IsoniaOS uses SemVer package versions and Git tags with a leading `v`.

## Current Active Documentation Targets

The active product implementation/accountability baseline is:

```text
v0.8 - Public Governance Archive, Accountability Dashboard, Integration Preview, and public beta readiness planning
```

Active v0.8 docs live under:

```text
v0.8/
```

The v0.8 strategic correction for integration-lab separation, public beta readiness, SaaS baseline, ISO readiness baseline, and template guardrails is:

```text
v0.8/integration-lab-and-public-beta-replan.md
```

The supporting ISO funding/governance design baseline is:

```text
Draft v0.2 - ISO / Isonia funding and protocol self-governance layer
```

Draft v0.2 tokenomics docs include:

```text
TOKENOMICS.md
GOVERNANCE.md
IDENTITY.md
TREASURY.md
LEGAL_ROADMAP.md
RISK_REGISTER.md
DECISION_LOG.md
ISO_ARCHITECTURE.md
```

These are complementary targets. Draft v0.2 tokenomics does not supersede the v0.8 product baseline, and token launch is a separate explicit decision rather than an implied product milestone.

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
4. Active product docs remain product-first.
5. Active v0.8 docs live under `v0.8/`.
6. Draft v0.2 tokenomics docs are a supporting ISO funding and protocol self-governance design baseline integrated into public beta planning only where relevant.
7. `WHITEPAPER.md`, `ROADMAP.md`, and `ARCHITECTURE.md` remain product-first.
8. Strategic/root docs may live at repository root or under `strategy/`.
9. Historical v0.7 docs live under `archive/v0.7/` and should not be edited as active docs.
10. Historical v0.6 docs live under `archive/v0.6/` and should not be edited as active docs.
11. Historical v0.5 docs live under `archive/v0.5/` and should not be edited as active docs.
12. Historical v0.1 docs live under `archive/v0.1/` and should not be edited as active docs.
13. Do not create future-version documentation until that version is explicitly scoped.
14. Do not tag automatically during pre-tag hardening.
15. Do not invent compatibility sets before tags exist.
16. When a package depends on a tag from the same compatibility set, create the upstream tag first, then refresh the consumer lockfile before tagging the consumer package.
17. Keep `CHANGELOG.md` under `Unreleased` until a release is intentionally cut.
18. Codex tasks must not create tags or release sections unless explicitly instructed.
19. Public beta readiness is a gated decision after production-shaped cleanup, integration-lab validation, hosted dev/stage posture, SaaS readiness baseline, ISO readiness baseline, template guardrails, security review or audit, and claims review.

## Pre-Beta Tagging Discipline

Before public beta, active implementation may move in larger validated waves. Do not tag every commit.

Create tags only after a coherent scope or wave is complete, validated, and intentionally prepared for release. Codex tasks should be narrow enough to preserve implementation quality, but not so tiny that each small commit becomes a release event.

After public beta, release steps should become smaller and more careful, with tighter validation, compatibility checks, and release notes.

This discipline complements the SemVer and tag-format rules above. It does not change the rule that package versions omit the leading `v` and Git tags include the leading `v`.

## Version Communication

For public roadmap communication, use product milestone labels:

```text
v0.7 -> v0.8 -> public beta readiness wave -> v0.9 -> v1.0 -> v1.x -> v2.x -> v3.x+
```

For ISO design communication, use:

```text
Draft v0.2 ISO / Isonia funding and protocol self-governance design
```

For package/API compatibility, use SemVer precisely.

## Active Roadmap Labels

- `v0.6` - Usable Governance Console Alpha. Archived baseline.
- `v0.7` - Protocol Hardening Alpha. Archived protocol foundation.
- `v0.8` - Public Governance Archive, Accountability Dashboard, and Integration Preview. Active product target.
- `Public beta readiness wave` - Gated product readiness planning after v0.8 runtime preview; not a tag or release by itself.
- `v0.9` - Optional AI Governance Digest Preview.
- `v1.0` - Design Partner Release.
- `Draft v0.2 ISO` - Supporting funding and protocol self-governance design.
