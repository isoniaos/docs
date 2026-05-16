# IsoniaOS v0.7 Documentation Pack

IsoniaOS v0.7 moves the project from a demo-ready product foundation toward protocol hardening and real governance execution foundations.

v0.6 established the user-facing UX baseline: organization creation, activation, proposal flows, governance structure visualization, diagnostics consolidation, theme polish, and demo-stack readiness. v0.7 should not restart that work. It builds on that foundation by hardening activation, finalization, lifecycle visibility, and the next execution-authoring design surface.

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
- [`app-core-design-guide.md`](./app-core-design-guide.md)
- [`compatibility-matrix.md`](./compatibility-matrix.md)
- [`design-partner-demo-plan.md`](./design-partner-demo-plan.md)
- [`design-partner-preview-pack.md`](./design-partner-preview-pack.md)

## v0.7 scope summary

v0.7 should focus on:

1. protocol design docs;
2. completed typed admin batch activation stack alignment;
3. bootstrap finalization / admin handoff implemented across the current alpha stack where compatible;
4. Control Plane read-model support for lifecycle and finalization state where compatible;
5. App Core support for protocol finalization and batch activation where compatible;
6. Proposal Action Builder design baseline;
7. metadata/storage schema baseline;
8. demo-stack alignment;
9. design partner protocol preview.

Use [`design-partner-preview-pack.md`](./design-partner-preview-pack.md) as the concrete call artifact for selected v0.7 design partner walkthroughs. Use [`design-partner-demo-plan.md`](./design-partner-demo-plan.md) as the longer planning backdrop.

The Proposal Action Builder baseline is design-only in v0.7. The first MVP should support one EVM write call per proposal action, manual ABI paste/upload first, human-readable action intent review, calldata hash verification, optional simulation status, and rejection of hidden late-bound values. Multi-call bundles, explorer import implementation, provider simulation integration, Safe integration, and full builder implementation remain out of scope for v0.7.

The storage and metadata baseline is also design-only in v0.7. It defines metadata object taxonomy, schema versioning, upload intents, CID registry entries, managed gateway policy, privacy/encryption guidance, and Control Plane/App Core responsibility boundaries. It does not ship or imply a production storage service, upload API, IPFS pinning implementation, managed gateway implementation, or encryption/key management implementation.

## v0.7 non-goals

The following should not be included in v0.7 unless explicitly reprioritized:

- production SaaS billing;
- custom domains;
- full IPFS upload service;
- production storage service;
- managed gateway implementation;
- encryption/key management implementation;
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
docs            v0.7.0-alpha.1 plus Unreleased v0.7 docs alignment
evm-contracts   v0.7.0-alpha.6
types           v0.7.0-alpha.2
sdk             v0.7.0-alpha.2
control-plane   v0.7.0-alpha.2
app-core        v0.7.0-alpha.4
demo-stack      v0.7.0-alpha.4 / 1c3e17341a3a925c4e0e9df4d45d68c3fa5d8dec
```

Always verify current tags before making release decisions.

## Current sequence

v0.7 has established the baseline docs, typed contract batch activation path, bootstrap finalization support, and downstream alignment across the current alpha stack where compatible.

Current sequence:

```text
typed batch activation baseline completed
  -> bootstrap finalization implemented across the current alpha stack
  -> downstream alignment exists across types/sdk/control-plane/app-core
  -> remaining work: docs alignment, clean demo-stack verification, Proposal Action Builder design, metadata/storage schema baseline, and design partner preview
```

Do not claim production governance enforcement, production audit readiness, or full Proposal Action Builder readiness from the current alpha stack.

For local protocol work, use only the canonical contracts commands:

```text
corepack pnpm deploy:local
corepack pnpm seed:local
```

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
