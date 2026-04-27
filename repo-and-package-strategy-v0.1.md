# IsoniaOS v0.1 — Repository and Package Strategy

## Decision

Create two additional public packages/repositories:

- `@isonia/types` — pure TypeScript shared domain types, enums, REST DTOs, event DTOs and graph DTOs.
- `@isonia/sdk` — public SDK for REST API client and viem-based protocol helpers.

They can start as local workspace packages inside the root workspace and later become separate public repositories/npm packages. The important part is that `control-plane`, `app-core`, and `saas` do not duplicate DTOs or domain enums.

Before the public beta npm/package-registry release, consumers should depend on pinned GitHub tags for shared packages, not on floating branches. Example:

```json
{
  "dependencies": {
    "@isonia/types": "github:isoniaos/types#v0.1.0"
  }
}
```

Local `link:` or workspace dependencies are acceptable for temporary local development, but they must not be the production/deployment dependency shape.

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

## Shared types maintenance

`@isonia/types` is the canonical source for shared domain enums, DTOs, event argument DTOs, graph DTOs, chain enum maps, and domain constants.

Every change to `@isonia/types` must update:

- `@isonia/types/README.md` when usage, install, exports, scope, or release guidance changes;
- `@isonia/types/CHANGELOG.md` for every user-visible type, enum, DTO, event, constant, or export change;
- matching docs in this repository when REST DTOs, events, graph DTOs, route explanation semantics, or indexing-facing shapes change.

Tagged releases must be reproducible. Do not consume an untagged branch for deployable services.

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

## App wallet stack

App Core uses Reown AppKit for optional multi-wallet connection UX. wagmi and viem remain the core EVM interaction layer for configured chains, transports, connectors, and protocol calls.

Self-hosted App Core deployments must remain usable when `wallet.reownProjectId` is empty. In that case, app-core uses wagmi's injected connector fallback instead of Reown AppKit.
