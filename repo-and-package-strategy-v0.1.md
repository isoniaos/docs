# IsoniaOS v0.1 — Repository and Package Strategy

## Decision

Create two additional public packages/repositories:

- `@isonia/types` — pure TypeScript shared domain types, enums, REST DTOs, event DTOs and graph DTOs.
- `@isonia/sdk` — public SDK for REST API client and viem-based protocol helpers.

They can start as local workspace packages inside the root workspace and later become separate public repositories/npm packages. The important part is that `control-plane`, `app-core`, and `saas` do not duplicate DTOs or domain enums.

## Repository map

- `isonia-protocol` / `evm-contracts` — public EVM contracts, tests, deployments, ABI exports.
- `isonia-control-plane` / `control-plane` — private initially; indexer, projections, REST API, rate limits, SaaS query layer.
- `isonia-app-core` / `app-core` — public self-hosted governance console and shared app shell.
- `isonia-theme-default` / `theme-default` — public default theme package.
- `isonia-saas` / `saas` — private SaaS overlay: billing, tenant admin, premium analytics.
- `isonia-web` / `web` — public marketing/informational website for `isonia.org`.
- `packages/types` — public/shared package, published later as `@isonia/types`.
- `packages/sdk` — public/shared package, published later as `@isonia/sdk`.

## Dependency direction

```txt
@isonia/types
   ↑
@isonia/sdk
   ↑
app-core
   ↑
saas
```

`control-plane` may depend on `@isonia/types` and should avoid depending on UI/app code.

`@isonia/types` must not depend on React, NestJS, wagmi, viem, DB libraries, or app code.

`@isonia/sdk` may depend on `@isonia/types` and `viem`, but not on React or NestJS.

## Security rules

- Minimize npm dependencies.
- Keep critical logic first-party: event processing, route explanation, mandate/role interpretation, idempotency, replay, tenant isolation.
- Use lockfiles and exact versions where practical.
- Add dependency review/audit in CI.
- Avoid large UI/governance frameworks unless clearly justified.

## App framework decision

- `isonia-web`: Next.js with SSR/SSG.
- `isonia-app-core`: React + Vite SPA.
- `isonia-saas`: extends `app-core`; follows app-core framework unless a strong reason appears later.

Reason: app-core is an interactive governance console, not an SEO surface. Static SPA is simpler for self-hosted deployments, wallet state, runtime config, and theme replacement.
