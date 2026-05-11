# IsoniaOS v0.6 Roadmap

## Milestone name

IsoniaOS v0.6 — Usable Governance Console Alpha

## Goal

Make the v0.5 Developer Preview usable as a coherent local governance console demo.

A developer or design partner should be able to run IsoniaOS locally, create an organization, inspect its governance structure, create a proposal, route it through approval, veto, timelock, and execution, and understand what is happening without reading source code.

## Primary outcomes

1. A cleaner, reusable UI foundation in app-core.
2. Address and multi-address input components suitable for governance authority setup.
3. A Simple DAO+ setup wizard instead of a long raw form.
4. Transparent setup execution progress.
5. A proposal lifecycle demo that can be completed locally.
6. A stronger diagnostics panel for chain, indexer, projections, app config, and wallet state.
7. Documentation that allows an external developer to reproduce the local demo.

## Recommended alpha sequence

### v0.6.0-alpha.1

Focus: repository preparation and UI foundation.

Expected results:
- v0.6 docs exist and are the active development context.
- v0.5 compatibility matrix is archived.
- CHANGELOG files have a v0.6 Unreleased section.
- app-core has reusable base UI components.
- address display/input/multi-address components exist.

### v0.6.0-alpha.2

Focus: Simple DAO+ setup wizard.

Expected results:
- organization setup is split into steps;
- setup draft model remains browser-side and reviewable;
- multi-address inputs replace raw holder textareas;
- review screen is easier to understand.

### v0.6.0-alpha.3

Focus: setup execution UX.

Expected results:
- setup actions show pending, signing, submitted, mined, indexed, projected, completed, and failed states;
- users can see tx hashes and indexing status;
- retry guidance exists for failed or timed-out actions.

### v0.6.0-alpha.4

Focus: proposal lifecycle demo.

Expected results:
- create proposal flow is polished;
- approve, veto, queue, execute, and cancel actions are understandable;
- local Hardhat time helpers exist where appropriate;
- proposal route explanation is visible and human-readable.

### v0.6.0-alpha.5

Focus: docs and demo readiness.

Expected results:
- quickstart-local guide works from clean clone;
- troubleshooting covers common local failures;
- design partner demo script exists;
- release notes and compatibility matrix are updated.

## Non-goals

v0.6 must not attempt to deliver:
- SaaS billing;
- tenant management;
- production deployment;
- smart contract audit readiness;
- Safe integration;
- delegation;
- token-weighted voting;
- multi-chain production indexing;
- AI governance assistant;
- custom theme loading from Git;
- final brand/marketing design.

## Future protocol backlog

### Bootstrap finalization and admin handoff

The v0.6 alpha protocol uses the organization admin as bootstrap authority. A future protocol milestone should add explicit bootstrap finalization so the admin can complete setup and then lose unilateral power over roles, mandates, and policy rules.

After finalization, mandate and policy changes should be governed by proposal routes or by narrowly scoped role authority such as `BodyAdmin` where the contract model grants it. Contracts remain authoritative for governance power.

### Admin batch activation

A related future EVM contract design item should add typed admin batch functions for bootstrap setup groups. Batches should preserve `msg.sender` as the organization admin and should avoid arbitrary calldata multicall as the first production path.

Preferred shapes include batch create bodies, batch create roles, batch assign mandates, batch set policy rules, or a typed bootstrap activation bundle. These functions must emit the same events expected by the Control Plane indexer so read models remain deterministically recoverable from contract events.

Design these two upgrades together: batch activation reduces setup friction, while bootstrap finalization removes permanent admin control after setup. App Core should use a contract batch path first when available, keep serial activation as the reliable v0.6 default, and treat EIP-5792 as an optional wallet-level optimization only. EIP-5792 support is wallet, account, and chain dependent, so it is not reliable enough to be the primary bootstrap path in v0.6.

## Product principle

v0.6 should move IsoniaOS from “it works” to “it can be shown to a person and they can understand the value.”
