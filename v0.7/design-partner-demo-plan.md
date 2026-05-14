# v0.7 Design Partner Demo Plan

## Purpose

The v0.7 design partner preview should show that IsoniaOS is moving from a demo-ready governance UI toward a credible governance protocol foundation.

The audience should be small and selected: DAO operators, protocol founders, governance contributors, ecosystem partners, and technical design partners.

## Demo goal

Show that IsoniaOS can help an organization move through:

```text
create organization
activate governance structure
review authority model
finalize bootstrap where compatible
discuss clearer governance constraints
```

For the current v0.7 alpha line, separate demo-ready behavior from production readiness claims.

Demo-ready behavior:

- typed contract batch activation;
- serial activation fallback;
- capabilities endpoint;
- capability-aware App Core setup;
- lifecycle/finalization read model where compatible;
- finalization flow where deployed contracts support it;
- App Core finalization UX where compatible.

Still out of scope for the preview:

- audit-ready production governance enforcement for critical treasuries;
- Safe integration;
- multi-chain execution;
- token voting;
- delegation;
- full Proposal Action Builder production release.
- production storage service or public upload service.

## What to demonstrate

### 1. Organization lifecycle

Explain the lifecycle:

```text
Created -> Activating -> Active -> Finalized
```

Show how the product communicates state without overwhelming the user.

### 2. Activation reliability

Show that serial activation remains the reliable fallback.

Show typed contract batch activation as the current preferred optimized path.

Do not position EIP-5792 as the default reliable path.

### 3. Bootstrap finalization

Show why finalization matters where the deployed stack supports it:

- before finalization, bootstrap admin can complete setup;
- after finalization, unilateral admin control is restricted;
- future changes should flow through governance routes or scoped authority.

Be explicit that current finalization support is alpha protocol hardening, not audit-ready production governance enforcement for critical treasuries.

### 4. Governance Structure

Show the visual structure page:

- bodies;
- roles;
- mandates;
- policy routes;
- lifecycle/finalization status.

Avoid fake health scores.

### 5. Proposal Action Builder direction

Show design direction only.

Explain that the v0.7 baseline is a design milestone, not production support. The goal is to make executable governance actions understandable before submission.

Use the baseline decisions as the preview frame:

- first MVP supports one EVM write call per proposal action;
- manual ABI paste/upload comes first;
- explorer import and Sourcify/verified metadata are future adapters;
- action intent metadata explains the payload but does not replace on-chain execution truth;
- simulation is recommended but optional;
- hidden late-bound values and multi-call bundles are future design areas.

### 6. Metadata/storage direction

Explain that IsoniaOS will not expose public IPFS write RPC.

Show the schema and trust-boundary posture:

- organization, proposal, action, action intent, and attachment metadata schemas;
- upload intents;
- purpose and size limits;
- schema validation;
- CID registry;
- managed gateway policy;
- abuse/takedown status;
- encryption guidance for sensitive data.

Do not claim upload service availability, IPFS pinning availability, managed gateway availability, malware scanning, or production encryption/key management unless those capabilities are implemented in a later task.

## What not to demonstrate

Do not present the following as v0.7-ready unless explicitly implemented later:

- production SaaS billing;
- custom domains;
- Safe integration;
- multi-chain execution;
- token-weighted voting;
- delegation;
- AI arbitration;
- production audit readiness;
- full Proposal Action Builder release;
- production storage service;
- upload API;
- IPFS pinning service;
- managed gateway service;
- encryption/key management;
- tenant provisioning.

## Suggested demo script

### Step 1 - Product framing

IsoniaOS is a governance operating system for accountable digital organizations.

It is not just a voting interface. It helps define and operate authority, roles, mandates, policy routes, execution rules, diagnostics, and accountability flows.

### Step 2 - Create organization

Create or show an organization root.

Explain that one customer workspace is normally one primary organization, even if future deployments can span multiple chains or execution contexts.

### Step 3 - Activate structure

Show activation.

Show typed batch activation and mention serial fallback.

### Step 4 - Review Governance Structure

Show the graph/list view.

Explain authority relationships and policy routes in plain language.

### Step 5 - Finalize bootstrap

Show the finalization flow where the deployed contracts support it.

Explain that this is where the bootstrap admin hands off unilateral authority in compatible current alpha deployments. Do not claim production enforcement, audit readiness, Safe integration, multi-chain execution, token voting, delegation, or full Proposal Action Builder readiness.

### Step 6 - Discuss next execution layer

Show Proposal Action Builder design.

Explain future action authoring:

- single EVM write call first;
- manual ABI paste/upload;
- future explorer and verified metadata adapters;
- human-readable calldata;
- canonical action intent metadata;
- calldata hash and metadata reference distinction;
- action metadata;
- optional simulation/dry-run status;
- no hidden late-bound execution values in the first MVP.

## Feedback questions

Ask design partners:

- Is the lifecycle understandable?
- Does finalization increase trust?
- Which admin powers should remain after finalization, if any?
- Is typed batch activation important for their onboarding?
- What proposal actions would they need first?
- What metadata must be public versus private?
- What would block them from testing IsoniaOS in a real DAO workflow?

## Success criteria

The preview is successful if design partners understand:

- why IsoniaOS is not just another voting UI;
- why bootstrap finalization matters;
- how activation becomes more reliable in v0.7;
- what Proposal Action Builder will solve;
- what remains intentionally out of scope.
