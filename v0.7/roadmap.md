# IsoniaOS v0.7 Roadmap

## Goal

Move from a demo-ready UX/product foundation to protocol hardening and real governance execution foundations.

v0.7 should establish the governance lifecycle, reliable activation path, finalization/admin handoff model, and the first concrete design for safer proposal execution authoring.

Current alpha status:

- typed admin batch activation is the completed activation baseline;
- bootstrap finalization is implemented across the current alpha stack where deployed contracts support it;
- shared types, SDK, Control Plane, App Core, and demo stack have compatible downstream alignment;
- serial activation remains the reliable fallback;
- EIP-5792 remains optional diagnostics/prototype behavior, not the reliable path.

## Product direction

v0.7 should preserve the v0.6 UX foundation and avoid turning the app into an engineering console.

Default screens should remain product-focused. Technical detail belongs in disclosures, diagnostics, technical tabs, or dedicated protocol documentation.

## v0.7 milestones

### v0.7-alpha.1 - Documentation and architecture baseline

Create and review the v0.7 documentation pack.

Expected outputs:

- v0.7 roadmap;
- protocol roadmap;
- bootstrap finalization design;
- admin batch activation design;
- Proposal Action Builder design;
- storage and metadata schema baseline;
- Control Plane roadmap;
- App Core roadmap;
- compatibility matrix;
- design partner demo plan.

Non-goal:

- no runtime implementation.

### v0.7-alpha.2 - Typed admin batch activation stack alignment

Typed contract-level batch activation is the completed v0.7 activation hardening baseline across the current alpha stack.

The stable direction is:

- typed batch functions instead of arbitrary calldata multicall;
- deterministic events;
- predictable indexing;
- clear partial failure behavior;
- gas-aware structure.

Possible function families:

- `batchCreateBodies`;
- `batchCreateRoles`;
- `batchAssignMandates`;
- `batchSetPolicyRules`;
- typed bootstrap activation bundle if justified.

### v0.7-alpha.3 - Bootstrap finalization / admin handoff model

Refined the organization lifecycle and finalization model:

```text
Created -> Activating -> Active -> Finalized
```

Clarified:

- who can finalize;
- whether finalization is reversible;
- what is blocked after finalization;
- whether governance approval is required;
- whether emergency recovery exists;
- how scoped administrative authority works after handoff.

Selected v0.7 alpha path:

- explicit irreversible finalization by bootstrap admin after activation review;
- bootstrap admin functions for bodies, roles, mandates, and policy rules blocked after finalization;
- future changes routed through governance-controlled mechanisms or explicitly scoped authority;
- emergency/recovery treated as an open design area, not a hidden admin escape hatch.

### v0.7-alpha.4 - EVM contracts implementation

Implemented bootstrap finalization in `evm-contracts`.

Requirements:

- tests;
- events;
- ABI updates;
- no silent ABI assumptions;
- clear compatibility expectations for `types`, `sdk`, and `control-plane`.

### v0.7-alpha.5 - Control Plane indexing/read models

Index and expose new protocol state where deployed contracts support it.

Expected indexing/read-model updates:

- lifecycle state;
- bootstrap finalization status;
- admin handoff status;
- finalization event projection;
- policy and mandate change history where needed.

### v0.7-alpha.6 - App Core support

Update UI flows for the new protocol state where deployed contracts and read models support it.

Expected UX updates:

- activation can use contract-level batch when available;
- serial activation remains fallback when needed;
- finalization step is visible and understandable;
- post-finalization admin restrictions are explained;
- Governance Structure reflects finalized state;
- warnings are calm and precise.

## Current sequence

The current sequence is:

```text
typed batch activation baseline completed
  -> bootstrap finalization implemented across the current alpha stack
  -> downstream alignment exists across types/sdk/control-plane/app-core
  -> remaining work: docs alignment, clean demo-stack verification, Proposal Action Builder design, metadata/storage schema baseline, and design partner preview
```

Do not present the current alpha stack as production governance enforcement or audit-ready infrastructure.

### v0.7-alpha.7 - Proposal Action Builder design

Define the Proposal Action Builder design baseline.

This milestone is design-first. Full production implementation is not required in v0.7.

Baseline decisions:

- first MVP supports one EVM write call per proposal action;
- manual ABI paste/upload is the first ABI source;
- verified explorer import, Sourcify/verified metadata, and NatSpec enrichment are future adapters or enrichments;
- default review is human-readable, with raw calldata and hash detail behind advanced disclosure;
- action intent metadata explains the payload but does not replace on-chain target/value/calldata as execution truth;
- `calldataHash`, metadata hash/CID, and action intent are separate concepts;
- simulation is recommended but optional;
- hidden late-bound values are rejected in the first MVP;
- multi-call bundles remain future work.

### v0.7-alpha.8 - Metadata/storage schema baseline

Define metadata and storage schemas and trust boundaries.

This milestone is design-first. It does not require or imply a production storage service, upload API, IPFS pinning implementation, managed gateway implementation, or encryption/key management implementation.

Expected outputs:

- organization metadata schema;
- proposal metadata schema;
- action metadata schema;
- action intent schema;
- attachment metadata schema;
- schema versioning rules;
- upload intent model;
- CID registry model;
- gateway policy;
- privacy/encryption guidance.

### v0.7-beta.1 - Design partner protocol preview

Prepare the [`Design Partner Preview Pack`](./design-partner-preview-pack.md) and use it for small selected-partner walkthroughs showing the v0.7 protocol improvements.

The goal is not mass-market launch. The goal is focused feedback from a small group of technical and governance-aware users.

Remaining work before this preview:

- finish this v0.7 docs alignment;
- run clean demo-stack verification against the compatible alpha release set;
- keep Proposal Action Builder as a design milestone;
- keep metadata/storage as schema and architecture direction, not production storage service availability;
- prepare selected design partner preview materials with audience, readiness level, demo narrative, honest scope boundaries, feedback questions, success criteria, and call-notes template.

## Non-goals

Do not include unless explicitly reprioritized:

- production SaaS billing;
- custom domains;
- full IPFS upload service;
- Safe integration;
- multi-chain execution;
- token-weighted voting;
- delegation;
- AI arbitration;
- production audit readiness;
- full Proposal Action Builder production release;
- tenant provisioning.

## Release discipline

For each repo involved in v0.7, use:

```text
1 feature task
1 review
1 release bookkeeping task
1 tag
1 short status update
```

Feature tasks:

- do not bump package versions;
- do not create tags;
- update changelog `[Unreleased]`;
- update backlog if needed;
- run relevant checks.

Release tasks:

- only version/changelog/backlog metadata;
- no runtime code;
- run checks;
- user tags manually after review.
