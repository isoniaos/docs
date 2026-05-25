# Configuration Summary

This page is a concise cross-repository index. Use the repository READMEs for exact values and examples.

## Control Plane

| Area | Summary |
| --- | --- |
| API | `API_PORT` or `PORT`, plus CORS settings. |
| Chain | `CHAIN_ID`, RPC URL, start block, confirmations, block range, and poll interval. |
| Contracts | Optional non-zero `GOV_CORE_ADDRESS` and `GOV_PROPOSALS_ADDRESS`. |
| Capabilities | `ISONIA_PROTOCOL_PROFILE` and optional JSON capability override. |
| Database | `DATABASE_URL` or individual PostgreSQL settings. |

Source: [`control-plane` README](https://github.com/isoniaos/control-plane/blob/main/README.md)

## App Core

| Area | Summary |
| --- | --- |
| Runtime config files | `/isonia.config.local.json`, then `/isonia.config.json`, then defaults. |
| API and chain | `apiBaseUrl`, `chainId`, `chainName`, `rpcUrl`, explorer URL, native currency. |
| Contracts | `govCoreAddress`, `govProposalsAddress`, optional local/lab demo target. |
| Features | Proposal creation, write actions, org management, batching, analytics, theme. |
| Wallet | `connectionMode`, Reown project ID, app URL, icons. |
| Build-time workspace mode | `ISONIA_WORKSPACE_SOURCES=true` for adjacent `sdk` and `types` source aliases. |

Source: [`app-core` README](https://github.com/isoniaos/app-core/blob/main/README.md)

## Contracts

Use deployment output or explicit configured addresses. Local explicit-address seeding requires `GOV_CORE_ADDRESS`, `GOV_PROPOSALS_ADDRESS`, and `DEMO_TARGET_ADDRESS` together.

Source: [`evm-contracts` README](https://github.com/isoniaos/evm-contracts/blob/main/README.md)

## SDK, Types, Theme

`sdk`, `types`, and `theme-default` have no runtime environment variables in the current baseline. They are package build and consumption surfaces.
