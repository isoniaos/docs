# IsoniaOS v0.7 Documentation Pack

IsoniaOS v0.7 moves the project from a demo-ready product foundation toward protocol hardening and real governance execution foundations.

v0.6 established the user-facing UX baseline: organization creation, activation, proposal flows, governance structure visualization, diagnostics consolidation, theme polish, and demo-stack readiness. v0.7 should not restart that work. It should build on it by clarifying each next protocol layer before implementation starts.

## Positioning

IsoniaOS is a governance operating system for accountable digital organizations.

The current market focus is DAO-first governance infrastructure. The long-term direction is broader organizational governance, civic initiatives, and eventually public-sector or civic governance, but only after IsoniaOS proves clear value in the DAO market.

IsoniaOS is not just another DAO voting interface. It is a governance architecture layer for defining and operating:

- authority structures;
- roles;
- mandates;
- policy routes;
- proposal routes;
- execution rules;
- diagnostics;
- lifecycle states;
- accountability flows.

## Product principle

**Lagom: nothing excessive, everything necessary.**

v0.7 should preserve the calm, minimal, understandable, and trustworthy product direction established in v0.6. Technical and protocol detail should exist, but it should not dominate normal user-facing flows.

## v0.7 documentation set

This folder contains the planning baseline for v0.7:

- [`roadmap.md`](./roadmap.md)
- [`protocol-roadmap.md`](./protocol-roadmap.md)
- [`bootstrap-finalization.md`](./bootstrap-finalization.md)
- [`admin-batch-activation.md`](./admin-batch-activation.md)
- [`proposal-action-builder.md`](./proposal-action-builder.md)
- [`storage-and-metadata.md`](./storage-and-metadata.md)
- [`control-plane-roadmap.md`](./control-plane-roadmap.md)
- [`app-core-roadmap.md`](./app-core-roadmap.md)
- [`compatibility-matrix.md`](./compatibility-matrix.md)
- [`design-partner-demo-plan.md`](./design-partner-demo-plan.md)

## v0.7 scope summary

v0.7 should focus on:

1. protocol design docs;
2. completed typed admin batch activation stack alignment;
3. bootstrap finalization / admin handoff design;
4. Control Plane read-model updates for new protocol states after protocol implementation;
5. App Core support for protocol finalization and batch activation after protocol/read-model support exists;
6. Proposal Action Builder design;
7. metadata and storage schemas;
8. demo-stack alignment;
9. design partner protocol preview.

## v0.7 non-goals

The following should not be included in v0.7 unless explicitly reprioritized:

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

## Current v0.7 release set

Use the following as the current v0.7 alpha release set for planning unless newer tags are verified:

```text
docs            v0.7.0-alpha.1
evm-contracts   v0.7.0-alpha.1
types           v0.7.0-alpha.1
sdk             v0.7.0-alpha.1
control-plane   v0.7.0-alpha.1
app-core        v0.7.0-alpha.1
demo-stack      ed050f6bc33dfde0c1fa8ef974a23adfbe0e441d
```

Always verify current tags before making release decisions.

## Current sequence

v0.7 has established the baseline docs and typed contract batch activation path across the stack. The next design area is bootstrap finalization/admin handoff.

Implementation should proceed in this order:

```text
bootstrap finalization design
  -> evm-contracts implementation
  -> types/sdk/control-plane/app-core alignment
  -> demo-stack verification
```

Do not claim finalization is implemented until the protocol, shared types, read models, UI, and demo stack are aligned.

## Release process rule

Use this cycle:

```text
1 feature task
1 review
1 release bookkeeping task
1 tag
1 short status update
```

Feature tasks must not bump versions or create tags. Release bookkeeping tasks must not change runtime code.
