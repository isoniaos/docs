# IsoniaOS v0.6 Alpha Compatibility Matrix

## Purpose

This matrix records the current known-good alpha demo stack for v0.6 local demo readiness.

It is not production certification, an audit statement, or a security guarantee. It only describes the versions and tags that should be used together for the local alpha demo.

## Current Known-Good Stack

| Repository | Package name | Version / tag | Role | Notes |
| --- | --- | --- | --- | --- |
| docs | n/a | Active v0.6 docs; docs tag to be assigned after alpha.5 docs are accepted | Documentation and demo runbooks | This task prepares the alpha.5 docs surface. Do not treat docs alpha.5 as tagged until a tag is actually created. |
| types | `@isonia/types` | `0.6.0-alpha.1` / `v0.6.0-alpha.1` | Shared DTOs, enums, constants, and setup/diagnostics types | Package version and local tag were verified. |
| sdk | `@isonia/sdk` | `0.6.0-alpha.1` / `v0.6.0-alpha.1` | Typed REST client and path helpers | Depends on `@isonia/types` via `github:isoniaos/types#v0.6.0-alpha.1`. The tag exists; the inspected local worktree was not exactly at the tag. |
| evm-contracts | `@isonia/evm-contracts` | `0.5.0-alpha.3` protocol package baseline; observed local `v0.6.0-alpha.1` tag points at this package version | Shared local EVM governance protocol and DemoTarget | Record this honestly as the v0.5 protocol baseline reused by the v0.6 local demo stack until a package bump is committed and tagged. |
| control-plane | `@isonia/control-plane` | `0.6.0-alpha.1` / `v0.6.0-alpha.1` | REST API, indexer, projections, diagnostics, read models | Depends on `@isonia/types` via `github:isoniaos/types#v0.6.0-alpha.1`. The tag exists; the inspected local worktree was not exactly at the tag. |
| theme-default | `@isonia/theme-default` | `0.6.0-alpha.1` / `v0.6.0-alpha.1` | Default theme tokens, assets, and CSS variables | Package version and local tag were verified. |
| app-core | `@isonia/app-core` | `0.6.0-alpha.4` / `v0.6.0-alpha.4` | Public self-hostable React + Vite governance console | Depends on `@isonia/types`, `@isonia/sdk`, and `@isonia/theme-default` through v0.6 alpha GitHub refs. Package version and local tag were verified. |

## Notes

- Package versions do not include a leading `v`.
- Git tags include a leading `v`.
- GitHub dependency refs should use tag names with a leading `v`.
- Use clean clones and checked-out tags for demo reproducibility.
- Runtime contract addresses still come from the local deployment and must be copied into Control Plane and App Core config after every redeploy.
- Control Plane read models can lag behind chain state. Smart contracts remain authoritative for onchain governance state.
