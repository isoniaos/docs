# IsoniaOS v0.1 — Control Plane Implementation Plan

## Purpose

`isonia-control-plane` is the indexing, query, and operational backend for IsoniaOS.

It is not the source of truth for governance authority. The EVM protocol is the source of truth.

## Architecture

```txt
EVM Contracts
  -> Events
  -> Raw Event Store
  -> Projection Workers
  -> PostgreSQL Read Models
  -> REST API
  -> App Core / SaaS
```

## Tech stack

- Node.js + TypeScript
- NestJS
- PostgreSQL
- viem for RPC/log decoding
- REST only
- minimal runtime dependencies

## Required modules

### Config module

Required config:

```txt
NODE_ENV
DATABASE_URL
CHAIN_ID
RPC_URL
GOV_CORE_ADDRESS
GOV_PROPOSALS_ADDRESS
START_BLOCK
CONFIRMATIONS
BLOCK_RANGE_SIZE
POLL_INTERVAL_MS
API_PORT
```

### Ingestion module

Use polling `getLogs` as the reliable baseline. WebSocket can be added later as acceleration, not as the only ingestion path.

Worker loop:

```txt
1. read cursor
2. latestSafeBlock = latestBlock - confirmations
3. fetch logs by range
4. decode known events
5. insert raw events with ON CONFLICT DO NOTHING
6. advance cursor only after persistence
7. sleep
```

### Raw event store

Unique key:

```txt
chain_id + tx_hash + log_index
```

Minimum table:

```sql
CREATE TABLE raw_events (
  id BIGSERIAL PRIMARY KEY,
  chain_id BIGINT NOT NULL,
  contract_address TEXT NOT NULL,
  block_number BIGINT NOT NULL,
  block_hash TEXT NOT NULL,
  tx_hash TEXT NOT NULL,
  log_index INTEGER NOT NULL,
  event_name TEXT NOT NULL,
  event_args JSONB NOT NULL,
  observed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  confirmation_status TEXT NOT NULL DEFAULT 'confirmed',
  processed_at TIMESTAMPTZ NULL,
  processing_error TEXT NULL,
  processing_attempts INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (chain_id, tx_hash, log_index)
);
```

### Projection module

Projection workers process raw events in deterministic order:

```txt
block_number ASC, log_index ASC
```

Each event must be processed idempotently inside a DB transaction.

Required projections:

- organizations
- bodies
- roles
- mandates
- policy_rules
- proposals
- proposal_decisions
- governance_edges

### Route Explanation Service

Given `chainId`, `orgId`, `proposalId`, return:

- proposal status;
- required approvals;
- collected approvals;
- pending approvals;
- veto state;
- timelock state;
- executable boolean;
- blocked reasons.

## REST endpoints

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

## Reliability requirements

- at-least-once ingestion;
- idempotent raw event insert;
- idempotent projections;
- replayable read models;
- confirmation-aware ingestion;
- manual replay/rebuild commands.

Required commands:

```txt
npm run dev
npm run build
npm run start
npm run db:migrate
npm run indexer:start
npm run worker:projections
npm run replay
npm run test
npm run lint
```

## Acceptance criteria

Control Plane v0.1 is complete when:

- it connects to RPC;
- it fetches events from `GovCore` and `GovProposals`;
- it stores raw events idempotently;
- projections are built for all core entities;
- REST API returns DTO-compatible responses;
- route explanation works for at least 3 proposal types;
- read models can be rebuilt from raw events;
- app-core can consume API without direct list reads from RPC.
