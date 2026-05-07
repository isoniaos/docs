# IsoniaOS v0.6 Alpha Release Notes

## Purpose

These notes summarize the v0.6 alpha sequence for local demo readiness. They are factual alpha notes, not production release notes.

## v0.6.0-alpha.1

Primary app-core focus:

- Address foundation.
- Setup address integration.
- Early reusable UI and local alpha foundation.

Scope:

- Prepared App Core for clearer governance setup and address handling.
- Kept v0.6 positioned as local alpha work.

## v0.6.0-alpha.2

Primary app-core focus:

- Simple DAO+ setup wizard shell.

Scope:

- Introduced guided setup structure for organization creation.
- Kept setup draft browser-side and reviewable before transactions.

## v0.6.0-alpha.3

Primary app-core focus:

- Setup execution UX polish.

Scope:

- Improved action-by-action setup execution visibility.
- Made transaction, indexing, projection, and completion states easier to distinguish.

## v0.6.0-alpha.4

Primary app-core focus:

- Proposal lifecycle demo readiness.

Scope:

- Improved create proposal and proposal detail flows for the DemoTarget path.
- Kept execution narrow and demo-specific.
- Preserved the rule that UI buttons are hints and contracts remain authoritative.

## v0.6.0-alpha.5

Primary focus:

- Documentation and demo readiness target.
- Node 22 baseline documentation.
- app-core lint and CI hardening.
- Released package tag alignment.
- evm-contracts metadata alignment.

Scope:

- Quickstart Local guide.
- Design Partner Demo Script.
- Troubleshooting guide.
- Compatibility Matrix.
- Alpha release notes.
- Recorded Node.js `>=22` as the v0.6 baseline, with Node 24 left for later testing.
- Added app-core linting with CI lint, typecheck, address utility test, and build checks.
- Recorded the released v0.6 alpha tag set: `@isonia/types` `v0.6.0-alpha.2`, `@isonia/sdk` `v0.6.0-alpha.4`, `@isonia/theme-default` `v0.6.0-alpha.2`, `@isonia/control-plane` `v0.6.0-alpha.2`, `@isonia/evm-contracts` `v0.6.0-alpha.3`, and `@isonia/app-core` `v0.6.0-alpha.5`.
- Recorded docs `v0.6.0-alpha.5` as the documentation release tag, with later matrix-only changes to be carried in pending `v0.6.0-alpha.6` docs notes if needed.

Expected result:

- An external developer or demo operator can reproduce the local v0.6 alpha demo from clean clones using the documented known-good stack.

## Explicit Alpha Limits

v0.6 alpha does not claim:

- production readiness;
- smart contract audit readiness;
- SaaS readiness;
- billing or tenant management;
- Safe integration;
- delegation;
- token-weighted voting;
- AI governance;
- production multi-chain indexing;
- arbitrary calldata builder support.
