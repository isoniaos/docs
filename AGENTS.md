# IsoniaOS Docs Repository Agent Rules

These rules apply to Codex and other AI agents working in this repository.

## Active Targets

Primary active product documentation target:

```text
IsoniaOS v0.8 accountability and integration preview
```

Supporting design target:

```text
ISO / Isonia Draft v0.2 funding and protocol self-governance layer
```

These targets are complementary. Draft v0.2 tokenomics does not supersede the v0.8 product baseline.

Read first:

- `WHITEPAPER.md`
- `ROADMAP.md`
- `ARCHITECTURE.md`
- `AGENTS.md`
- `DEVELOPMENT-PROCESS.md`
- `strategy/`
- `v0.8/`
- `v0.8/integration-lab-and-public-beta-replan.md`

For ISO/tokenomics work, also read:

- `TOKENOMICS.md`
- `GOVERNANCE.md`
- `IDENTITY.md`
- `TREASURY.md`
- `LEGAL_ROADMAP.md`
- `RISK_REGISTER.md`
- `DECISION_LOG.md`
- `ISO_ARCHITECTURE.md`

Archived documents are historical references only.

## Product Positioning Rules

- Treat DAO/Web3 governance as the first market.
- Treat civic, public-sector, political, and state-level governance as a long-term expansion path, not immediate product scope.
- Describe IsoniaOS as a governance control plane / governance operating system for accountable digital organizations.
- Do not describe IsoniaOS as only a voting app, DAO launcher, treasury wallet, AI governor, state operating system, or token project.
- Keep the core thesis visible: **Governance is not a vote. Governance is a lifecycle.**
- Keep the launch wedge visible: **IsoniaOS closes the loop between DAO decisions and execution.**
- Never replace product docs with tokenomics docs.
- `WHITEPAPER.md` and `ROADMAP.md` are product-first.

## Source-of-Truth Rules

- `TOKENOMICS.md` is the source of truth for ISO economics.
- `GOVERNANCE.md` is the source of truth for Protocol Council, People's Veto, cooldowns, voting caps, and constitution/AI validation.
- `IDENTITY.md` is the source of truth for IdentityRegistry and verifier adapters.
- `TREASURY.md` is the source of truth for Curve Reserve, treasury funds, Legal & Compliance Fund, Market Stability & Ethereum Alignment Fund, SaaS contribution logic, and commercial confidentiality logic.
- `LEGAL_ROADMAP.md` is the source of truth for legal phasing.
- `RISK_REGISTER.md` is the source of truth for tokenomics and product risk tracking.
- `DECISION_LOG.md` is the source of truth for recorded product/context and ISO design decisions.
- `ISO_ARCHITECTURE.md` is the source of truth for ISO funding and protocol self-governance architecture.
- `ARCHITECTURE.md` is the source of truth for product architecture.
- `DEVELOPMENT-PROCESS.md`, `v0.8/execution-discipline-and-beta-readiness.md`, and `v0.8/integration-lab-and-public-beta-replan.md` are the source of truth for Codex process, v0.8 execution discipline, demo-stack runtime boundaries, integration-lab boundaries, and beta-readiness gates.

Repository docs are more durable than chat history or project memory. Use chat context as guidance only; record new cross-repository constraints in active docs before relying on them in future tasks. Always inspect current repository state and active docs instead of assuming older chat context still applies.

## v0.8 Scope Rules

v0.8 may improve:

- Public Governance Archive design;
- Basic Accountability Dashboard design;
- integration preview design;
- external evidence link-first posture;
- trust-boundary guidance for external records;
- local deterministic demo flows;
- integration-lab validation planning;
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
- tenant provisioning;
- token launch requirement.
- public beta readiness claim.

v0.8 authority and evidence rules:

- contracts remain authoritative for modeled onchain governance state;
- Control Plane/App Core are explanatory and operational layers;
- external records are linked evidence or context unless explicitly modeled as authority for a specific field;
- manual accountability updates are annotations, not protocol truth;
- imported external records must keep source labels, trust boundaries, and stale/error/unknown states visible;
- EIP-5792 is not the primary v0.8 path.

v0.8 demo-stack runtime scope:

- `demo-stack` should directly track only `app-core`, `control-plane`, and `evm-contracts`;
- do not make `docs`, `types`, `sdk`, or `theme-default` first-class demo-stack runtime pins unless demo-stack directly consumes them;
- shared packages may still be dependencies inside App Core or Control Plane.

Late v0.8 beta-preflight work must include production-shaped core cleanup, demo/mock/integration-lab isolation, UI polish, hosted dev/stage baseline, SaaS readiness baseline, ISO funding/protocol self-governance readiness baseline, custom template guardrails, strict security review or audit, and docs/claims review. This is required before public beta readiness claims, but it is not the next runtime task unless explicitly scoped.

## Integration Lab Rules

External tool integration is a core product requirement, but provider experiments and presentation harnesses must stay isolated from core product code.

Use `integration-lab/` as the future/sibling source of truth for:

- Sepolia deployment manifests;
- Snapshot testnet space workflows;
- Safe Sepolia transaction proof workflows;
- Tally/OpenZeppelin Governor compatibility experiments;
- Agora research/linking;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation-ready QA scenarios;
- field notes and issue logs.

The integration lab must not define core governance authority, pollute audited contracts, or hardcode customer/demo targets into Control Plane internals.

## Template Rules

Custom organization and governance templates are versioned configuration blueprints, not authority by themselves.

Templates may describe organizations, proposal types, policy routes, accountability requirements, external evidence requirements, action metadata, and integration/source defaults.

Templates must not silently grant authority, must be versioned, should be exportable/importable, should warn on risky custom use, and must not allow arbitrary code execution in core.

## ISO v0.2 Scope Rules

ISO / Isonia Draft v0.2 may document:

- token name and symbol;
- standard ERC-20 design;
- native USDC-only bonding curve settlement/redemption at launch;
- immutable polynomial curve;
- Curve Reserve invariant;
- treasury funds;
- Legal & Compliance Fund;
- identity-aware protocol self-governance;
- Protocol Council;
- People's Veto;
- legal phasing;
- ETH alignment as non-reserve treasury/grant/donation asset or future research item.

It must not claim:

- revenue-sharing rights at launch;
- equity, shares, dividends, profit rights, passive income, or guaranteed yield;
- Curve Reserve can fund operations;
- ETH backs ISO redemptions at launch;
- token launch is required for v0.8 product work.

## Documentation Rules

- Keep active docs in English.
- Keep user-facing statements concrete and non-hype.
- Do not make legal, audit, production-security, or compliance claims unless the supporting work exists.
- Update `CHANGELOG.md` under `Unreleased` when adding or changing docs.
- Do not edit `archive/` unless explicitly instructed.
- Do not create future-version docs unless the version is explicitly scoped.
- Do not create or update tags unless explicitly instructed.
- Before public beta, do not tag every commit. Tag only after a coherent implementation wave is complete, validated, and intentionally prepared for release.

## Implementation Rules

- Prefer small, reviewable changes.
- Use docs as the source of truth before code.
- Do not merge unrelated protocol, UI, SaaS, AI, tokenomics, and integration work into one patch.
- Keep package boundaries clean.
- Run relevant tests, linters, or type checks when code changes.
- Report uncertainty, failing tests, or unverified assumptions.

## Trust Rules

- Contracts are authoritative for onchain state.
- UI and diagnostics are explanatory layers, not sources of governance authority.
- Indexer/projection data must be treated as read models that can lag or fail.
- AI output is advisory by default and must not be presented as binding authority.
