# IsoniaOS v0.7 Protocol Roadmap

## Purpose

The purpose of v0.7 protocol work is to move IsoniaOS beyond bootstrap/demo authority toward a clearer governance lifecycle and safer execution foundation.

v0.6 proved that an organization can be created, activated, visualized, and operated through a demo-ready UX. v0.7 should define how that organization becomes less dependent on unilateral bootstrap admin power.

## Current protocol concern

In v0.6, the organization admin is the bootstrap authority.

The admin can perform setup actions such as:

- create bodies;
- create roles;
- assign mandates;
- set policy rules.

This is acceptable for bootstrap and demo flows, but it should not become the permanent governance model.

## Target v0.7 protocol themes

### 1. Typed admin batch activation

The protocol should support a reliable contract-level batch activation path.

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

After finalization, admin should no longer have unilateral authority over core governance configuration unless that authority is explicitly scoped and represented in the governance model.

Core areas to protect after finalization:

- bodies;
- roles;
- mandates;
- policy rules;
- proposal route rules.

### 3. Organization lifecycle

Proposed lifecycle:

```text
Created -> Activating -> Active -> Finalized
```

The exact state names may change during implementation, but the protocol should expose enough state for App Core and Control Plane to represent lifecycle clearly.

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

Optional UX optimization:

```text
EIP-5792 when wallet, chain, and account support it
```

EIP-5792 should remain behind a feature flag or diagnostics surface.

## Deliverables

v0.7 protocol work should produce:

- typed batch activation design;
- bootstrap finalization design;
- lifecycle event/state design;
- implementation in `evm-contracts`;
- tests;
- ABI update notes;
- downstream update notes for `types`, `sdk`, `control-plane`, `app-core`, and `demo-stack`.
