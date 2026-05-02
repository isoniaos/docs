# IsoniaOS v0.1.0-alpha Release Notes

Status: Alpha closure  
Date: 2026-04-29  
Scope: Local/developer prototype across current IsoniaOS repositories

## Safety Notice

IsoniaOS v0.1.0-alpha is not audited and is not production ready.

Do not use this release with real assets, mainnet authority, production organizations, or high-stakes governance decisions. This alpha is for local development, protocol validation, demos, and architecture review.

## Summary

v0.1.0-alpha closes the first end-to-end IsoniaOS prototype:

```txt
EVM contracts
  -> shared domain types
  -> Control Plane indexing and REST read models
  -> SDK REST client
  -> App Core governance console
  -> Default theme package
  -> local demo documentation
```

The release proves the core product thesis at prototype scale:

```txt
Authority on-chain.
Intelligence off-chain.
Verification public.
```

## Included Repositories

### evm-contracts

The protocol repository contains the v0.1 Solidity prototype:

- `GovTypes`
- `GovCore`
- `GovProposals`
- `DemoTarget`
- `IGovCore`
- Hardhat tests
- Ignition local deployment module
- local seed script for demo organizations

Supported v0.1 protocol concepts:

- shared multi-organization deployment;
- `orgId` isolation;
- organizations;
- governance bodies;
- roles;
- mandates;
- policy rules;
- policy rule version snapshots;
- proposal creation;
- proposal approval;
- proposal veto;
- proposal queue;
- controlled demo execution;
- proposal cancellation;
- `ProposalStatusChanged` events;
- local Simple DAO+ and Bicameral preview seed topologies.

Execution is intentionally limited to the configured `DemoTarget` contract. This is not an arbitrary production execution engine.

### types

`@isonia/types` is the shared TypeScript domain package for the alpha. It contains:

- domain enums;
- chain enum maps;
- governance event argument DTOs;
- raw event DTOs;
- REST response DTOs;
- governance graph DTOs;
- route explanation DTOs;
- shared domain constants.

Notable alignment points:

- `RoleType` uses `EmergencyOperator`.
- `ProposalCreatedEventArgsDto` includes `policyVersion`.
- `GovernanceEventName` includes `ProposalStatusChanged`.
- `DOMAIN_CONSTANTS` distinguishes logical and physical raw event identity fields.
- route blocked reasons include `policy_snapshot_missing`.

### control-plane

The Control Plane repository contains a private NestJS/PostgreSQL/viem backend for the alpha:

- REST API under `/v1`;
- configured RPC log polling with `getLogs`;
- raw event persistence;
- duplicate-safe raw event identity using `chainId + txHash + logIndex`;
- `blockHash` storage for physical log identity;
- projection worker with row locking;
- replay/rebuild command path;
- read models for organizations, bodies, roles, mandates, policies, proposals, decisions, and graph edges;
- route explanation using proposal `policyVersion`;
- explicit `policy_snapshot_missing` route blocker.

Control Plane remains an indexing and query layer. It is not the source of governance authority.

### sdk

`@isonia/sdk` contains the v0.1 REST SDK surface:

- typed Control Plane REST client;
- endpoint path helpers;
- shared response typing through `@isonia/types`.

The alpha SDK does not yet include viem protocol helper clients or arbitrary transaction builders.

### app-core

`@isonia/app-core` contains the public self-hostable React + Vite governance console foundation:

- runtime config from `/isonia.config.json`;
- organizations list;
- organization overview;
- governance structure view;
- proposals list;
- proposal details;
- route explanation panel;
- proposal creation flow gated by runtime config;
- proposal action flows for approve, veto, queue, execute, and cancel;
- governance graph data view;
- metadata resolver with deterministic fallback labels;
- wagmi + viem wallet layer;
- optional Reown AppKit wallet UX;
- injected wallet fallback when `wallet.reownProjectId` is empty.

Write controls are UI hints and are gated by runtime config. Contract authority remains final.

Alpha execution UI is intentionally narrow. App Core only builds and verifies the configured `DemoTarget.setNumber(orgId, newNumber)` execution payload; it does not provide a general calldata builder.

### theme-default

`@isonia/theme-default` contains the default public theme package:

- CSS variables;
- typed design tokens;
- brand metadata;
- placeholder logo asset;
- no runtime dependencies.

### docs

The documentation repository contains the v0.1 specs, release checklist, local demo guide, and these closure documents.

Key existing documents:

- `protocol-spec-v0.1.md`
- `events-v0.1.md`
- `rest-dto-v0.1.md`
- `control-plane-spec-v0.1.md`
- `event-processing-v0.1.md`
- `app-core-spec-v0.1.md`
- `repo-and-package-strategy-v0.1.md`
- `local-e2e-demo-v0.1.md`
- `release-checklist-v0.1-alpha.md`

## Demo Scope

The alpha demo supports this local path:

```txt
Hardhat local chain
  -> deploy GovCore, GovProposals, DemoTarget
  -> seed demo organizations and proposals
  -> index events into Control Plane
  -> build projections
  -> browse governance state in App Core
  -> optionally submit local wallet transactions
  -> re-index and verify updated route/proposal state
```

See `demo-script-v0.1.0-alpha.md` and `local-e2e-demo-v0.1.md`.

## Not Included

This alpha does not include:

- security audit;
- production readiness;
- mainnet deployment guidance;
- arbitrary production execution;
- Safe integration;
- GraphQL;
- token voting;
- quadratic voting;
- reputation scoring;
- anti-Sybil or personhood logic;
- production multi-chain support;
- billing;
- SaaS overlay implementation;
- AI copilot;
- theme marketplace;
- plugin marketplace;
- public marketing website implementation.

## Closure Criteria

v0.1.0-alpha should be considered closed only after the commands and manual checks in `release-checklist-v0.1-alpha.md` pass for the intended tag set.

The expected verification set is:

- protocol tests pass;
- `@isonia/types` builds and typechecks;
- `@isonia/sdk` builds and tests pass;
- `@isonia/theme-default` builds and typechecks;
- Control Plane builds and tests pass;
- App Core typechecks and builds;
- the local end-to-end demo renders seeded organizations, proposals, route explanation, and graph data;
- optional write flows are verified only against the local Hardhat chain.

## Release Position

v0.1.0-alpha is a proof that the IsoniaOS architecture can connect:

- on-chain authority;
- replayable event indexing;
- typed public DTOs;
- a REST query surface;
- a self-hostable governance console.

It is not a production governance system.
