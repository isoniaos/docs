# IsoniaOS — Repository Boundaries

## Public repositories

### `isonia-protocol`

Contains the trust layer:

- contracts
- tests
- deploy scripts
- ABI
- protocol docs

### `isonia-app-core`

Contains the public application core:

- governance console
- self-hosted-ready UI
- wallet flows
- API client
- domain views

### `isonia-theme-default`

Contains the default theme:

- tokens
- branding
- assets
- theme module

### `isonia-web`

Contains the marketing and docs website.

## Private repositories

### `isonia-control-plane`

Contains:

- ingestion workers
- projections
- REST API
- rate limiting
- operator logic

### `isonia-saas`

Contains:

- SaaS-only overlays
- billing later
- premium dashboards
- tenant admin

## Logical packages

### `isonia-sdk`

Shared TypeScript SDK and shared types.

### `docs/specs/adr`

Architectural decisions, specifications, and rules.

## Boundary rules

- SaaS must not duplicate app-core
- control-plane is not the source of truth
- the default theme must be replaceable without rewriting app-core
- protocol versioning is separate from frontend versioning
