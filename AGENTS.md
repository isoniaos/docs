# IsoniaOS Docs Repository Agent Rules

These rules apply to Codex and other AI agents working in `docs`.

## Repository Purpose

`docs` is the durable source of truth for IsoniaOS architecture, roadmap, process, decision records, public beta gates, ISO readiness planning, and cross-repository guidance.

Chat history is not durable project state. Record important ideas, deferred tasks, roadmap corrections, public interface changes, integration findings, and decision changes in docs, roadmap, backlog, or decision logs before relying on them in later work.

## Active Target

Primary active product documentation target:

```txt
IsoniaOS v0.8 accountability and integration preview
```

Supporting planning target:

```txt
ISO / Isonia funding and protocol self-governance readiness baseline
```

The v0.8 wave covers Public Governance Archive, Basic Accountability Dashboard, Integration Preview, external evidence/context with explicit trust boundaries, integration-lab validation, public beta gate planning, and late-v0.8 hardening/security readiness.

Public beta readiness is a future decision point, not a current claim.

## Read First

For product architecture and process work, inspect the current versions of:

- `WHITEPAPER.md`
- `ROADMAP.md`
- `ARCHITECTURE.md`
- `DEVELOPMENT-PROCESS.md`
- `DECISION_LOG.md`
- `RISK_REGISTER.md`
- `strategy/`
- `v0.8/`

For ISO/tokenomics work, also inspect the current versions of:

- `TOKENOMICS.md`
- `GOVERNANCE.md`
- `IDENTITY.md`
- `TREASURY.md`
- `LEGAL_ROADMAP.md`
- `ISO_ARCHITECTURE.md`

Archived documents are historical references only. Do not edit archived docs unless explicitly instructed.

## Product Positioning Rules

- Treat DAO/Web3 governance as the first market.
- Treat civic, public-sector, political, and state-level governance as long-term expansion paths, not immediate product scope.
- Describe IsoniaOS as a governance control plane or governance operating system for accountable digital organizations.
- Do not describe IsoniaOS as only a voting app, DAO launcher, treasury wallet, AI governor, state operating system, or token project.
- Keep the core thesis visible: governance is a lifecycle, not just a vote.
- Keep the launch wedge visible: IsoniaOS closes the loop between DAO decisions and execution.
- Never replace product docs with tokenomics docs.

## Authority and Trust Rules

- Contracts are authoritative for modeled onchain governance state.
- Control Plane and App Core are explanatory and operational layers, not sources of governance authority.
- External records are linked evidence or context unless explicitly modeled as authority for a specific field.
- Manual accountability updates are annotations, not protocol truth.
- Imported external records must keep source labels, trust boundaries, and stale/error/unknown states visible.
- Templates are versioned configuration blueprints, not authority by themselves.

## v0.8 Scope Rules

v0.8 may document and refine:

- Public Governance Archive;
- Basic Accountability Dashboard;
- integration preview design;
- source disclosure and external evidence posture;
- local deterministic demo flows;
- demo-stack runtime boundaries;
- integration-lab validation planning;
- Sepolia live validation and pinned fork replay;
- provider gap tracking;
- hosted dev/stage path;
- SaaS readiness baseline;
- ISO funding/protocol self-governance readiness baseline;
- custom template and governance blueprint baseline;
- late-v0.8 hardening, security review, audit-prep, and claims review.

v0.8 must not claim:

- production readiness;
- audit readiness;
- public beta readiness;
- SaaS readiness;
- legal readiness;
- provider integration completeness;
- ISO token launch readiness.

Only make one of those claims after a scoped task completes the evidence, updates docs, and records the decision.

## Integration Lab Rules

External tool integration is a core product requirement, but provider experiments and presentation harnesses must stay isolated from core product code.

Use `integration-lab` as the source of truth for:

- Sepolia deployment manifests;
- Snapshot testnet workflow notes;
- Safe Sepolia proof workflow;
- Tally/OpenZeppelin Governor compatibility experiments;
- Agora research lane;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation-ready QA scenarios;
- field notes and issue logs.

The integration lab must not define core governance authority, pollute audited contracts, or hardcode customer/demo targets into Control Plane internals.

## Documentation Rules

- Write active docs in English.
- Keep user-facing statements concrete and non-hype.
- Update `CHANGELOG.md` under `Unreleased` when appropriate for user-visible documentation changes, unless a task is explicitly scoped to AGENTS-only guidance.
- Update decision, process, roadmap, or risk docs when the work changes project direction.
- Do not create future-version docs unless the version is explicitly scoped.
- Do not create or update Git tags unless explicitly instructed.
- Before public beta, do not tag every commit. Tag only after a coherent wave is complete, validated, and intentionally prepared for release.

## Implementation Rules

- Prefer small, reviewable changes.
- Use docs as the source of truth before code.
- Do not mix unrelated protocol, UI, SaaS, AI, tokenomics, and integration work into one patch.
- Keep package boundaries clean.
- Run relevant checks for the files changed.
- Report uncertainty, failing checks, or unverified assumptions.
