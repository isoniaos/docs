# IsoniaOS v0.8 Documentation Pack

IsoniaOS v0.8 is the accountability and integration preview baseline.

v0.7 is archived as the protocol foundation: typed admin batch activation, bootstrap finalization, admin handoff, lifecycle visibility, Proposal Action Builder design, and storage/metadata schema direction. v0.8 builds on that foundation by making the post-decision record the product center.

The v0.8 wedge is:

```text
proposal -> approval/decision -> responsible party -> execution status -> proof/evidence -> historical record
```

## Positioning

IsoniaOS is a governance operating system for accountable digital organizations.

v0.8 should show that governance does not end when a vote or approval passes. A decision creates a public record of what happened next: who owns the follow-through, what proof exists, what failed, what remains open, and what the organization can remember later.

Contracts remain authoritative for onchain governance state. Control Plane and App Core explain, organize, and present governance state. External integrations are linked evidence or context unless the system explicitly models a source as authoritative for a specific field.

## v0.8 documentation set

This folder contains the planning baseline for v0.8:

- [`accountability-and-integration-preview.md`](./accountability-and-integration-preview.md)
- [`testing-and-demo-strategy.md`](./testing-and-demo-strategy.md)
- [`demo-organization-and-governance-process.md`](./demo-organization-and-governance-process.md)
- [`backlog-and-implementation-sequence.md`](./backlog-and-implementation-sequence.md)
- [`execution-discipline-and-beta-readiness.md`](./execution-discipline-and-beta-readiness.md)
- [`integration-lab-and-public-beta-replan.md`](./integration-lab-and-public-beta-replan.md)

## Read order

1. [`README.md`](./README.md)
2. [`accountability-and-integration-preview.md`](./accountability-and-integration-preview.md)
3. [`testing-and-demo-strategy.md`](./testing-and-demo-strategy.md)
4. [`demo-organization-and-governance-process.md`](./demo-organization-and-governance-process.md)
5. [`backlog-and-implementation-sequence.md`](./backlog-and-implementation-sequence.md)
6. [`execution-discipline-and-beta-readiness.md`](./execution-discipline-and-beta-readiness.md)
7. [`integration-lab-and-public-beta-replan.md`](./integration-lab-and-public-beta-replan.md)

## v0.8 scope summary

v0.8 should focus on:

1. Public Governance Archive;
2. Basic Accountability Dashboard;
3. Integration Preview;
4. trust-boundary guidance for external records;
5. historical decision records;
6. local testing, fork/read-only validation, and optional testnet smoke posture;
7. expanded demo organization scenarios for accountable follow-through;
8. route and UX sketches for future App Core and public archive work;
9. backlog and implementation-sequence guidance for future runtime tasks;
10. execution discipline, demo-stack runtime boundaries, and late beta-readiness gates;
11. integration-lab separation, Sepolia validation lanes, SaaS readiness baseline, ISO readiness baseline, and custom template guardrails before any public beta claim.

## v0.8 non-goals

Do not present v0.8 as:

- production SaaS;
- audit-ready;
- a full Safe integration;
- a full Snapshot integration;
- a full Tally or Agora integration;
- AI governance;
- a replacement for onchain authority;
- production SaaS or hosted service readiness;
- token launch readiness;
- arbitrary code execution through templates;
- a system that treats external records as authoritative unless explicitly modeled as authority.

## Public beta readiness posture

The v0.8 runtime preview is not the same as public beta readiness.

Public beta readiness requires a later wave for production-shaped core cleanup, integration lab validation on Sepolia, hosted dev/stage environments, SaaS readiness baseline, ISO funding/protocol self-governance readiness baseline, custom template design, security review or audit gate, and docs/claims review.

See [`integration-lab-and-public-beta-replan.md`](./integration-lab-and-public-beta-replan.md).

## Relationship to v0.7

v0.8 depends on the v0.7 foundations:

- lifecycle/finalization state makes it clearer whether an organization is still being bootstrapped or operating under finalized governance;
- Proposal Action Builder design clarifies the future executable action review model;
- storage and metadata schemas clarify how explanatory records relate to protocol truth;
- Control Plane read models make public archive and accountability surfaces possible without making the backend a source of governance authority.

See the archived v0.7 docs for those baselines:

- [`../archive/v0.7/bootstrap-finalization.md`](../archive/v0.7/bootstrap-finalization.md)
- [`../archive/v0.7/proposal-action-builder.md`](../archive/v0.7/proposal-action-builder.md)
- [`../archive/v0.7/storage-and-metadata.md`](../archive/v0.7/storage-and-metadata.md)
- [`../archive/v0.7/control-plane-roadmap.md`](../archive/v0.7/control-plane-roadmap.md)
