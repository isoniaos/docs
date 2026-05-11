# IsoniaOS v0.7 Documentation Pack

IsoniaOS v0.7 moves the project from a demo-ready product foundation toward protocol hardening and real governance execution foundations.

v0.6 established the user-facing UX baseline: organization creation, activation, proposal flows, governance structure visualization, diagnostics consolidation, theme polish, and demo-stack readiness. v0.7 should not restart that work. It should build on it by clarifying the next protocol layer before implementation starts.

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
2. typed admin batch activation;
3. bootstrap finalization / admin handoff;
4. Control Plane read-model updates for new protocol states;
5. App Core support for protocol finalization and batch activation;
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

## Baseline release line

Use the following as the latest known v0.6 baseline unless newer tags are verified:

```text
app-core        v0.6.0-alpha.18
docs            v0.6.0-alpha.8
evm-contracts   v0.6.0-alpha.4
types           v0.6.0-alpha.2
sdk             v0.6.0-alpha.4
control-plane   v0.6.0-alpha.2
theme-default   v0.6.0-alpha.3
demo-stack      final v0.6 demo release
```

Always verify current tags before making release decisions.

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
