# Repository Map

This page links public documentation to repository-local sources. Use repository READMEs for exact commands.

| Repository | Role | Exact source |
| --- | --- | --- |
| `docs` | Public product, developer, operator, and reference documentation. | [README](https://github.com/isoniaos/docs/blob/main/README.md) |
| `evm-contracts` | Solidity contracts, local deployment, seed scripts, and protocol tests. | [README](https://github.com/isoniaos/evm-contracts/blob/main/README.md), [protocol boundaries](https://github.com/isoniaos/evm-contracts/blob/main/docs/protocol-boundaries.md) |
| `types` | Shared dependency-light TypeScript DTOs, enums, constants, events, setup, finalization, activation, diagnostics, source disclosure, and accountability shapes. | [README](https://github.com/isoniaos/types/blob/main/README.md) |
| `control-plane` | NestJS/PostgreSQL/viem indexing, projections, diagnostics, and REST read APIs. | [README](https://github.com/isoniaos/control-plane/blob/main/README.md) |
| `sdk` | Dependency-light typed Control Plane clients, path helpers, finalization helpers, activation helpers, and proposal helpers. | [README](https://github.com/isoniaos/sdk/blob/main/README.md) |
| `app-core` | React/Vite self-hostable governance console with runtime config, wallet flows, archive/accountability surfaces, diagnostics, and theme integration. | [README](https://github.com/isoniaos/app-core/blob/main/README.md), [local docs](https://github.com/isoniaos/app-core/tree/main/docs) |
| `theme-default` | Default replaceable theme package: CSS variables, typed tokens, brand metadata, and assets. | [README](https://github.com/isoniaos/theme-default/blob/main/README.md), [local docs](https://github.com/isoniaos/theme-default/tree/main/docs) |

## Boundary Summary

- Contracts model onchain authority.
- Control Plane indexes, projects, explains, and diagnoses.
- SDK wraps public API access and helpers.
- App Core presents state and initiates configured interactions.
- Theme Default supplies reusable presentation tokens and assets.
