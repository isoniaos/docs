# Bootstrap Finalization and Admin Handoff

## Purpose

Bootstrap finalization defines the moment when an IsoniaOS organization moves from admin-driven setup into governed operation.

The v0.6 admin-driven bootstrap model is useful for demos and initial setup, but it should not be the permanent governance model.

## Problem

During bootstrap, the organization admin can create and configure the governance structure.

This includes:

- bodies;
- roles;
- mandates;
- policy routes;
- setup rules.

If this authority remains unlimited forever, the organization is not truly governed by its configured governance structure. It is still ultimately controlled by the bootstrap admin.

## Proposed lifecycle

```text
Created -> Activating -> Active -> Finalized
```

### Created

The organization root exists, but the governance structure is not ready.

### Activating

The organization is being configured.

Expected setup activity:

- bodies are created;
- roles are created;
- mandates are assigned;
- policy routes are configured.

### Active

The organization has enough governance configuration to operate, but bootstrap admin authority may still exist.

This state is useful for review, testing, and demo flows.

### Finalized

Bootstrap authority has been handed off.

After this point, unilateral admin changes to governance-critical configuration should be blocked or explicitly scoped.

## Finalization authority

Open design question:

Who can call finalization?

Possible options:

1. bootstrap admin only;
2. bootstrap admin plus governance approval;
3. configured root body;
4. proposal route execution;
5. hybrid approach.

Recommended v0.7 direction:

- allow bootstrap admin to finalize during the initial implementation;
- emit clear finalization event;
- make finalization visible in Control Plane and App Core;
- design the final state so future versions can require governance approval.

Reasoning:

- v0.7 should harden the model without overloading scope;
- governance-approved finalization may require more proposal execution machinery than v0.7 should implement immediately;
- the important first step is making handoff explicit and enforceable.

## Reversibility

Open design question:

Should finalization be reversible?

Recommended v0.7 direction:

- finalization should be irreversible by default.

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

## Events

The protocol should emit an event when finalization happens.

Possible shape:

```solidity
event BootstrapFinalized(
    uint256 indexed orgId,
    address indexed finalizedBy,
    uint64 finalizedAt
);
```

The final event shape should match the actual contract architecture and indexing conventions.

## Read-model requirements

Control Plane should expose:

- organization lifecycle state;
- whether bootstrap is finalized;
- finalization timestamp/block if available;
- finalizing actor if available;
- whether admin-only setup actions are still allowed;
- any unsupported/unknown lifecycle states.

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

## Open questions for implementation

- Is `Active` distinct from `Finalized`, or should finalization be required before showing the organization as active?
- Which exact admin functions are blocked after finalization?
- Do policy changes after finalization require proposal execution in v0.7, or is this only prepared for future versions?
- Is there any emergency pause/recovery model?
- Should a future `BodyAdmin` authority be implemented now or only designed?
