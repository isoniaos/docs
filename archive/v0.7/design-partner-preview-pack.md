# v0.7 Design Partner Preview Pack

## Preview positioning

This is a selected-partner protocol preview for DAO/Web3 governance operators. It demonstrates the v0.7 alpha governance lifecycle foundation: activation, authority visibility, finalization, diagnostics, and the design direction for executable proposal actions and metadata. It is not a production SaaS launch or audit-ready governance security release.

## Audience

This preview is for selected partners who understand governance operations, protocol constraints, or Web3 organization design:

- DAO operators;
- protocol founders;
- governance leads;
- grants program operators;
- foundation and council operators;
- Web3 ecosystem partners;
- technical governance contributors.

This preview is not for:

- mass self-serve users;
- critical treasury production migration;
- public SaaS customers;
- non-technical civic institutions.

## Readiness level

Readiness level:

```text
v0.7-alpha design partner preview
```

Meaning:

- suitable for selected walkthroughs;
- suitable for feedback from technical and governance-aware users;
- suitable for local demo exploration;
- not suitable for production-critical governance;
- not audit-ready;
- not a paid SaaS launch.

## Demo narrative

The expected call length is 15-25 minutes. Keep the walkthrough concrete and calm: show what exists, frame what is design direction, and ask for operational feedback.

### 1. Product framing

Goal: explain that IsoniaOS is about governance lifecycle, not only voting.

Suggested presenter copy:

```text
IsoniaOS is a governance operating system for accountable digital organizations. The product thesis is that governance is not a vote; governance is a lifecycle. v0.7 focuses on the lifecycle foundation: setup, activation, authority visibility, finalization, diagnostics, and the design direction for safer executable proposal actions.
```

### 2. Organization overview

Goal: show the organization space and orient the partner before showing details.

Suggested presenter copy:

```text
This is the organization space. The goal is to make the governance structure understandable before people are asked to trust it. We want operators to see what exists, what state it is in, and which authority model is currently active.
```

### 3. Activation

Goal: show reliable setup and explain the optimization path without overclaiming wallet support.

Suggested presenter copy:

```text
Activation is the setup phase where the organization receives its bodies, roles, mandates, and policy routes. v0.7 keeps serial activation as the reliable fallback and adds typed contract-level batch activation where the deployed contracts support it. The important point is reliability: batch activation is explicit and indexable, while serial activation remains available when batching is not compatible.
```

Avoid saying:

- every wallet supports reliable batch activation;
- EIP-5792 is the primary path;
- wallet-driven write flow is fully verified unless a specific browser and wallet verification note exists.

### 4. Authority review

Goal: show Governance Structure, bodies, roles, mandates, policy routes, and graph/read surfaces.

Suggested presenter copy:

```text
This is the authority review surface. It shows the governance bodies, assigned roles, active mandates, and proposal routes. The point is to make power visible: who can decide what, under which mandate, and through which route. The read model is explanatory; the protocol remains the authority for onchain governance state.
```

### 5. Finalization

Goal: explain why bootstrap authority must end and show finalization where compatible.

Suggested presenter copy:

```text
During setup, a bootstrap admin can configure the organization. That is useful for onboarding, but it should not be the permanent governance model. Finalization is the handoff point: after finalization, bootstrap-only authority over governance-critical setup is restricted where the deployed contracts support it. This is alpha protocol hardening, not a production security certification.
```

### 6. Diagnostics

Goal: show capabilities and read-model health as supporting evidence, not the main product.

Suggested presenter copy:

```text
Diagnostics explain what this deployment supports and whether the read surfaces are aligned. This is intentionally secondary. Operators should not have to live in diagnostics, but technical partners need a way to verify capabilities, unsupported states, and indexing health during an alpha preview.
```

### 7. Proposal Action Builder design

Goal: explain the design direction for executable action authoring.

Suggested presenter copy:

```text
The Proposal Action Builder is the future authoring surface for executable governance actions. The v0.7 baseline is design-only: one EVM write call first, manual ABI paste or upload first, human-readable action intent review, calldata hash detail, and optional simulation status. The goal is to make executable actions understandable before approval without pretending metadata replaces the onchain payload.
```

### 8. Metadata and storage design

Goal: explain trust boundaries and public/private metadata direction.

Suggested presenter copy:

```text
Metadata helps people understand organizations, proposals, actions, and attachments, but metadata is not governance authority. v0.7 defines the schema direction, CID registry model, upload intent model, gateway policy posture, and privacy warnings. It does not ship a production storage service, upload API, pinning service, managed gateway, or encryption/key management system.
```

### 9. Feedback capture

Goal: collect concrete workflow, risk, integration, and adoption feedback.

Suggested presenter copy:

```text
The purpose of this preview is feedback. We want to know which parts are understandable, which parts increase trust, what would block adoption, and what non-critical workflow you would consider testing later.
```

## What is demo-ready now

The current v0.7 alpha preview can honestly demonstrate:

- local demo-stack clean build/deploy/seed when verified against the compatible alpha release set;
- Control Plane diagnostics;
- capabilities endpoint;
- serial activation fallback;
- typed contract batch activation where compatible;
- lifecycle/finalization status where compatible;
- finalization flow where compatible;
- post-finalization admin restriction behavior where compatible;
- App Core read surfaces for organization, Governance Structure, proposals, graph, and diagnostics;
- Proposal Action Builder design direction;
- storage and metadata schema direction.

Do not imply wallet-driven write flow is fully verified unless it has been completed in a browser with a specific supported wallet such as MetaMask or Rabby and recorded as a verification note.

## What is design-only

These areas are design direction, not demo-ready runtime capability in v0.7:

- full Proposal Action Builder UI;
- explorer import;
- Sourcify and verified metadata adapters;
- simulation provider integration;
- multi-call actions;
- upload API;
- IPFS pinning service;
- managed gateway service;
- encryption and key management;
- public governance archive;
- accountability dashboard.

## What is explicitly out of scope

Do not present these as part of the v0.7 design partner preview:

- production SaaS billing;
- custom domains;
- production audit readiness;
- Safe integration;
- multi-chain execution;
- token-weighted voting;
- delegation;
- AI arbitration;
- tenant provisioning;
- critical treasury production use.

## Feedback questions

### Lifecycle and finalization

- Is the `Created -> Activating -> Active -> Finalized` model understandable?
- Does finalization increase trust?
- Which admin powers, if any, should remain after finalization?
- Would a DAO accept irreversible bootstrap finalization?

### Activation and setup

- Does typed batch activation matter for onboarding?
- Is serial fallback clear enough?
- What setup complexity would block adoption?

### Governance structure

- Are bodies, roles, mandates, and routes understandable?
- What governance structures should the first templates support?

### Executable actions

- What one-call proposal actions would you need first?
- Is manual ABI paste/upload acceptable for early technical users?
- Is optional simulation enough for the first MVP?
- Which actions would require multi-call?

### Metadata and storage

- What metadata must be public?
- What metadata must stay private?
- Would CID-based metadata be acceptable?
- What compliance or privacy blockers do you see?

### Adoption

- What would make you run a pilot?
- What would block you from trying IsoniaOS in a non-critical workflow?
- Which existing tools must IsoniaOS integrate with first?

## Success criteria

The preview is successful if design partners can explain that:

- IsoniaOS is not just a voting UI;
- IsoniaOS models authority and lifecycle;
- finalization is a trust improvement;
- typed activation improves onboarding reliability;
- Proposal Action Builder will make executable actions more understandable;
- metadata and storage design protects trust boundaries;
- v0.7 is an alpha protocol foundation, not a production launch.

The product feedback is successful if the preview produces:

- at least 3 concrete workflow candidates;
- at least 3 objections or blockers;
- at least 1 potential design partner willing to test a non-critical workflow later.

## Follow-up tasks after feedback

After each preview call:

- record call notes using the template below;
- tag feedback as lifecycle, activation, governance structure, executable actions, metadata/storage, integrations, security/compliance, or adoption;
- identify whether the partner named a concrete non-critical pilot workflow;
- separate product objections from implementation bugs or documentation gaps;
- update the v0.7/v1.0 backlog only after grouping feedback across calls;
- do not convert a single partner request into scope unless it fits the DAO-first roadmap and trust boundaries.

## Follow-up template

```markdown
# Design Partner Call Notes

Partner:
Date:
Profile:
Current governance stack:
Pain points:
Most interesting IsoniaOS capability:
Confusing parts:
Required integrations:
Security/compliance concerns:
Potential pilot workflow:
Follow-up:
```
