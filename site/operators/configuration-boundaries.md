# Configuration Boundaries

Configuration should make the runtime explicit without granting hidden authority.

## Contracts And Chain

Control Plane and App Core must agree on:

- chain ID;
- RPC URL;
- `GovCore` address;
- `GovProposals` address;
- optional local/lab target addresses when using local proposal flows.

Contract addresses should come from the current deployment output or explicitly configured testnet manifests. Do not infer deployed capability from package versions.

## Database And Indexing

Control Plane uses PostgreSQL. `DATABASE_URL` overrides individual `PG_*` settings. Indexing settings define where scanning starts, how confirmations are handled, block range size, and poll interval.

Operators should rebuild projections after schema or projection changes when repository guidance requires it.

## Browser And Wallet

App Core runtime config determines API base URL, chain metadata, RPC URL, wallet mode, feature flags, metadata gateway, and theme source. Local chain `31337` defaults to injected-only wallet behavior unless config says otherwise and Reown AppKit is usable.

## External Evidence

Provider records, lab manifests, and manual accountability updates should show source disclosure. They should not be treated as contract authority by default.
