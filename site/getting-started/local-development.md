# Local Development

Use repository READMEs for exact commands. This page gives the high-level entry path across the public repositories.

## Repository-First Flow

1. Start with [`evm-contracts`](https://github.com/isoniaos/evm-contracts/blob/main/README.md) to run a local Hardhat chain, deploy the local protocol module, and seed local organizations or lab actions.
2. Configure [`control-plane`](https://github.com/isoniaos/control-plane/blob/main/README.md) with chain, contract, database, indexer, and CORS settings.
3. Run Control Plane migrations and local workers so event indexing and projections are available.
4. Configure [`app-core`](https://github.com/isoniaos/app-core/blob/main/README.md) runtime config to point at the Control Plane API and deployed contracts.
5. Use [`sdk`](https://github.com/isoniaos/sdk/blob/main/README.md) and [`types`](https://github.com/isoniaos/types/blob/main/README.md) when building consumers or coordinating typed cross-repository changes.
6. Use [`integration-lab`](https://github.com/isoniaos/integration-lab/blob/main/README.md) for Sepolia evidence and provider-validation workflows only after the local path is understood.

## Typical Local Components

| Layer | Repository | Local role |
| --- | --- | --- |
| EVM chain and contracts | `evm-contracts` | Local Hardhat node, deployments, seed data, protocol tests. |
| Database and API | `control-plane` | PostgreSQL schema, raw event storage, projections, REST APIs, diagnostics. |
| Frontend | `app-core` | React/Vite console pointed at Control Plane and configured contracts. |
| Shared package work | `types`, `sdk`, `theme-default` | Shared DTOs, typed clients, and theme package development. |
| Validation | `integration-lab` | Lab-only manifests, scenarios, and provider evidence. |

## What Not To Use

The old `demo-stack` path is archived and is not current setup guidance. Do not use old archive folders, old version-named docs, or lab manifests as product configuration.
