# Changelog

All notable changes to the IsoniaOS documentation repository are documented here.

Git tags use SemVer with a leading `v`, for example `v0.7.0-alpha.1`.

## 0.7.0-alpha.3

### Added

- Define the v0.7 Proposal Action Builder design baseline, including MVP scope, ABI source priority, action intent model, hash semantics, simulation posture, and dynamic value policy.

## 0.7.0-alpha.2

### Changed

- Aligned the v0.7 documentation pack with the current alpha stack: `evm-contracts` v0.7.0-alpha.6, `types` v0.7.0-alpha.2, `sdk` v0.7.0-alpha.2, `control-plane` v0.7.0-alpha.2, `app-core` v0.7.0-alpha.4, and `demo-stack` v0.7.0-alpha.4.
- Updated finalization, lifecycle, design partner preview, Proposal Action Builder, and storage/metadata wording to reflect current alpha support while preserving v0.7 production non-goals.
- Documented the simplified v0.7 local contracts command surface using only `deploy:local` and `seed:local`.

## 0.7.0-alpha.1

### Changed

- Refined the v0.7 bootstrap finalization/admin handoff design baseline, including lifecycle semantics, irreversible alpha finalization, repository implications, roadmap sequencing, compatibility status, and design partner demo framing.
- Updated the active documentation target from v0.6 to v0.7 across non-archived docs.
- Reframed v0.7 as the protocol hardening alpha focused on typed admin batch activation, bootstrap finalization/admin handoff, lifecycle state, Proposal Action Builder design, and metadata/storage schemas.
- Moved v0.6 references into archived-baseline language where they remain relevant.
- Added Solidity work rules for using modifiers on access control and simple entry-point preconditions.

## 0.6.0-alpha.8

### Added

- Added a future protocol backlog note for bootstrap finalization, admin handoff, and typed admin batch activation, including EIP-5792's optional optimization role.

## 0.6.0-alpha.7

### Added

- Added the DAO-first market entry strategy.
- Added the competitive landscape document covering voting, onchain governance, treasury execution, DAO frameworks, grants workflows, grant accountability, AI governance, and metagovernance tooling.
- Added the integration strategy for Snapshot, Safe, Tally/Agora, Discourse, GitHub, block explorers, ERC-4824-style metadata, and attestation-based evidence.
- Added the accountability model defining execution statuses, responsible parties, due dates, proofs, milestones, failure states, and accountability levels.
- Added the trust and security model for alpha/demo, design partner, and production trust boundaries.
- Added the AI policy defining advisory-only AI behavior, allowed early features, disallowed early features, data rules, and future arbitration constraints.
- Added the SaaS and open-core model.
- Added the tenant and domain model covering SaaS domains, self-hosted modes, single-org UX, multi-org administration, and multi-chain organization contexts.
- Added the storage and IPFS model covering upload intent, purpose-limited storage, CID registry, gateway boundaries, quotas, privacy, and abuse prevention.
- Added the narrative and messaging guide for DAO-first positioning.
- Added the development process for Codex-assisted docs-first development.
- Added repository-level `AGENTS.md` rules for AI agents.
- Added the v0.6 design partner demo script.
- Added the v0.6 review checklist.
- Added v0.6 Codex task prompt templates.
- Added v0.6 quickstart-local guide, design partner demo script, troubleshooting guide, compatibility matrix, and alpha release notes for demo readiness.

### Changed

- Updated v0.6 docs for the Node 22 baseline, evm-contracts metadata alignment status, and line-ending policy hardening.
- Updated the v0.6 compatibility matrix and alpha release notes from pending package entries to the released v0.6 alpha tag set.
- Updated the root README navigation to include active strategy, v0.6, and development-process documents.
- Updated the whitepaper from a broad governance OS draft into a DAO-first governance control plane whitepaper.
- Updated the roadmap to prioritize v0.6 demo readiness, v0.7 integrations, v0.8 accountability dashboard, v0.9 advisory AI digest, and v1.0 design partner release.
- Updated `VERSIONING.md` to state that `v0.6/` is the active documentation context and `archive/v0.5/` is historical.
- Updated v0.6 documentation index to include design partner, review checklist, and Codex task prompt documents.

### Fixed

- Corrected the stale versioning guidance that previously described `v0.5/` as the active docs path while the root README pointed to v0.6.

## 0.5.0-alpha.2

### Added

- v0.5 Design Partner Alpha planning document.
- v0.5 setup and template architecture document.

## 0.1.0-alpha

### Added

- v0.1 protocol, Control Plane, REST, event, DTO, App Core, release, demo, and architecture documentation.
