# IsoniaOS v0.1 — Control Plane Spec

Status: Draft for implementation  
Scope: TypeScript/NestJS control plane, indexer, REST API, read models  
Product: IsoniaOS  
Company: Isonia

---

## 1. Purpose

The control plane is the off-chain query, indexing, and operational layer for IsoniaOS.

It is not the source of governance authority. Contracts are the source of truth.

The control plane exists to:

- ingest blockchain events reliably;
- store raw events;
- build query-friendly projections;
- expose REST API;
- explain proposal routes;
- support frontend views;
- support SaaS/public API rate limits;
- provide a foundation for replay, reorg handling, and operational reliability.

---

## 2. Non-goals for v0.1

Do not implement in v0.1:

- GraphQL API;
- multi-chain production support;
- billing/subscriptions;
- advanced analytics;
- AI summaries;
- webhooks;
- Kafka/RabbitMQ unless absolutely needed;
- custom hosted node infrastructure;
- full decentralized indexing.

---

## 3. Core architecture

```text
EVM contracts
   ↓ logs
RPC log fetcher / poller
   ↓
raw_events inbox
   ↓
projection worker
   ↓
Postgres read models
   ↓
REST API
   ↓
app-core / saas frontend
```

---

## 4. Main components

### 4.1 API server

NestJS REST API.

Responsibilities:

- expose org-centric REST endpoints;
- serve read models;
- serve proposal route explanations;
- serve governance graph;
- expose health/version endpoints;
- enforce RPS/rate limits where needed.

### 4.2 Chain ingestion worker

Responsibilities:

- poll/fetch logs from configured RPC provider;
- decode IsoniaOS contract events;
- persist raw events into `raw_events`;
- deduplicate by natural event key;
- track block cursor.

### 4.3 Projection worker

Responsibilities:

- read unprocessed raw events;
- apply deterministic projection handlers;
- update read model tables;
- mark events as processed;
- be idempotent and replay-safe.

### 4.4 Route explanation service

Responsibilities:

- inspect proposal, policy, approvals, vetoes, timelock;
- return human-readable and machine-readable route status;
- never invent authority not present in read models/on-chain events.
- return `policy_snapshot_missing` when the proposal's policy version is absent from projections, without falling back to the latest policy.

### 4.5 Governance graph service

Responsibilities:

- build nodes and edges for org governance topology;
- return a frontend-friendly graph model.

---

## 5. Reliability model

### 5.1 Required semantics

The control plane MUST use:

- at-least-once event ingestion;
- idempotent processing;
- duplicate-safe writes;
- replayable projections;
- finality-aware statuses;
- reorg-aware cursor management.

Do not assume exactly-once delivery from RPC/WebSocket providers.

### 5.2 Event identity

Every blockchain log MUST be uniquely identified by:

```text
chainId + blockNumber + txHash + logIndex
```

This key MUST have a unique constraint in `raw_events`.

### 5.3 Event statuses

Recommended raw event processing status:

```text
observed     — event was fetched and stored
confirmed    — event has enough confirmations
processed    — projection handler applied successfully
failed       — projection failed and needs retry/dead-letter handling
orphaned     — event belongs to a reorged block
```

For v0.1, minimum required externally visible data state:

- `observed`
- `confirmed`

Internally, use more statuses if useful.

### 5.4 Confirmation depth

Configurable per chain.

Example defaults for local/testnet:

```text
local: 0 confirmations
sepolia/testnet: 6 confirmations
mainnet future: configurable, e.g. 12+
```

v0.1 does not need mainnet-grade finality, but the architecture must support it.

---

## 6. Database

Use PostgreSQL.

Avoid complex dependencies unless necessary. Keep projection logic first-party and deterministic.

---

## 7. Database schema

### 7.1 `raw_events`

Stores every decoded or decodable chain event.

Required columns:

```sql
id uuid primary key,
chain_id integer not null,
contract_address text not null,
block_number bigint not null,
block_hash text not null,
tx_hash text not null,
log_index integer not null,
event_name text not null,
args jsonb not null,
raw_log jsonb not null,
status text not null,
confirmations integer not null default 0,
observed_at timestamptz not null,
confirmed_at timestamptz,
processed_at timestamptz,
failed_at timestamptz,
error text,
created_at timestamptz not null default now(),
updated_at timestamptz not null default now(),
unique(chain_id, block_number, tx_hash, log_index)
);
```

### 7.2 `chain_cursors`

Tracks ingestion progress per chain/contract.

```sql
id uuid primary key,
chain_id integer not null,
contract_address text not null,
last_scanned_block bigint not null,
last_confirmed_block bigint,
updated_at timestamptz not null default now(),
unique(chain_id, contract_address)
);
```

### 7.3 `organizations`

```sql
org_id bigint not null,
chain_id integer not null,
admin text not null,
slug text,
metadata_uri text,
status text not null,
created_block bigint not null,
created_tx_hash text not null,
data_status text not null,
created_at timestamptz not null,
updated_at timestamptz not null,
primary key(chain_id, org_id)
);
```

### 7.4 `bodies`

```sql
body_id bigint not null,
org_id bigint not null,
chain_id integer not null,
kind text not null,
metadata_uri text,
active boolean not null,
created_block bigint not null,
data_status text not null,
created_at timestamptz not null,
updated_at timestamptz not null,
primary key(chain_id, body_id)
);
```

### 7.5 `roles`

```sql
role_id bigint not null,
org_id bigint not null,
body_id bigint not null,
chain_id integer not null,
role_type text not null,
metadata_uri text,
active boolean not null,
data_status text not null,
created_at timestamptz not null,
updated_at timestamptz not null,
primary key(chain_id, role_id)
);
```

### 7.6 `mandates`

```sql
mandate_id bigint not null,
org_id bigint not null,
body_id bigint not null,
role_id bigint not null,
chain_id integer not null,
holder text not null,
start_time bigint not null,
end_time bigint not null,
proposal_type_mask numeric not null,
spending_limit numeric not null,
active boolean not null,
revoked boolean not null,
data_status text not null,
created_at timestamptz not null,
updated_at timestamptz not null,
primary key(chain_id, mandate_id)
);
```

### 7.7 `policy_rules`

```sql
chain_id integer not null,
org_id bigint not null,
proposal_type text not null,
required_approval_bodies jsonb not null,
veto_bodies jsonb not null,
executor_body bigint,
timelock_seconds bigint not null,
enabled boolean not null,
data_status text not null,
updated_at timestamptz not null,
primary key(chain_id, org_id, proposal_type)
);
```

### 7.8 `proposals`

```sql
proposal_id bigint not null,
org_id bigint not null,
chain_id integer not null,
proposal_type text not null,
status text not null,
creator text not null,
target text,
value numeric not null,
data_hash text not null,
metadata_uri text,
created_block bigint not null,
created_tx_hash text not null,
created_at_chain bigint not null,
queued_at_chain bigint,
executable_at_chain bigint,
executed_at_chain bigint,
data_status text not null,
created_at timestamptz not null,
updated_at timestamptz not null,
primary key(chain_id, proposal_id)
);
```

### 7.9 `proposal_decisions`

```sql
id uuid primary key,
chain_id integer not null,
org_id bigint not null,
proposal_id bigint not null,
body_id bigint not null,
actor text not null,
decision_type text not null,
tx_hash text not null,
block_number bigint not null,
log_index integer not null,
data_status text not null,
created_at timestamptz not null,
unique(chain_id, proposal_id, body_id, decision_type)
);
```

### 7.10 `governance_edges`

For graph visualization.

```sql
id uuid primary key,
chain_id integer not null,
org_id bigint not null,
source_type text not null,
source_id text not null,
target_type text not null,
target_id text not null,
edge_type text not null,
metadata jsonb not null default '{}',
data_status text not null,
updated_at timestamptz not null,
unique(chain_id, org_id, source_type, source_id, target_type, target_id, edge_type)
);
```

---

## 8. Projection handlers

Each event type must have a deterministic handler.

### 8.1 Handler rules

Each handler MUST:

- run inside a DB transaction;
- be safe to run multiple times;
- use upsert where appropriate;
- update `governance_edges` if needed;
- mark the raw event processed only after successful transaction;
- never require non-deterministic external data to build core projection.

### 8.2 Required handlers

- `OrganizationCreated`
- `OrganizationUpdated`
- `OrganizationStatusChanged`
- `BodyCreated`
- `BodyUpdated`
- `RoleCreated`
- `RoleUpdated`
- `MandateAssigned`
- `MandateRevoked`
- `PolicyRuleSet`
- `ProposalCreated`
- `ProposalApproved`
- `ProposalVetoed`
- `ProposalQueued`
- `ProposalExecuted`
- `ProposalCancelled`

---

## 9. Reorg handling

v0.1 minimum:

- store `block_hash` for each event;
- when scanning a known block range, detect if block hash changed;
- mark affected events as `orphaned`;
- rebuild projections from a safe checkpoint or full replay if needed.

Simpler v0.1 acceptable path:

- full projection rebuild from `raw_events` excluding `orphaned` events;
- manual/admin-triggered rebuild command.

---

## 10. Replay strategy

The system MUST support projection rebuild.

Required commands/scripts:

```text
rebuild:projections
replay:org --orgId <id>
replay:from-block --chainId <id> --from <block> --to <block>
```

v0.1 may implement only full rebuild if partial replay is too expensive, but schema should not block partial replay later.

---

## 11. REST API

Base path:

```text
/v1
```

### 11.1 Health/system

```http
GET /v1/health
GET /v1/version
```

### 11.2 Organizations

```http
GET /v1/orgs
GET /v1/orgs/:orgId
GET /v1/orgs/:orgId/overview
```

### 11.3 Bodies/roles/mandates

```http
GET /v1/orgs/:orgId/bodies
GET /v1/orgs/:orgId/roles
GET /v1/orgs/:orgId/mandates
GET /v1/orgs/:orgId/holders/:address/mandates
```

### 11.4 Proposals

```http
GET /v1/orgs/:orgId/proposals
GET /v1/orgs/:orgId/proposals/:proposalId
GET /v1/orgs/:orgId/proposals/:proposalId/route
```

### 11.5 Governance graph

```http
GET /v1/orgs/:orgId/graph
```

---

## 12. DTOs

### 12.1 Proposal route DTO

```ts
export interface ProposalRouteDto {
  orgId: string;
  proposalId: string;
  proposalType: string;
  status: string;
  requiredApprovals: Array<{
    bodyId: string;
    bodyName?: string;
    approved: boolean;
    actor?: string;
    decidedAt?: string;
  }>;
  vetoBodies: Array<{
    bodyId: string;
    bodyName?: string;
    vetoed: boolean;
    actor?: string;
    decidedAt?: string;
  }>;
  timelock: {
    required: boolean;
    seconds: number;
    queuedAt?: string;
    executableAt?: string;
    satisfied: boolean;
  };
  executable: boolean;
  blockers: string[];
}
```

### 12.2 Governance graph DTO

```ts
export interface GovernanceGraphDto {
  orgId: string;
  nodes: Array<{
    id: string;
    type: 'organization' | 'body' | 'role' | 'holder' | 'proposalType' | 'proposal';
    label: string;
    metadata?: Record<string, unknown>;
  }>;
  edges: Array<{
    id: string;
    source: string;
    target: string;
    type: string;
    metadata?: Record<string, unknown>;
  }>;
}
```

---

## 13. API response rules

- JSON only.
- Use strings for big integer IDs and numeric blockchain values in API responses.
- Do not expose internal DB UUIDs unless useful.
- Include `dataStatus` where relevant: `observed` or `confirmed`.
- Keep response shapes deterministic.

---

## 14. Rate limiting

v0.1 should include simple rate limiting hooks, especially for public/free SaaS usage.

Recommended:

- per IP for unauthenticated requests;
- per API key later;
- config-driven limits.

No complex billing in v0.1.

---

## 15. Minimal dependency policy

Allowed core dependencies:

- NestJS;
- PostgreSQL driver/ORM/query builder chosen by team;
- viem for event decoding/RPC interaction;
- validation library if needed;
- dev/test tooling.

Avoid:

- unnecessary queues in v0.1 unless needed;
- large event-sourcing frameworks;
- magic blockchain indexer frameworks;
- dependencies that hide delivery/retry semantics.

The ingestion and projection reliability logic should be first-party code.

---

## 16. Configuration

Required environment config:

```text
NODE_ENV
PORT
DATABASE_URL
CHAIN_ID
RPC_HTTP_URL
RPC_WS_URL optional
GOV_CORE_ADDRESS
GOV_PROPOSALS_ADDRESS
START_BLOCK
CONFIRMATION_DEPTH
MAX_BLOCK_RANGE
PUBLIC_RPS_LIMIT
```

---

## 17. Local development

Required commands:

```text
pnpm dev
pnpm build
pnpm test
pnpm db:migrate
pnpm indexer:start
pnpm projections:rebuild
```

Package manager can be adjusted, but must be consistent across repo.

---

## 18. Acceptance criteria

Control plane v0.1 is complete when:

- it connects to configured RPC;
- it ingests GovCore/GovProposals events;
- raw events are stored with unique natural keys;
- duplicate event ingestion is safe;
- projections are created for orgs/bodies/roles/mandates/policies/proposals;
- route explanation endpoint works;
- governance graph endpoint works;
- projections can be rebuilt from raw events;
- REST API supports all v0.1 app-core screens;
- observed/confirmed distinction exists;
- basic health/version endpoints exist.
