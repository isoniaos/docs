# IsoniaOS v0.7 Protocol Roadmap

## Purpose

The purpose of v0.7 protocol work is to move IsoniaOS beyond bootstrap/demo authority toward a clearer governance lifecycle and safer execution foundation.

v0.6 proved that an organization can be created, activated, visualized, and operated through a demo-ready UX. v0.7 defines how that organization becomes less dependent on unilateral bootstrap admin power and implements the first alpha version of that handoff where compatible.

Current alpha status:

- typed contract batch activation is implemented as the v0.7 activation baseline;
- bootstrap finalization is implemented across the current alpha stack where deployed contracts support it;
- downstream alignment exists across shared types, SDK, Control Plane, App Core, and demo stack where compatible;
- older contracts may still expose finalization as `unsupported` or `unknown`.

## Current protocol concern

In v0.6, the organization admin is the bootstrap authority.

The admin can perform setup actions such as:

- create bodies;
- create roles;
- assign mandates;
- set policy rules.

This remains acceptable before activation/finalization because the governance structure is still being created. It should not become the permanent governance model because the bootstrap admin would be able to unilaterally rewrite roles, mandates, bodies, and policy routes outside governance.

## Target v0.7 protocol themes

### 1. Typed admin batch activation

The protocol supports a reliable contract-level batch activation path in the current v0.7 alpha stack.

This is preferred over EIP-5792 as the default activation optimization because EIP-5792 support depends on wallet, account type, chain, and local network behavior.

The typed batch path should:

- preserve `msg.sender` as the organization admin;
- avoid arbitrary calldata multicall as the first production path;
- emit deterministic events;
- remain easy for Control Plane to index;
- have clear revert semantics;
- be covered by tests.

### 2. Bootstrap finalization / admin handoff

The protocol should define a point where bootstrap authority ends.

After finalization, the bootstrap admin should no longer have unilateral authority over core governance configuration unless that authority is explicitly scoped and represented in the governance model.

Core areas to protect after finalization:

- bodies;
- roles;
- mandates;
- policy rules;
- proposal route rules.

Implemented v0.7 alpha direction where compatible:

- explicit irreversible finalization by bootstrap admin after activation review;
- indexable finalization event;
- bootstrap admin functions blocked after finalization;
- future changes handled through governance-controlled routes or explicitly scoped authority;
- emergency/recovery left as an explicit open design area.

### 3. Organization lifecycle

Proposed lifecycle:

```text
Created -> Activating -> Active -> Finalized
```

The exact state names may change during implementation, but the protocol should expose enough state for App Core and Control Plane to represent lifecycle clearly.

Conceptual meanings:

- `Created`: organization root exists, but governance structure is absent or incomplete;
- `Activating`: bootstrap configuration is in progress through serial or typed batch setup;
- `Active`: governance structure is usable, but bootstrap authority may still exist;
- `Finalized`: bootstrap-only admin authority has ended and governance-critical changes must follow governed or explicitly scoped paths.

### 4. Governed changes after finalization

After finalization, changes should happen through one of the following:

- governance-controlled proposal routes;
- explicitly scoped role authority such as `BodyAdmin`;
- future modules that are visible in the governance graph and read models.

### 5. Compatibility and migration

v0.7 should not break v0.6 demo value unnecessarily.

Compatibility expectations:

- existing v0.6 demo flows should remain understandable;
- serial activation remains valid as fallback;
- new batch activation is an optimization and hardening path;
- new finalization state must be visible and indexable;
- read models should expose unsupported/unknown states without fake data.

## EIP-5792 decision

EIP-5792 is not the primary activation path.

Reliable path now:

```text
serial activation
```

Future reliable optimization:

```text
contract-level typed admin batch activation
```

Current v0.7 alpha status:

```text
typed contract batch activation implemented across the stack
```

Optional UX optimization:

```text
EIP-5792 when wallet, chain, and account support it
```

EIP-5792 should remain behind a feature flag or diagnostics surface.

## Deliverables

v0.7 protocol work should produce:

- completed typed batch activation baseline;
- bootstrap finalization/admin handoff model;
- lifecycle event/state support;
- finalization implementation in `evm-contracts`;
- tests;
- ABI update notes;
- downstream update notes for `types`, `sdk`, `control-plane`, `app-core`, and `demo-stack`.

## Sequencing

The current sequence is:

```text
typed batch activation baseline completed
  -> bootstrap finalization implemented across the current alpha stack
  -> downstream alignment exists across types/sdk/control-plane/app-core
  -> remaining work: docs alignment, clean demo-stack verification, Proposal Action Builder design, metadata/storage schema baseline, and design partner preview
```

Do not claim finalization support for older pre-finalization contract deployments. Do not claim production governance enforcement or production audit readiness for the current alpha stack.
