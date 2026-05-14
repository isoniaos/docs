# Bootstrap Finalization and Admin Handoff

## Purpose

Bootstrap finalization defines the moment when an IsoniaOS organization moves from admin-driven setup into governed operation.

The v0.6 admin-driven bootstrap model is useful for demos and initial setup. It is not a permanent governance model.

This document began as the v0.7 alpha design baseline. In the current v0.7 alpha stack, the recommended finalization model is implemented where deployed contracts support it, and downstream repositories expose compatible lifecycle/finalization status. Exact Solidity, DTO, and read-model names must follow the released repositories, but the conceptual model remains stable: lifecycle, finalization, and post-bootstrap authority must be explicit.

## Problem

During bootstrap, the organization admin can create and configure the governance structure.

This includes:

- creating governance bodies;
- creating roles;
- assigning and revoking mandates;
- setting policy rules and proposal routes.

This authority is acceptable before activation and finalization because the organization does not yet have enough structure to govern itself.

It is not acceptable as permanent governance authority. If bootstrap admin power remains available forever, the admin can unilaterally change roles, mandates, bodies, and policy rules outside governance. The organization would appear governed by its configured structure, but the bootstrap admin would still be able to rewrite that structure.

## Lifecycle model

```text
Created -> Activating -> Active -> Finalized
```

The exact enum names may vary by released contract and shared DTO version. The product and protocol model should remain stable: an organization is created, configured, activated, reviewed, and then explicitly finalized.

### Created

Product meaning:

- the organization root exists;
- users can see that setup has not meaningfully started;
- governance structure is absent or incomplete.

Protocol meaning:

- the organization exists onchain;
- bootstrap admin authority is still available;
- governance-controlled operation is not expected yet.

### Activating

Product meaning:

- the organization is being configured;
- setup transactions may be serial or typed batch activation;
- review is not complete.

Expected setup activity:

- bodies are created;
- roles are created;
- mandates are assigned;
- policy routes are configured.

Protocol meaning:

- bootstrap admin functions may be available;
- activation events and normal per-item domain events should remain indexable;
- Control Plane can reconstruct setup whether actions were serial or typed batch.

### Active

The organization has enough governance configuration to operate, but bootstrap admin authority may still exist.

Product meaning:

- the structure can be reviewed and used in demo or alpha flows;
- users should see that the organization is active but not finalized;
- App Core should avoid alarmist language while still making the risk clear.

Protocol meaning:

- governance structure exists;
- proposal routes may be usable;
- bootstrap-only admin functions are not necessarily blocked yet.

### Finalized

Bootstrap authority has been explicitly ended or handed off.

Product meaning:

- the organization has completed bootstrap review;
- App Core can show a finalized state badge on overview and Governance Structure surfaces;
- bootstrap admin controls for bodies, roles, mandates, and policy rules should be disabled with clear reason text.

Protocol meaning:

- finalization is an explicit onchain transition;
- bootstrap-only admin functions are blocked;
- future changes must follow governance-controlled mechanisms or explicitly scoped authority;
- the transition emits an indexable event.

## Finalization semantics

Finalization should be a first-class protocol transition, not a UI-only flag.

Current v0.7 alpha semantics where compatible:

- finalization is explicit;
- finalization is irreversible by default;
- finalization emits an indexable event;
- after finalization, bootstrap-only admin functions are blocked;
- no hidden owner/admin escape hatch should remain for governance-critical configuration;
- future changes to bodies, roles, mandates, and policy rules should use governance-controlled routes or explicitly scoped authority in later iterations.

Examples of bootstrap-only functions that should be blocked after finalization:

- create governance body;
- create governance role;
- assign mandate;
- revoke mandate if implemented as bootstrap admin authority;
- set or replace policy rule;
- alter proposal routes through bootstrap admin paths.

Exact function names depend on the `evm-contracts` implementation. The design intent is that the bootstrap admin cannot silently retain global control after the organization has been finalized.

## Admin handoff options

### Option 1: irreversible finalization by current org admin

The current bootstrap admin calls a finalization function after activation review.

Advantages:

- simple to implement and test;
- easy to explain in App Core;
- does not require full governance execution machinery first;
- makes the end of bootstrap authority explicit.

Risks:

- the bootstrap admin decides when the organization is ready;
- accidental finalization is hard to recover from if no recovery model exists.

### Option 2: finalization by governance proposal

A configured governance route finalizes the organization after enough structure exists.

Advantages:

- strongest alignment with the governance model;
- avoids unilateral handoff by the bootstrap admin;
- creates a natural review point.

Risks:

- requires reliable proposal execution for protocol configuration changes;
- may overload v0.7 alpha scope;
- could block demos and early partner testing on unfinished execution machinery.

### Option 3: two-step admin handoff

The bootstrap admin proposes finalization, then confirms after a delay or second transaction.

Advantages:

- reduces accidental finalization risk;
- gives App Core a review/confirmation flow;
- does not require full governance proposal execution.

Risks:

- adds state and edge cases;
- still leaves final authority with the bootstrap admin;
- may be unnecessary for the first alpha implementation.

### Option 4: scoped post-finalization admin roles

Specific roles, such as a future `BodyAdmin`, can manage limited configuration after finalization.

Advantages:

- supports operational maintenance;
- can represent limited authority in the governance graph;
- avoids forcing every small change through a global route.

Risks:

- can recreate hidden admin power if scope is too broad;
- needs precise role semantics;
- should be visible in contracts, types, read models, and UI.

### Option 5: emergency recovery

An emergency or recovery mechanism handles exceptional cases after finalization.

Advantages:

- may be necessary for production deployments;
- can reduce permanent lockout risk.

Risks:

- can become a hidden admin escape hatch;
- requires careful governance design, events, and user-facing explanation;
- should not be smuggled into v0.7 alpha as owner power.

## Current v0.7 alpha path

The current v0.7 alpha path is explicit irreversible finalization by the bootstrap admin after activation review, where deployed contracts support finalization.

Expected behavior:

- the bootstrap admin can finalize an active organization;
- finalization emits an event;
- after finalization, bootstrap admin cannot mutate bodies, roles, mandates, or policy rules through bootstrap admin functions;
- future changes are routed through governance-controlled mechanisms or explicitly scoped role authority in later iterations;
- emergency/recovery remains an explicit open design area, not a hidden admin escape hatch.

Reasoning:

- v0.7 alpha should harden the model without overloading scope;
- governance-approved finalization may require more proposal execution machinery than v0.7 should implement immediately;
- the important first step is making handoff explicit, indexable, and enforceable;
- emergency paths should be intentionally designed later rather than retained as invisible owner authority.

## Reversibility

Finalization should be irreversible by default in v0.7 alpha.

Reasoning:

- reversible finalization weakens the trust model;
- emergency paths should be explicit and scoped, not a hidden reset button;
- if recovery is needed, it should be represented in governance policy or future modules.

## Post-finalization restrictions

After finalization, bootstrap admin should not be able to unilaterally:

- create governance bodies;
- create governance roles;
- assign or revoke mandates;
- change policy rules;
- change proposal routes;
- bypass configured execution policies.

Exact restrictions depend on the current contract boundaries.

## Scoped authority after finalization

A future `BodyAdmin` or similar scoped role may be allowed to manage limited configuration for a specific body.

Important rule:

Scoped authority must be visible in the governance model.

It should not silently recreate global admin power.

## Event requirements

The protocol must emit an event when finalization happens.

Possible shape:

```solidity
event BootstrapFinalized(
    uint256 indexed orgId,
    address indexed finalizedBy,
    uint64 finalizedAt
);
```

The final event shape should match the actual contract architecture and indexing conventions.

The event must be sufficient for Control Plane to expose finalization status after deterministic replay. If timestamp is not emitted directly, Control Plane may derive time from indexed block data.

## Read-model requirements

Control Plane should expose:

- organization lifecycle state;
- whether bootstrap is finalized;
- finalization timestamp/block if available;
- finalizing actor if available;
- whether admin-only setup actions are still allowed;
- any unsupported/unknown lifecycle states.

Control Plane must not infer finalization from UI flow completion. It should use contract state, finalization events, or both, depending on the final contract design.

## App Core UX requirements

App Core should show:

- calm warning when an organization is active but not finalized;
- clear finalization step after activation;
- explanation of what finalization changes;
- disabled admin actions after finalization with reason text;
- finalized status on Governance Structure and organization overview surfaces.

Avoid:

- huge red warnings for non-blocking states;
- fake health scores;
- implying production audit readiness.

## Implementation implications by repository

### EVM contracts

Current alpha implementation baseline where compatible:

- add lifecycle enum/state or equivalent lifecycle representation;
- add explicit finalization transition;
- emit a finalization event;
- add custom errors for invalid lifecycle/finalization operations;
- add modifiers or checks that restrict bootstrap-only functions after finalization;
- test that bodies, roles, mandates, and policy rules cannot be changed through bootstrap admin functions after finalization;
- avoid any hidden owner/admin escape hatch for governance-critical configuration.

### Types

Current alpha alignment baseline where compatible:

- add shared lifecycle enum/type;
- add finalization status DTO;
- add finalization event/read-model types if needed;
- keep lifecycle naming stable for Control Plane, SDK, and App Core.

### SDK

Current alpha alignment baseline where compatible:

- expose finalization support detection or planning helpers if needed;
- expose typed contract helpers only after ABI support exists;
- avoid taking over wallet execution behavior beyond typed helper construction.

### Control Plane

Current alpha alignment baseline where compatible:

- index the finalization event;
- expose lifecycle and finalization status in organization diagnostics/read models;
- preserve deterministic recovery and replay;
- expose unsupported/unknown states for older contracts instead of faking finalization.

### App Core

Current alpha alignment baseline where compatible:

- add finalization step to the activation wizard or post-activation review flow;
- warn calmly when an organization is active but not finalized;
- show a finalized state badge in Governance Structure and organization overview;
- disable post-finalization bootstrap admin actions with clear reason text;
- keep technical detail in diagnostics, not the normal product flow.

### Demo Stack

Current alpha alignment baseline where compatible:

- align env/docs with the compatible release set;
- verify the finalization flow in the local demo;
- do not imply production governance enforcement or audit readiness.

## Non-goals

This design does not include:

- production audit readiness;
- Safe integration;
- token-weighted voting;
- delegation;
- multi-chain execution;
- full emergency governance;
- production recovery council;
- arbitrary admin escape hatch;
- AI arbitration;
- Proposal Action Builder production implementation.

## Open questions for later design

- Which exact admin functions are blocked after finalization?
- Do policy changes after finalization require proposal execution in v0.7, or is this only prepared for future versions?
- What governance-controlled mechanism should handle post-finalization structure changes first?
- What scoped authority, if any, should exist after finalization?
- What explicit emergency/recovery model is appropriate for production?
- Should a future `BodyAdmin` authority be implemented in v0.7 or only designed?
