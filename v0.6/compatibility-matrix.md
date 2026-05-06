# IsoniaOS v0.6 Alpha Compatibility Matrix

## Purpose

This matrix records the current known-good alpha demo stack for v0.6 local demo readiness.

It is not production certification, an audit statement, or a security guarantee. It only describes the versions and tags that should be used together for the local alpha demo.

## Current Known-Good Stack

| Repository | Package name | Version / tag | Role | Notes |
| --- | --- | --- | --- | --- |
| docs | n/a | Active v0.6 docs; docs tag to be assigned after alpha.5 docs are accepted | Documentation and demo runbooks | This task prepares the alpha.5 docs surface. Do not treat docs alpha.5 as tagged until a tag is actually created. |
| types | `@isonia/types` | Pending `0.6.0-alpha.2`; tag pending | Shared DTOs, enums, constants, and setup/diagnostics types | Prepared for Node 22 baseline and metadata hardening. Do not record `v0.6.0-alpha.2` as released until the tag exists. |
| sdk | `@isonia/sdk` | Pending `0.6.0-alpha.2`; tag pending | Typed REST client and path helpers | Current dependency ref remains `github:isoniaos/types#v0.6.0-alpha.1` until the new types tag exists. |
| evm-contracts | `@isonia/evm-contracts` | Pending metadata alignment to `0.6.0-alpha.3`; tag pending | Shared local EVM governance protocol and DemoTarget | The package metadata is being aligned for the v0.6 local demo stack. Do not record `@isonia/evm-contracts` `0.6.0-alpha.3` / `v0.6.0-alpha.3` as the known-good matrix entry until the tag actually exists. |
| control-plane | `@isonia/control-plane` | Pending `0.6.0-alpha.2`; tag pending | REST API, indexer, projections, diagnostics, read models | Current dependency ref remains `github:isoniaos/types#v0.6.0-alpha.1` until the new types tag exists. |
| theme-default | `@isonia/theme-default` | Pending `0.6.0-alpha.2`; tag pending | Default theme tokens, assets, and CSS variables | Prepared for Node 22 baseline, line-ending policy, and address component theme metadata. Do not record `v0.6.0-alpha.2` as released until the tag exists. |
| app-core | `@isonia/app-core` | Pending `0.6.0-alpha.5`; tag pending | Public self-hostable React + Vite governance console | Depends on `@isonia/types`, `@isonia/sdk`, and `@isonia/theme-default` through existing v0.6 alpha GitHub refs until the new tags exist. |

## Notes

- Node baseline: `>=22`. Use the latest Node 22 LTS patch for v0.6 local demo work.
- Node 24 may be tested later, but v0.6 is baselined on Node 22.
- After the pending package tags are created later, update this matrix from pending entries to released `version` / `tag` entries and then update dependency refs where applicable.
- Package versions do not include a leading `v`.
- Git tags include a leading `v`.
- GitHub dependency refs should use tag names with a leading `v`.
- Use clean clones and checked-out tags for demo reproducibility.
- Runtime contract addresses still come from the local deployment and must be copied into Control Plane and App Core config after every redeploy.
- Control Plane read models can lag behind chain state. Smart contracts remain authoritative for onchain governance state.
