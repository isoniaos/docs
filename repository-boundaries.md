# IsoniaOS — Repository Boundaries

## Public repositories

### `isonia-protocol`
Содержит trust layer:
- contracts
- tests
- deploy scripts
- ABI
- protocol docs

### `isonia-app-core`
Содержит public application core:
- governance console
- self-hosted-ready UI
- wallet flows
- API client
- domain views

### `isonia-theme-default`
Содержит default theme:
- tokens
- branding
- assets
- theme module

### `isonia-web`
Содержит marketing/docs website.

## Private repositories

### `isonia-control-plane`
Содержит:
- ingestion workers
- projections
- REST API
- rate limiting
- operator logic

### `isonia-saas`
Содержит:
- SaaS-only overlays
- billing later
- premium dashboards
- tenant admin

## Logical packages

### `isonia-sdk`
Общий TS SDK и shared types.

### `docs/specs/adr`
Архитектурные решения, спецификации и правила.

## Boundary rules
- SaaS не должен дублировать app-core
- control-plane не является источником истины
- default theme заменяема без переписывания app-core
- protocol versioning отделено от frontend versioning

