# Repository Map

IsoniaOS is developed across focused repositories.

## Public product repositories

### `docs`

Public product, developer, and operator documentation.

### `evm-contracts`

EVM protocol contracts, tests, deploy scripts, ABI, and contract docs.

Contracts are authoritative for modeled onchain governance state.

### `types`

Shared domain types, DTOs, enums, and constants used across Control Plane, SDK, and App Core.

### `control-plane`

Indexing, projection, diagnostics, read APIs, and operational backend surfaces.

Control Plane is not governance authority by itself.

### `sdk`

Typed clients and helpers over shared types and Control Plane APIs.

### `app-core`

Self-hostable governance console, public archive, proposal views, accountability surfaces, diagnostics, and integration evidence views.

### `theme-default`

Default replaceable theme package.

### `integration-lab`

Provider validation, Sepolia workflows, fixtures, field notes, and presentation QA outside core product authority.

## Private or separate areas

ISO token documentation, SaaS/business planning, and internal workspace planning are not active public product docs.

## Boundary rules

- Contracts own modeled onchain authority.
- Control Plane projects and explains state.
- App Core presents and interacts with state.
- SDK should not invent authority.
- Integration-lab must not define audited core behavior.
- Public docs should not contain private planning or active version archives.
