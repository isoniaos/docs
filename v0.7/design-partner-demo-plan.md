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
finalize bootstrap
operate with clearer governance constraints
```

## What to demonstrate

### 1. Organization lifecycle

Explain the lifecycle:

```text
Created -> Activating -> Active -> Finalized
```

Show how the product communicates state without overwhelming the user.

### 2. Activation reliability

Show that serial activation remains the reliable fallback.

If typed batch activation is implemented by preview time, show it as the preferred optimized path.

Do not position EIP-5792 as the default reliable path.

### 3. Bootstrap finalization

Show why finalization matters:

- before finalization, bootstrap admin can complete setup;
- after finalization, unilateral admin control is restricted;
- future changes should flow through governance routes or scoped authority.

### 4. Governance Structure

Show the visual structure page:

- bodies;
- roles;
- mandates;
- policy routes;
- lifecycle/finalization status.

Avoid fake health scores.

### 5. Proposal Action Builder direction

Show design direction only unless implementation exists.

Explain that the goal is to make executable governance actions understandable before submission.

### 6. Metadata/storage direction

Explain that IsoniaOS will not expose public IPFS write RPC.

Show the future posture:

- upload intents;
- quotas;
- schema validation;
- CID registry;
- gateway policy;
- abuse/takedown workflow;
- encryption guidance for sensitive data.

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

If batch activation is ready:

- show typed batch activation;
- mention serial fallback.

If not:

- show serial activation;
- explain batch activation is the v0.7 protocol hardening direction.

### Step 4 - Review Governance Structure

Show the graph/list view.

Explain authority relationships and policy routes in plain language.

### Step 5 - Finalize bootstrap

Show finalization or the designed finalization flow.

Explain that this is where the bootstrap admin hands off unilateral authority.

### Step 6 - Discuss next execution layer

Show Proposal Action Builder design.

Explain future action authoring:

- ABI import;
- human-readable calldata;
- action metadata;
- simulation/dry-run;
- chain-specific adapters.

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
