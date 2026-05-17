# v0.8 Testing and Demo Strategy

## Purpose

This document defines the v0.8 test posture for the Public Governance Archive, Basic Accountability Dashboard, and Integration Preview.

v0.8 testing should prove that IsoniaOS can show what happened after a DAO decision without overclaiming authority from external tools. Local flows are the primary product-development lab. Pinned Sepolia forks and live Sepolia workflows are validation layers, not substitutes for deterministic local coverage.

This is a docs baseline only. It does not implement runtime tests, contracts, Control Plane, SDK, App Core, demo-stack, or external integrations.

## Validation Lane Summary

Use three distinct lanes:

| Lane | Purpose | Should prove | Should not claim |
| --- | --- | --- | --- |
| Local deterministic tests | Fast, provider-independent product regression. | Lifecycle, accountability, evidence, and trust-boundary behavior. | Real provider completeness. |
| Pinned Sepolia forks | Repeatable validation against known public chain data. | Known event, transaction, Governor-like, Safe-like, and explorer proof assumptions. | Live provider availability or workflow completeness. |
| Live Sepolia workflows | Real-world smoke validation and field discovery. | One or more public proposal-to-proof scenarios can be demonstrated with real testnet records. | Production readiness, audit readiness, or full integration support. |

Integration-lab scenarios belong in `integration-lab/`, not in core product repositories.

## Local Node: Primary Product-Development Lab

Local deterministic flows are the primary environment for v0.8 product development.

Use local node, local fixtures, and deterministic seeded scenarios for:

- Public Governance Archive;
- accountability records;
- execution state rendering;
- manual status updates;
- external evidence link rendering;
- trust-boundary warnings;
- proposal-to-proof-of-execution flows;
- stale, missing, and unknown read-model states.

Local testing must not depend on Snapshot, Safe, Tally, Agora, Discourse, GitHub, or a block explorer being available. External records should be represented by fixtures or manually supplied URLs with source labels and trust boundaries.

Local tests should cover both the happy path and incomplete-state cases:

- approved proposal with observed execution;
- approved proposal with execution pending;
- approved proposal with overdue accountability;
- failed or cancelled follow-through with a reason;
- manual completion annotation;
- imported preview state that is stale, missing, unsupported, or unknown.

## Pinned Sepolia Fork or Fixture-Backed Validation

Pinned Sepolia fork or fixture-backed validation is useful for checking real-world formats while keeping regression behavior repeatable.

Use fork/read-only validation to inspect:

- known Sepolia blocks and transactions;
- existing transaction formats;
- Governor-like proposal and execution records;
- Safe-like transaction evidence shapes;
- block explorer link formats;
- historical execution proof assumptions.

Fork testing is useful but not sufficient for external integration coverage. A pinned fork can show that a format exists and can be read consistently, but it does not prove that a provider API is stable, that an external workflow is complete, or that an external record is governance authority.

When fork data is used in v0.8, display it as observed evidence, imported preview, or context unless explicit source modeling says otherwise.

## Live Sepolia Public Proof Smoke

v0.8 should include a minimal live public proof smoke test, recommended on Sepolia unless the project later changes the default network.

The smoke should:

1. deploy or use a demo organization;
2. create one governance decision;
3. vote or approve the decision;
4. execute one target method;
5. capture a real transaction hash;
6. attach a block explorer proof link;
7. optionally attach Safe, Snapshot, Tally, Agora, GitHub, or Discourse links as evidence or context;
8. verify that the public archive shows the decision, execution state, proof link, source labels, and trust-boundary warnings.

This smoke test should validate the proposal-to-proof-of-execution wedge in public. It should produce field notes for provider gaps and workflow assumptions. It should not become a blocker for every docs or runtime iteration. Local deterministic flows remain the primary development and regression path.

## Integration Lab Boundary

The future or sibling `integration-lab/` repository should own public testnet validation artifacts:

- Sepolia deployment manifests;
- Snapshot testnet space workflow;
- Safe Sepolia transaction proof workflow;
- Tally/OpenZeppelin Governor compatibility experiment;
- Agora research/linking lane;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation-ready QA scenarios;
- field notes and issue log.

The integration lab is not core product code. Its fixtures, demo contracts, provider experiments, and presentation flows must not define Control Plane authority semantics or audited contract scope.

## Demo-Stack Runtime Scope

For v0.8, `demo-stack` should directly orchestrate only:

- `app-core`;
- `control-plane`;
- `evm-contracts`.

Do not present `docs`, `types`, `sdk`, or `theme-default` as first-class demo-stack runtime package pins unless `demo-stack` truly consumes them directly. `types`, `sdk`, and theme packages may still be dependencies inside App Core or Control Plane, and docs remain the source of architecture and acceptance criteria. The demo-stack boundary is about direct runtime orchestration, top-level version variables, and demo tasks.

## External Tool Test Posture

Provider-specific expectations:

- Snapshot: link/import preview only; use fixtures locally; treat Snapshot as offchain signal or context.
- Safe: transaction proof link; use fixtures locally; treat Safe as workflow or execution evidence, not automatic governance authorization.
- Tally/Agora: proposal link or context; authority depends on underlying contracts and explicit source modeling.
- Discourse/GitHub: discussion or implementation context only.
- Block explorers: transaction observation or proof link; do not treat explorer UI as governance authority.
- Custom links: manual evidence or context with explicit unverified/manual labels.

Provider previews must preserve:

- provider;
- relation to the governance record;
- source label;
- trust boundary;
- authority claim;
- stale/error/import state where relevant.

## Test Matrix

| Area | Local fixture | Pinned fork/read-only | Live Sepolia smoke | Authority boundary |
| --- | --- | --- | --- | --- |
| Public Governance Archive | Seed proposal, decision, execution, and evidence states. | Compare with pinned Sepolia proposal and transaction shapes. | Show one public decision page with execution proof. | Contract/read-model state is distinct from linked evidence. |
| Accountability records | Seed statuses, due dates, responsible parties, notes, and reasons. | Validate realistic follow-through metadata shapes where available. | Attach one accountability record to a public decision. | Manual updates are annotations, not protocol truth. |
| Execution state rendering | Seed executed, pending, failed, cancelled, and unknown states. | Check transaction/event formats from real contracts. | Capture one executed target transaction hash. | Execution proof is evidence unless protocol execution state is modeled. |
| External evidence links | Use Snapshot, Safe, Tally, Agora, Discourse, GitHub, explorer, and custom URL fixtures. | Validate URL and reference formats against real examples. | Attach optional public links with labels. | External records are context/evidence unless explicitly modeled as authority. |
| Trust-boundary warnings | Render warnings for imported preview, manual evidence, stale state, and unverified links. | Confirm labels still make sense with real-world records. | Show warnings near proof and external links. | Warnings must not be hidden behind technical details. |
| Stale/missing/unknown states | Seed stale read models, missing policy/accountability records, and unknown external previews. | Simulate partial reads or unsupported formats. | Optional; not required for minimal smoke. | Unknown must stay visible and must not silently become success. |

## Acceptance Posture

The v0.8 testing baseline is sufficient when future implementation work can answer:

- which flows must run locally without external providers;
- which real-world formats need fork or fixture-backed validation;
- what the public testnet smoke proves;
- what the public testnet smoke does not prove;
- how each external provider is labeled;
- where contract/read-model state ends and linked evidence begins.
