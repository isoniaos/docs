# Configuration

IsoniaOS configuration is split by layer. Configuration can describe where to read state or how to connect tools, but it should not silently create governance authority.

## Control Plane

Control Plane reads environment variables from `src/config/app-config.service.ts`. The exact source is the [`control-plane` README](https://github.com/isoniaos/control-plane/blob/main/README.md).

Key categories:

| Category | Variables |
| --- | --- |
| API | `API_PORT`, `PORT`, `CORS_ORIGINS`, `CORS_CREDENTIALS` |
| Chain | `CHAIN_ID`, `RPC_URL`, `RPC_HTTP_URL`, `START_BLOCK`, `CONFIRMATIONS`, `CONFIRMATION_DEPTH`, `BLOCK_RANGE_SIZE`, `MAX_BLOCK_RANGE`, `POLL_INTERVAL_MS` |
| Contracts | `GOV_CORE_ADDRESS`, `GOV_PROPOSALS_ADDRESS` |
| Capabilities | `ISONIA_PROTOCOL_PROFILE`, `ISONIA_DEPLOYMENT_CAPABILITIES_JSON` |
| Database | `DATABASE_URL` or `PG_HOST`, `PG_PORT`, `PG_DATABASE`, `PG_USER`, `PG_PASSWORD` |

Contract addresses must be non-zero EVM addresses. Capability metadata should come from configured deployment or profile evidence, not package versions.

## App Core

App Core runtime configuration is loaded by [`src/config/runtime-config.tsx`](https://github.com/isoniaos/app-core/blob/main/src/config/runtime-config.tsx):

1. `/isonia.config.local.json`
2. `/isonia.config.json`
3. built-in local defaults

Current runtime config covers:

- application mode and API base URL;
- chain metadata and RPC URL;
- contract addresses;
- feature flags;
- theme source;
- metadata gateway settings;
- wallet connection settings.

`features.billing` and `features.saasAdmin` are parsed as disabled in the current App Core loader and must not be treated as active public functionality.

## Wallet Mode

App Core supports `auto`, `appkit`, and `injected-only` wallet modes. Local self-hosted chain `31337` defaults to injected-only behavior. When Reown AppKit is requested but `wallet.reownProjectId` is missing, or AppKit initialization fails, App Core falls back to injected wallet mode and records diagnostics.

## Build-Time Workspace Sources

App Core has one current Vite build-time switch:

```bash
ISONIA_WORKSPACE_SOURCES=true
```

When enabled, Vite resolves `@isonia/sdk` and `@isonia/types` from adjacent workspace source directories for coordinated local development. It is not a runtime configuration API.

## Theme

Theme Default has no runtime environment variables. App Core consumes the package through CSS variables, typed tokens, brand metadata, and assets. See the [`theme-default` README](https://github.com/isoniaos/theme-default/blob/main/README.md).
