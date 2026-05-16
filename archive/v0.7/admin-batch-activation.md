# Typed Admin Batch Activation

## Purpose

Typed admin batch activation provides a reliable protocol-level way to complete organization setup with fewer transactions while preserving deterministic behavior and indexability.

This is the preferred v0.7 activation optimization.

## Background

v0.6 uses serial activation as the reliable default.

EIP-5792 was tested as a gated prototype but was not adopted as the primary path because local/demo reliability depends on wallet, account, and chain support.

v0.7 should avoid blocking activation UX on wallet-level batching.

## Decision

The reliable path remains:

```text
serial activation
```

The v0.7 optimization path should be:

```text
contract-level typed admin batch activation
```

EIP-5792 remains optional and gated:

```text
wallet-level batching when supported
```

## Why typed batches instead of arbitrary multicall

Avoid arbitrary calldata multicall as the first production path.

Typed batch functions are preferred because they:

- are easier to audit;
- preserve domain semantics;
- avoid turning the contract into a generic execution router;
- are easier to index;
- allow clear validation;
- produce deterministic events;
- reduce accidental unsafe call surfaces.

## Candidate function families

Possible functions:

```solidity
batchCreateBodies(...)
batchCreateRoles(...)
batchAssignMandates(...)
batchSetPolicyRules(...)
```

Alternative:

```solidity
activateBootstrapBundle(...)
```

A bundle may be useful if setup has strong ordering constraints, but it should not hide domain events or create opaque setup state.

## Sender model

Batch activation must preserve the same authority model as serial activation.

Requirements:

- `msg.sender` should remain the organization admin or authorized bootstrap actor;
- no delegated arbitrary executor should gain setup authority;
- authorization should be checked once at the right boundary and/or per operation where needed;
- failures must not partially create invalid governance structure.

## Events

Batch activation should emit the same domain events expected by Control Plane where practical.

Preferred direction:

- emit existing per-item events for read-model recovery;
- optionally emit a batch summary event for diagnostics and UX.

Example summary event:

```solidity
event BootstrapBatchApplied(
    uint256 indexed orgId,
    address indexed appliedBy,
    uint256 bodiesCreated,
    uint256 rolesCreated,
    uint256 mandatesAssigned,
    uint256 policyRulesSet
);
```

Do not rely only on summary events if read models need item-level reconstruction.

## Partial failure behavior

Recommended v0.7 behavior:

- fail atomically per batch call;
- no partial success inside a single typed batch unless explicitly designed and documented;
- serial activation remains fallback for recovery and debugging.

Atomic failure is easier to reason about and safer for governance setup.

## Gas considerations

Batch activation should account for:

- maximum practical batch sizes;
- block gas limits;
- local demo chain behavior;
- testnet/mainnet cost differences;
- UI fallback to chunked or serial execution;
- predictable error messages for oversized batches.

Potential direction:

- allow smaller typed batch calls by domain;
- avoid a single giant `activateEverything` call if it can easily exceed gas limits;
- let App Core decide whether to use batch or serial based on contract support and setup size.

## Control Plane requirements

Control Plane must be able to reconstruct the same read model from batch activation as from serial activation.

Requirements:

- existing per-item domain events should remain indexable;
- batch summary event is optional but useful;
- indexing must not depend on implicit ABI assumptions;
- diagnostics should distinguish serial and batch setup if events support it.

## App Core requirements

App Core should:

- detect contract support for typed batch activation;
- prefer typed contract batch when available and appropriate;
- keep serial activation as fallback;
- show transaction modal for batch flow;
- show clear error and fallback hints;
- avoid presenting EIP-5792 as the reliable default.

## Tests

EVM contract tests should cover:

- successful batch body creation;
- successful batch role creation;
- successful batch mandate assignment;
- successful batch policy rule setup;
- authorization failures;
- invalid input failures;
- duplicate or conflicting input behavior;
- event emission;
- post-finalization blocked behavior;
- equivalence between serial and batch read-model effects where possible.

## Open questions

- Should batch functions be implemented separately by domain or as one typed bundle?
- What maximum input sizes should be recommended?
- Should App Core chunk large batches automatically?
- Should batch activation be allowed after `Active` but before `Finalized`?
- Should any batch functions be disabled after finalization?
