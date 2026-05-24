# Contracts

The contracts repository contains the onchain governance primitives for IsoniaOS.

## Role

Contracts should model authority where onchain verification is required:

- organization state;
- governance bodies;
- roles and permissions;
- proposal primitives;
- approvals and vetoes;
- timelocks;
- execution;
- lifecycle events.

## Current normalization

The contracts area is being normalized in the current workspace cycle.

Expected direction:

- isolate demo-only contracts from core;
- isolate mocks from core;
- separate core deployment from demo deployment;
- preserve explicit authority and lifecycle state;
- avoid arbitrary demo placeholders in product paths;
- add tests for protocol correctness and authority-sensitive behavior;
- complete security review or audit gate before readiness claims.

## Trust boundary

Contracts are authoritative for the state they model. External records, target-contract logs, and manual notes are evidence or context unless explicitly modeled otherwise.
