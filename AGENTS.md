# IsoniaOS Docs Repository Agent Rules

These rules apply to Codex and other AI agents working in this repository.

## Active target

The active tokenomics/governance documentation target is **IsoniaOS Draft v0.2**.

The v0.8 accountability and integration preview remains the active product/accountability implementation baseline. Treat these as complementary scopes:

- Draft v0.2 governs ISO tokenomics, reserve policy, treasury, identity-aware governance, Council design, legal phasing, risk register, decision log, and high-level token architecture.
- v0.8 governs Public Governance Archive, Basic Accountability Dashboard, integration preview, evidence labels, and local accountability demo flow.

Read first:

- `WHITEPAPER.md`
- `ROADMAP.md`
- `TOKENOMICS.md`
- `GOVERNANCE.md`
- `IDENTITY.md`
- `TREASURY.md`
- `LEGAL_ROADMAP.md`
- `RISK_REGISTER.md`
- `DECISION_LOG.md`
- `ARCHITECTURE.md`
- `AGENTS.md`
- `DEVELOPMENT-PROCESS.md`
- `strategy/`
- `v0.8/`

Archived documents are historical references only.

## Product positioning rules

- Treat DAO/Web3 governance as the first market.
- Treat civic, public-sector, political, and state-level governance as a long-term expansion path, not immediate product scope.
- Describe IsoniaOS as a governance control plane / governance operating system for accountable digital organizations.
- Do not describe IsoniaOS as only a voting app, DAO launcher, treasury wallet, AI governor, or state operating system.
- Keep the core thesis visible: **Governance is not a vote. Governance is a lifecycle.**
- Keep the launch wedge visible: **IsoniaOS closes the loop between DAO decisions and execution.**

## v0.8 scope rules

v0.8 may improve:

- Public Governance Archive design;
- Basic Accountability Dashboard design;
- integration preview design;
- external evidence link-first posture;
- trust-boundary guidance for external records;
- local deterministic demo flows;
- expanded demo organization/governance process;
- docs-to-types/contracts/control-plane/app-core handoff sequencing.

v0.8 must not add or claim:

- production SaaS billing;
- custom domains;
- full IPFS upload service;
- Safe integration;
- full Snapshot write/import lifecycle;
- full Tally/Agora integration;
- multi-chain execution;
- NFT voting runtime;
- production-grade indexer;
- AI arbitration;
- AI governance;
- production audit readiness;
- full Proposal Action Builder production release;
- tenant provisioning.

v0.8 authority and evidence rules:

- contracts remain authoritative for modeled onchain governance state;
- Control Plane/App Core are explanatory and operational layers;
- external records are linked evidence or context unless explicitly modeled as authority for a specific field;
- manual accountability updates are annotations, not protocol truth;
- imported external records must keep source labels, trust boundaries, and stale/error/unknown states visible;
- EIP-5792 is not the primary v0.8 path.

## Documentation rules

- Keep active docs in English.
- Keep user-facing statements concrete and non-hype.
- Do not make legal, audit, production-security, or compliance claims unless the supporting work exists.
- Update `CHANGELOG.md` under `Unreleased` when adding or changing docs.
- Do not edit `archive/` unless explicitly instructed.
- Do not create future-version docs unless the version is explicitly scoped.
- Do not create or update tags unless explicitly instructed.

## Implementation rules

- Prefer small, reviewable changes.
- Use docs as the source of truth before code.
- Do not merge unrelated protocol, UI, SaaS, AI, and integration work into one patch.
- Keep package boundaries clean.
- Run relevant tests, linters, or type checks when code changes.
- Report uncertainty, failing tests, or unverified assumptions.

## Trust rules

- Contracts are authoritative for onchain state.
- UI and diagnostics are explanatory layers, not sources of governance authority.
- Indexer/projection data must be treated as read models that can lag or fail.
- AI output is advisory by default and must not be presented as binding authority.
