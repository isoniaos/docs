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
- storage and metadata schema direction;
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
  -> remaining work: docs alignment, clean demo-stack verification, Proposal Action Builder design, metadata/storage schemas, and design partner preview
```

Do not present the current alpha stack as production governance enforcement or audit-ready infrastructure.

### v0.7-alpha.7 - Proposal Action Builder design

Design the Proposal Action Builder.

This milestone is design-first. Full production implementation is not required in v0.7.

Design decisions that remain open:

- single write call first or multi-call first;
- manual ABI paste or explorer import first;
- simulation required or optional;
- unsupported dynamic/late-bound values rejected or constrained;
- how builder-generated metadata is stored and verified.

The design should cover:

- ABI import from Etherscan-compatible explorers;
- manual ABI paste/upload;
- NatSpec extraction;
- human-readable calldata;
- human-readable `dataHash`;
- multiple write calls;
- read-call dependencies;
- late-bound execution values;
- simulation/dry-run;
- chain-specific explorer adapters.

### v0.7-alpha.8 - Metadata/storage schemas

Define metadata and storage models.

Expected outputs:

- organization metadata schema;
- proposal metadata schema;
- action metadata schema;
- upload intent model;
- CID registry model;
- gateway policy;
- privacy/encryption guidance.

### v0.7-beta.1 - Design partner protocol preview

Prepare a small design partner preview showing the v0.7 protocol improvements.

The goal is not mass-market launch. The goal is focused feedback from a small group of technical and governance-aware users.

Remaining work before this preview:

- finish this v0.7 docs alignment;
- run clean demo-stack verification against the compatible alpha release set;
- keep Proposal Action Builder as a design milestone;
- keep metadata/storage as schema and architecture direction;
- prepare selected design partner preview materials.

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
