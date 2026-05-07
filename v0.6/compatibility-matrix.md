# IsoniaOS v0.6 Alpha Compatibility Matrix

## Purpose

This matrix records the current known-good alpha demo stack for v0.6 local demo readiness.

It is not production certification, an audit statement, or a security guarantee. It only describes the versions and tags that should be used together for the local alpha demo.

## Current Known-Good Stack

| Repository | Package name | Version / tag | Role | Notes |
| --- | --- | --- | --- | --- |
| docs | n/a | `v0.6.0-alpha.5` | Documentation and demo runbooks | Documentation tag for the v0.6 alpha demo readiness surface. If this matrix update is released after alpha.5, carry it in pending `v0.6.0-alpha.6` docs notes instead. |
| types | `@isonia/types` | `0.6.0-alpha.2` / `v0.6.0-alpha.2` | Shared DTOs, enums, constants, and setup/diagnostics types | Released Node 22 baseline and metadata hardening tag. |
| sdk | `@isonia/sdk` | `0.6.0-alpha.4` / `v0.6.0-alpha.4` | Typed REST client and path helpers | Released against `@isonia/types` `v0.6.0-alpha.2`. |
| evm-contracts | `@isonia/evm-contracts` | `0.6.0-alpha.3` / `v0.6.0-alpha.3` | Shared local EVM governance protocol and DemoTarget | Released metadata alignment tag for the v0.6 local demo stack. |
| control-plane | `@isonia/control-plane` | `0.6.0-alpha.2` / `v0.6.0-alpha.2` | REST API, indexer, projections, diagnostics, read models | Released against `@isonia/types` `v0.6.0-alpha.2`. |
| theme-default | `@isonia/theme-default` | `0.6.0-alpha.2` / `v0.6.0-alpha.2` | Default theme tokens, assets, and CSS variables | Released Node 22 baseline, line-ending policy, and address component theme metadata tag. |
| app-core | `@isonia/app-core` | `0.6.0-alpha.5` / `v0.6.0-alpha.5` | Public self-hostable React + Vite governance console | Released against `@isonia/types` `v0.6.0-alpha.2`, `@isonia/sdk` `v0.6.0-alpha.4`, and `@isonia/theme-default` `v0.6.0-alpha.2`. |

## Notes

- Node baseline: `>=22`. Use the latest Node 22 LTS patch for v0.6 local demo work.
- Node 24 may be tested later, but v0.6 is baselined on Node 22.
- Package versions do not include a leading `v`.
- Git tags include a leading `v`.
- GitHub dependency refs should use tag names with a leading `v`.
- Use clean clones and checked-out tags for demo reproducibility.
- Runtime contract addresses still come from the local deployment and must be copied into Control Plane and App Core config after every redeploy.
- Control Plane read models can lag behind chain state. Smart contracts remain authoritative for onchain governance state.
