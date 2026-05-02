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

## Product principle

v0.6 should move IsoniaOS from “it works” to “it can be shown to a person and they can understand the value.”
