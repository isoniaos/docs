# IsoniaOS - Engineering Work Rules

## 1. General rules

- specification first, code second
- no hidden business logic in the UI
- no critical off-chain authorization
- document any architectural deviation as an ADR

## 2. Solidity

- use custom errors
- use modifiers for access control and simple entry-point preconditions when appropriate
- if a helper exists only to support a modifier, move the logic into the modifier instead of keeping a redundant helper
- emit events for every critical transition
- preserve the archived v0.7 decision to prioritize typed admin batch activation over arbitrary calldata multicall
- preserve the archived v0.7 finalization/admin handoff model unless explicitly superseded
- keep serial activation as the reliable fallback
- keep EIP-5792 gated/prototype/diagnostics only

## 3. TypeScript / Control Plane

- strict mode
- idempotency is mandatory
- projections must be replay-safe
- a raw event store is mandatory
- finality distinction is mandatory
- shared domain types must come from `@isonia/types`; update its README and CHANGELOG after every shared type change

## 4. Frontend

- keep domain logic separate from the theme layer
- theme replaceable
- support self-hosted and SaaS via config/extensions, not via two different cores

## 5. Dependencies

- minimize the npm surface area
- prefer first-party utilities
- avoid questionable transitive-heavy libraries

## 6. Git / PR rules

- small scoped changes
- commit messages must reflect the bounded context
- unrelated changes in one PR are forbidden
