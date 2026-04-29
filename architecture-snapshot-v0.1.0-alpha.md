# IsoniaOS v0.1.0-alpha Architecture Snapshot

Status: Alpha closure  
Date: 2026-04-29  
Scope: Current workspace repositories and v0.1 documentation

## Safety Notice

IsoniaOS v0.1.0-alpha is not audited and is not production ready.

This snapshot describes a local/developer prototype. It must not be read as production deployment guidance.

## Core Principle

```txt
Authority on-chain.
Intelligence off-chain.
Verification public.
```

The protocol contracts are the source of governance authority. Off-chain systems index, explain, cache, display, and help users act, but they do not define who has authority.

## Repository Map

| Repository | Package / Module | Alpha role |
| --- | --- | --- |
| `evm-contracts` | `@isonia/evm-contracts` | Solidity protocol prototype, local deployment, seed data, tests |
| `types` | `@isonia/types` | Shared enums, DTOs, event shapes, graph shapes, constants |
| `control-plane` | `@isonia/control-plane` | Private NestJS/PostgreSQL/viem indexer and REST API |
| `sdk` | `@isonia/sdk` | Typed REST client and path helpers |
| `app-core` | `@isonia/app-core` | Public React + Vite self-hostable governance console foundation |
| `theme-default` | `@isonia/theme-default` | Default CSS variable theme, tokens, brand metadata, placeholder logo |
| `docs` | Documentation repo | Specs, local demo guide, checklist, closure docs |
| `saas` | Placeholder boundary | Private SaaS overlay is not implemented in alpha |
| `web` | Placeholder boundary | Public website is not implemented in alpha |

## Runtime Architecture

```txt
Browser / wallet
  |
  | reads REST
  v
App Core (React + Vite)
  |
  | typed client
  v
SDK REST client
  |
  | HTTP JSON
  v
Control Plane REST API
  |
  | PostgreSQL read models
  v
Projection worker
  |
  | confirmed raw events
  v
raw_events store
  ^
  | getLogs polling
  |
EVM contracts on local chain
```

Write flow:

```txt
Browser wallet
  -> GovProposals transaction
  -> contract events
  -> Control Plane indexer
  -> projection worker
  -> REST read model update
  -> App Core refresh
```

## On-Chain Protocol

The alpha protocol is split into:

- `GovCore`: organizations, bodies, roles, mandates, policy rules, policy versions, authorization helpers.
- `GovProposals`: proposal lifecycle, approvals, vetoes, queueing, cancellation, controlled demo execution.
- `DemoTarget`: local/demo execution target.
- `GovTypes`: shared Solidity enums and structs.

Key alpha properties:

- one shared deployment can host many organizations;
- every organization-scoped entity includes `orgId`;
- policy rules are versioned;
- proposals store `policyVersion` at creation;
- proposal route checks use the proposal's stored policy version;
- proposal status transitions emit `ProposalStatusChanged`;
- mandate lookup is scoped by holder and `orgId`;
- execution is limited to `DemoTarget`.

## Shared Types

`@isonia/types` is the shared TypeScript contract between repositories.

It owns:

- domain enums;
- chain enum maps;
- governance event argument DTOs;
- raw event DTOs;
- REST DTOs;
- route explanation DTOs;
- governance graph DTOs;
- domain constants.

Dependency boundary:

```txt
@isonia/types
  <- @isonia/sdk
  <- app-core
  <- saas later
```

Control Plane also depends on `@isonia/types` for shared DTOs and enum maps.

## Event and Projection Model

Control Plane ingests contract logs and stores decoded raw events before projection.

Logical raw event identity:

```txt
chainId + txHash + logIndex
```

Physical raw log identity:

```txt
chainId + blockHash + txHash + logIndex
```

Alpha schema stores:

- `chain_id`;
- `contract_address`;
- `block_number`;
- `block_hash`;
- `block_timestamp`;
- `tx_hash`;
- `log_index`;
- `event_name`;
- `args`;
- `raw_log`;
- status and processing metadata.

Projection workers claim unprocessed confirmed rows with row locking and update read models idempotently. Rebuild support exists for projection replay from `raw_events`.

## Control Plane

Control Plane is a private NestJS service backed by PostgreSQL.

Alpha modules include:

- config;
- database;
- chain event decoding;
- indexer;
- projections;
- read models;
- system health/version;
- REST controllers.

Supported REST endpoints:

```txt
GET /v1/health
GET /v1/version
GET /v1/orgs
GET /v1/orgs/:orgId
GET /v1/orgs/:orgId/overview
GET /v1/orgs/:orgId/bodies
GET /v1/orgs/:orgId/roles
GET /v1/orgs/:orgId/mandates
GET /v1/orgs/:orgId/holders/:address/mandates
GET /v1/orgs/:orgId/proposals
GET /v1/orgs/:orgId/proposals/:proposalId
GET /v1/orgs/:orgId/proposals/:proposalId/route
GET /v1/orgs/:orgId/graph
```

Route explanation returns:

- proposal status;
- proposal type;
- policy version;
- required approval bodies;
- collected approvals;
- pending approvals;
- veto-capable bodies;
- veto state;
- timelock state;
- executable boolean;
- blocked reasons.

If a proposal references a policy version missing from projections, the route reports `policy_snapshot_missing`.

## SDK

`@isonia/sdk` currently provides:

- `createIsoniaControlPlaneClient`;
- typed REST methods for the v0.1 endpoints;
- `controlPlanePaths` helpers;
- normalized HTTP error handling;
- response typing through `@isonia/types`.

It does not yet include protocol transaction helpers.

## App Core

App Core is a React + Vite SPA.

Current routes:

```txt
/
/orgs
/orgs/:orgId
/orgs/:orgId/governance
/orgs/:orgId/proposals
/orgs/:orgId/proposals/new
/orgs/:orgId/proposals/:proposalId
/orgs/:orgId/graph
```

App Core reads runtime config from:

```txt
/isonia.config.json
```

Important runtime config areas:

- API base URL;
- chain ID/name/RPC URL;
- contract addresses;
- feature flags;
- theme source;
- metadata resolver settings;
- wallet/Reown settings.

Wallet model:

- wagmi and viem are the core EVM interaction layer;
- Reown AppKit is optional wallet UX;
- empty `wallet.reownProjectId` activates injected wallet fallback.

Current write flows:

- create proposal;
- approve;
- veto;
- queue;
- execute;
- cancel.

The UI only hints at action availability. Contracts enforce authority and final validity.

## Theme

`@isonia/theme-default` provides:

- CSS variables;
- typed tokens;
- brand metadata;
- placeholder logo asset.

Theme replacement is an architectural boundary, but marketplace/editor/runtime remote theme loading are not part of this alpha.

## Local Demo Topology

Seed data creates two demo organizations on a fresh local chain:

```txt
simple-dao-plus:
  orgId: 1
  bodies:
    General Council
    Treasury Committee
    Security Council

bicameral-preview:
  orgId: 2
  bodies:
    Capital House
    Merit House
    Emergency Council
```

The seed script also creates demo policy rules, mandates, and proposals.

## Current Boundary

This alpha establishes:

- contracts/types/docs alignment;
- REST-only Control Plane;
- shared DTO usage;
- policy-versioned proposal route explanation;
- local event indexing and projections;
- a self-hostable App Core skeleton with real read and local write paths.

It does not establish:

- audited production protocol safety;
- mainnet deployment;
- arbitrary execution;
- production SaaS;
- public website;
- billing;
- GraphQL;
- token/reputation/Sybil systems.

For limits and non-production boundaries, see `known-limitations-v0.1.0-alpha.md`.
