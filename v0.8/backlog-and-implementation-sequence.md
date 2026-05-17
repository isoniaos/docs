# v0.8 Backlog and Implementation Sequence

## Purpose

This document triages the v0.8 backlog and recommends an implementation order after the documentation baseline.

The order below is a recommendation, not a release guarantee. Future implementation tasks should still inspect repository state, compatibility, and constraints before changing runtime code.

## P0 for v0.8

P0 items define the baseline needed before runtime work should expand.

- v0.7 docs archive and v0.8 active docs positioning.
- v0.8 testing and demo strategy.
- Expanded demo organization and governance process.
- Shared conceptual model alignment for `DecisionRecord`, `AccountabilityRecord`, `ExternalResource`, source labels, trust boundaries, and authority claims.
- Stale App Core `/` copy cleanup from `v0.6 local demo`.
- External evidence link-first posture.
- Integration-lab separation from core product repositories.
- Local deterministic demo flow.
- Generic proof/action metadata and provider adapter direction.
- Custom template guardrails as versioned configuration, not authority.
- Basic public archive and accountability UI shape later.
- Docs-to-types/contracts handoff.

## P1 for v0.8

P1 items should follow the P0 baseline and remain careful about authority claims.

- Simple public archive runtime view.
- Basic accountability dashboard table/cards.
- External resource fixtures.
- Block explorer proof link parser/renderer.
- Safe proof link preview.
- Snapshot/Tally/Agora link preview.
- Testnet smoke script.
- Pinned Sepolia fork fixtures.
- Integration-lab field notes and issue log.
- Updated design partner preview pack.

## Explicit Non-Goals for v0.8

v0.8 should not include or claim:

- production SaaS;
- production SaaS readiness;
- audit-ready claims;
- public beta readiness claims before the readiness wave is complete;
- full Safe integration;
- full Snapshot write/import lifecycle;
- full Tally/Agora integration;
- NFT voting runtime;
- production-grade indexer;
- AI governance;
- treating external records as authority by default;
- EIP-5792 as the primary path.
- arbitrary code execution through templates.

## Recommended Implementation Order After Docs

1. `types/sdk/control-plane`: define shared v0.8 DTO/enums for archive, accountability, and external resources.
2. `evm-contracts`: add or prepare demo governance targets and an ERC20Votes-style local DAO process, without making contracts responsible for manual or external evidence truth.
3. `control-plane`: move toward generic proof/action metadata, external resource/evidence records, and provider adapter boundaries without hardcoded customer/demo target contracts.
4. `demo-stack`: seed deterministic v0.8 scenarios and local flow, directly orchestrating only `app-core`, `control-plane`, and `evm-contracts`.
5. `app-core`: implement public archive/accountability surfaces and fix stale homepage copy.
6. `integration-lab`: validate provider assumptions with pinned Sepolia forks, live Sepolia workflows, field notes, and presentation QA scenarios outside core product code.
7. `demo-stack` plus optional testnet smoke: validate the proposal-to-proof-of-execution wedge.
8. Late v0.8 beta preflight: production-shaped core cleanup, hosted dev/stage baseline, SaaS readiness baseline, ISO readiness baseline, custom template baseline, UI polish, docs/claims review, and strict security review or audit before public beta readiness claims.

The late beta-preflight phase is required before public beta or design-partner beta, but it is not the immediate next runtime task. Current v0.8 runtime work should continue through Control Plane and App Core archive/accountability surfaces before broad contract cleanup is started.

## Integration Lab Backlog

The `integration-lab/` repository or workspace area should become the source of truth for real-world validation, not core product behavior.

Baseline contents:

- Sepolia deployment manifests;
- Snapshot testnet space workflow;
- Safe Sepolia transaction proof workflow;
- Tally/OpenZeppelin Governor compatibility experiment;
- Agora research and linking lane;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation-ready QA scenarios;
- field notes and issue log.

Integration lab work should discover provider constraints, prove public testnet flows, and generate issues for product work. It should not add demo-specific target assumptions to Control Plane route logic or audited contract scope.

## Public Beta Readiness Backlog

Before any public beta readiness claim, schedule a product-first readiness wave covering:

- production-shaped core cleanup;
- integration lab validation on Sepolia;
- hosted dev and stage environments;
- SaaS readiness baseline;
- ISO funding/protocol self-governance readiness baseline;
- custom organization/governance template baseline;
- security review or audit gate;
- claims/docs review.

ISO readiness means the funding/protocol self-governance plan, simulations, legal/security review path, treasury/identity/governance assumptions, and communications posture are coherent enough for an explicit future decision. It does not mean token launch is required.

## Custom Template Backlog

Templates should be versioned configuration blueprints. They may cover:

- organization templates;
- proposal type templates;
- policy route templates;
- accountability requirement templates;
- external evidence requirement templates;
- action metadata templates;
- integration/source templates.

Guardrails:

- templates cannot silently grant authority;
- authority-changing output must require explicit governed setup or activation;
- templates should be exportable/importable;
- risky/custom templates should show warnings;
- SaaS may later support private/team templates;
- templates must not allow arbitrary code execution in core.

## Handoff Boundaries

Shared types should come before duplicated app/backend models. Runtime work should preserve the v0.8 authority posture:

- contract/read-model state for modeled onchain governance state;
- linked evidence for external resources;
- manual annotation for operator-entered accountability updates;
- imported preview for external metadata that has not been modeled as authoritative;
- explicit stale, missing, unsupported, or unknown states.

Contracts should not become responsible for proving manual or external evidence truth. Control Plane should expose labeled read models and evidence records without becoming governance authority. App Core should make source labels and trust warnings visible where users make decisions.

`demo-stack` should not add top-level runtime pins, version variables, or tasks for `docs`, `types`, `sdk`, or `theme-default` unless it directly runs or consumes those repositories. Shared packages should be validated through the App Core or Control Plane dependency graph when those packages consume them.

## Deferred Contract Refactor and Security-Hardening Wave

Before public beta, schedule a late v0.8 contract cleanup and hardening wave. This wave should include:

- moving demo-only contracts under a demo-specific directory such as `contracts/demo/`;
- moving mocks, including any future mock USDC, under a mock-specific directory such as `contracts/mocks/`;
- isolating demo and mock contracts from production/security claims and coverage requirements unless tests explicitly opt into them;
- renaming legacy `Gov*` contract, module, and script naming to `Iso*` after dependent runtime work is stable;
- sorting Solidity functions by official Solidity visibility order: constructor, receive, fallback, external, public, internal, private, with `view` and `pure` last within each visibility group;
- adding NatSpec to main contracts and demo contracts, especially public ABI surfaces;
- removing hardcoded version labels from Ignition modules, scripts, and similar code paths because Git tags carry release versions;
- adding contract coverage reporting;
- adding gas reporting;
- performing strict security review or audit before public beta.

This is a beta-readiness requirement, not a production audit claim. Audit scope and provider/process can be defined later.

## Acceptance Baseline

The v0.8 backlog is ready for implementation planning when future tasks can identify:

- which shared DTOs/enums need to move into `@isonia/types`;
- which demo targets and governance flow are needed for local proof-of-execution;
- which fixtures are needed before provider integrations;
- which App Core copy and surfaces should change;
- which testnet smoke proves the wedge without blocking every iteration;
- which v0.8 claims remain explicitly out of scope;
- which late beta-preflight work remains before public beta readiness can be claimed.
