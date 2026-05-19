# Changelog

All notable changes to the IsoniaOS documentation repository are documented here.

Git tags use SemVer with a leading `v`, for example `v0.7.0-alpha.1`.

## Unreleased

### Added

- Added the v0.8 client contract authority and managed execution ADR covering org-scoped executors, Ownable and role-based handoff, AccessManager/AccessManaged posture, custom access-control limits, selector-based enforcement identity, parameter constraints, target-event evidence boundaries, and public beta review gates.

### Changed

- Updated v0.8 navigation, architecture, roadmap, integration-lab, backlog, and agent guidance to reference managed execution review, client contract authority validation, parameter-constraint modeling, and Sepolia validation with Ownable-style and role-based or access-managed targets before public beta readiness claims.

## v0.8.0-alpha.3

### Added

- Added the Draft v0.2 tokenomics, governance, identity, treasury, legal roadmap, risk register, decision log, and architecture documentation pack for ISO.
- Added product-context risks and product hierarchy decisions to the risk register and decision log.
- Added v0.8 execution discipline and beta-readiness guidance covering durable docs source-of-truth rules, demo-stack runtime scope, pre-beta tagging waves, deferred contract hardening, and public beta preflight gates.
- Added the v0.8 integration lab and public beta replan covering demo/code isolation, Sepolia validation lanes, generic proof/action metadata, provider adapters, SaaS readiness baseline, ISO readiness baseline, custom template guardrails, and public beta gates.

### Changed

- Updated the whitepaper, roadmap, and README navigation for the native USDC-only launch Curve Reserve, ETH alignment layer, Curve Reserve invariant, standard ERC-20 design, identity-aware governance, Protocol Council, legal phasing, and no revenue-sharing-at-launch posture.
- Restored the whitepaper, roadmap, README, and product architecture hierarchy so IsoniaOS remains product-first and ISO tokenomics is documented as a supporting funding and protocol self-governance layer.
- Renamed the tokenomics architecture content to `ISO_ARCHITECTURE.md` and added a product-first `ARCHITECTURE.md`.
- Aligned documentation metadata files so v0.8 remains the active product baseline while Draft v0.2 remains the supporting ISO funding/governance design baseline.
- Updated v0.8 process, versioning, roadmap, testing, and backlog docs with wave-based pre-beta release discipline and late beta-readiness requirements.
- Updated the roadmap to make public beta readiness an explicit product-first wave and to integrate ISO funding/protocol self-governance readiness without making token launch a product dependency.
- Clarified SaaS public beta readiness as a hosted dev/stage, managed indexer/Postgres, provisioning, credentials, monitoring, backup, and open-core boundary baseline rather than a production SaaS claim.
- Clarified integration lab ownership and repository boundaries so provider experiments and presentation scenarios do not pollute core contracts, Control Plane internals, or App Core product logic.
- Added custom template roadmap guardrails for versioned organization, proposal, route, accountability, evidence, action metadata, and integration/source templates.

## v0.8.0-alpha.1

### Added

- Added the v0.8 accountability and integration preview documentation baseline covering Public Governance Archive, Basic Accountability Dashboard, Integration Preview, trust-boundary guidance, and historical decision records.
- Added the v0.8 testing/demo strategy, expanded demo organization/governance process, and backlog/implementation sequence baseline.

### Changed

- Archived the v0.7 protocol-hardening documentation pack under `archive/v0.7/` and repositioned v0.8 as the active documentation baseline.

## 0.7.0-alpha.6

### Changed

- Documented App Core step, breadcrumb, transaction modal, and button polish direction for the v0.7 design partner preview.
- Added the App Core v0.7 design guide for minimal wizards, transaction modal authority alerts, finalization navigation, breadcrumbs, and button behavior.

## 0.7.0-alpha.5

### Added

- Add the v0.7 design partner preview pack with readiness level, demo narrative, honest scope boundaries, feedback questions, success criteria, and call-notes template.

## 0.7.0-alpha.4

### Added

- Define the v0.7 storage and metadata schema baseline, including metadata object taxonomy, schema versioning, upload intents, CID registry, gateway policy, and privacy guidance.

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
