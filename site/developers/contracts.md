# Contracts

The contracts repository models onchain governance state where the protocol needs verifiable authority.

## Responsibilities

- organization and governance state where contract-backed;
- role and permission events where contract-backed;
- proposal lifecycle primitives where contract-backed;
- approval, veto, timelock, and execution semantics where implemented;
- events for indexed read models;
- deployment artifacts and ABI output.

## Authority

Contracts are authoritative only for the fields and actions they model.

The docs should clearly distinguish contract state from projected state, external evidence, and manual annotations.

## Development posture

Contract changes should keep demos, mocks, fixtures, and provider experiments isolated from core protocol paths. Security-sensitive changes need focused tests and review.
