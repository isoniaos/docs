# Repository Map

IsoniaOS public repositories are independent repositories with clear boundaries.

## `evm-contracts`

EVM governance contracts, tests, deployment scripts, ABI output, and contract-level documentation.

Boundary: contract code defines modeled onchain governance authority. Demos, mocks, and validation harnesses should remain isolated from core contract paths.

## `types`

Shared TypeScript domain types, constants, enums, and data contracts used across IsoniaOS repositories.

Boundary: shared interfaces only. No UI behavior, provider-specific business logic, or repository-private assumptions.

## `control-plane`

Indexing, projections, diagnostics, read APIs, and external evidence normalization.

Boundary: read and operational layer. It is not governance authority unless a specific field or action is explicitly modeled that way.

## `sdk`

Typed clients and helpers for contracts, Control Plane APIs, and shared IsoniaOS data models.

Boundary: interface layer. It should not absorb app UI logic or private operator workflows.

## `app-core`

Self-hostable governance console for organization views, proposals, routes, execution status, accountability, evidence, and diagnostics.

Boundary: local and public app core. It should not become the source of governance authority.

## `theme-default`

Default theme package for visual tokens and presentation components.

Boundary: presentation only. It should not contain governance domain logic.

## `integration-lab`

Provider validation, public testnet workflows, evidence fixtures, field notes, and integration experiments.

Boundary: validation outside core. It must not define core contract behavior, Control Plane authority semantics, or App Core product logic.

## `docs`

Public IsoniaOS documentation and ReadTheDocs site configuration.

Boundary: public product, protocol, developer, operator, authority, and trust-boundary docs only.

## `web`

Public-facing web presence if maintained as a separate repository.

Boundary: website and project presentation. Source-of-truth product documentation lives in `docs`.

## Private boundaries

ISO token documentation and internal planning are separate from the public IsoniaOS docs repository.
