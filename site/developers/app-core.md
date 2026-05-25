# App Core

The [`app-core`](https://github.com/isoniaos/app-core/blob/main/README.md) repository owns the public self-hostable governance console.

## Role

App Core is a React/Vite application for reading, explaining, and interacting with IsoniaOS governance state through Control Plane APIs and configured EVM contracts. It presents:

- organization and governance structure views;
- setup and activation flows;
- proposals, route explanation, and execution state;
- public archive and accountability surfaces;
- diagnostics;
- wallet transaction flows;
- source disclosure and trust-boundary notices.

App Core is not governance authority. It should make authority and data freshness visible near affected data.

## Runtime Configuration

App Core loads runtime config from:

1. `/isonia.config.local.json`
2. `/isonia.config.json`
3. built-in local defaults

The config includes app mode, API base URL, chain metadata, RPC URL, contract addresses, feature flags, theme, metadata, and wallet settings. See the [`app-core` README](https://github.com/isoniaos/app-core/blob/main/README.md) for the complete current field list.

## Wallet Behavior

Wallet connection mode can be `auto`, `appkit`, or `injected-only`. Local self-hosted chain `31337` defaults to injected-only. Missing Reown project ID or failed AppKit setup falls back to injected wallet mode with diagnostics.

## Workspace Source Mode

`ISONIA_WORKSPACE_SOURCES=true` is a Vite build-time switch for resolving adjacent `../sdk` and `../types` source trees during coordinated local development. It is not runtime config.

## Boundary

App Core should not hide stale or unknown state, invent authority, or treat disabled billing/admin flags as active product functionality. Demo target behavior remains local/lab scoped.
