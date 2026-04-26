# IsoniaOS — Engineering Work Rules

## 1. General rules

- specification first, code second
- no hidden business logic in the UI
- no critical off-chain authorization
- document any architectural deviation as an ADR

## 2. Solidity

- use custom errors
- emit events for every critical transition
- no proxy upgradeability in v0.1
- for v0.1, execution is allowed only through a safe demo target or whitelist

## 3. TypeScript / Control Plane

- strict mode
- idempotency is mandatory
- projections must be replay-safe
- a raw event store is mandatory
- finality distinction is mandatory

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
