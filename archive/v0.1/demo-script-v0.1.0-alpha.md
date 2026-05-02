# IsoniaOS v0.1.0-alpha Demo Script

Status: Alpha closure  
Date: 2026-04-29  
Audience: local demo, architecture review, contributor onboarding

## Safety Notice

IsoniaOS v0.1.0-alpha is not audited and is not production ready.

Run this demo only on a local Hardhat chain or another explicitly disposable development network. Do not use real assets, production keys, mainnet governance, or customer organizations.

## Demo Goal

Show the v0.1 architecture working end to end:

```txt
Hardhat local chain
  -> GovCore / GovProposals / DemoTarget
  -> seeded demo governance
  -> Control Plane event indexing
  -> REST read models
  -> App Core governance console
  -> optional local wallet transactions
```

The main message:

```txt
Authority on-chain.
Intelligence off-chain.
Verification public.
```

## Prerequisites

- Node.js with Corepack enabled.
- PostgreSQL running locally.
- Local database named `control-plane`.
- Dependencies installed in the participating repositories.
- A browser wallet configured for the local Hardhat chain if demonstrating write flows.

The commands below use PowerShell and assume the workspace is:

```txt
C:\Users\yuryc\Code\isoniaos
```

## Presenter Notes

- Keep the demo framed as a prototype.
- State clearly that this alpha is not audited and not production ready.
- Emphasize that Control Plane explains and indexes authority, but contracts remain the authority.
- After every write transaction, re-run indexing and projections before expecting App Core to update.
- If the wallet flow is not ready in the demo environment, use the read-only route explanation flow as the primary proof.

## 1. Start Local Chain

Terminal A:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm hardhat node --hostname 127.0.0.1 --port 8545
```

Keep this terminal running.

Expected local values:

```txt
RPC URL: http://127.0.0.1:8545
Chain ID: 31337
```

Talking point:

```txt
This local chain stands in for a shared IsoniaOS protocol deployment. Organizations are isolated by orgId inside one deployment.
```

## 2. Deploy Protocol

Terminal B:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm deploy:local
```

Use the deployed addresses from:

```txt
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

For a fresh local Hardhat chain, the addresses are usually:

```txt
DemoTarget:   0x5FbDB2315678afecb367f032d93F642f64180aa3
GovCore:      0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
GovProposals: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
```

Talking point:

```txt
GovCore owns organizations, bodies, roles, mandates, and policy rules. GovProposals owns the proposal lifecycle. DemoTarget is only a controlled demo execution target.
```

## 3. Seed Demo Governance

Terminal B:

```powershell
$env:GOV_CORE_ADDRESS = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"
$env:GOV_PROPOSALS_ADDRESS = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"
$env:DEMO_TARGET_ADDRESS = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

corepack pnpm seed:local
```

If your deployment addresses differ, use the actual addresses from `deployed_addresses.json`.

Expected seeded organizations on a fresh chain:

```txt
simple-dao-plus:
  orgId: 1
  proposals:
    standardProposalId: 1
    treasuryProposalId: 2

bicameral-preview:
  orgId: 2
  proposals:
    treasuryProposalId: 3
    upgradeProposalId: 4
```

Talking point:

```txt
The seed data demonstrates different governance shapes: a DAO-plus structure and a bicameral preview. These are demo topologies, not production recommendations.
```

## 4. Configure Control Plane

Terminal C:

```powershell
cd C:\Users\yuryc\Code\isoniaos\control-plane

$env:PG_HOST = "localhost"
$env:PG_PORT = "5432"
$env:PG_DATABASE = "control-plane"
$env:PG_USER = "postgres"
$env:PG_PASSWORD = "secret"

$env:CHAIN_ID = "31337"
$env:RPC_URL = "http://127.0.0.1:8545"
$env:GOV_CORE_ADDRESS = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"
$env:GOV_PROPOSALS_ADDRESS = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"
$env:START_BLOCK = "0"
$env:CONFIRMATIONS = "0"
$env:BLOCK_RANGE_SIZE = "1000"
$env:POLL_INTERVAL_MS = "5000"
$env:API_PORT = "3000"
$env:CORS_ORIGINS = "http://localhost:5173,http://127.0.0.1:5173"
$env:CORS_CREDENTIALS = "false"
```

Use actual deployed addresses if they differ.

Create/reset the local schema:

```powershell
corepack pnpm db:migrate
corepack pnpm db:reset
```

Index and project chain events:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Talking point:

```txt
Control Plane stores raw events first, deduplicates by chainId + txHash + logIndex, then builds replayable read models.
```

## 5. Start Control Plane API

Terminal C, with the same environment variables:

```powershell
corepack pnpm start:dev
```

Quick checks from another terminal:

```powershell
Invoke-RestMethod http://localhost:3000/v1/health
Invoke-RestMethod http://localhost:3000/v1/version | ConvertTo-Json -Depth 6
Invoke-RestMethod http://localhost:3000/v1/orgs | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs/1/proposals/1/route | ConvertTo-Json -Depth 8
```

Talking point:

```txt
The REST API is a query and explanation layer. It makes governance understandable, but it does not create governance authority.
```

## 6. Configure App Core

Check:

```txt
app-core/public/isonia.config.json
```

For a fresh local demo, confirm:

```json
{
  "apiBaseUrl": "http://localhost:3000",
  "chainId": 31337,
  "rpcUrl": "http://127.0.0.1:8545",
  "contracts": {
    "govCoreAddress": "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512",
    "govProposalsAddress": "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0",
    "demoTargetAddress": "0x5FbDB2315678afecb367f032d93F642f64180aa3"
  },
  "features": {
    "createProposal": true,
    "writeActions": true
  },
  "wallet": {
    "reownProjectId": ""
  }
}
```

Use actual deployed addresses if they differ.

Talking point:

```txt
Runtime config keeps one static app build movable across environments. An empty Reown project ID uses injected wallet fallback for self-hosted mode.
```

## 7. Start App Core

Terminal D:

```powershell
cd C:\Users\yuryc\Code\isoniaos\app-core
corepack pnpm dev
```

Open:

```txt
http://localhost:5173/orgs
```

## 8. Read-Only Demo Flow

### Organizations

Open:

```txt
http://localhost:5173/orgs
```

Show:

- `simple-dao-plus`;
- `bicameral-preview`;
- organization status;
- admin address;
- chain/data status.

Talking point:

```txt
Two organizations share one protocol deployment, and orgId keeps their governance state isolated.
```

### Organization Overview

Open:

```txt
http://localhost:5173/orgs/1
```

Show:

- organization metadata/fallback display;
- counts;
- latest proposals;
- navigation to governance, proposals, and graph.

### Governance Structure

Open:

```txt
http://localhost:5173/orgs/1/governance
```

Show:

- bodies;
- roles;
- mandates;
- active/revoked state;
- holder addresses.

Talking point:

```txt
IsoniaOS is modeling who can decide what, under which scoped mandate, rather than only presenting a vote button.
```

### Proposal List

Open:

```txt
http://localhost:5173/orgs/1/proposals
```

Show:

- proposal IDs;
- proposal types;
- statuses;
- creators;
- policy versions.

### Proposal Route Explanation

Open:

```txt
http://localhost:5173/orgs/1/proposals/1
```

Show:

- proposal details;
- target/data hash;
- policy version;
- required approval bodies;
- veto bodies;
- timelock state;
- executable state;
- blocked reasons.

Talking point:

```txt
Route explanation uses the proposal's stored policyVersion. It does not silently fall back to the latest policy.
```

### Governance Graph

Open:

```txt
http://localhost:5173/orgs/1/graph
```

Show:

- organization node;
- bodies;
- roles;
- holders;
- proposals;
- governance relationship edges.

Talking point:

```txt
The graph is the public verification surface for the power map. In alpha it is a simple data view, not a finished graph product.
```

## 9. Optional Write Demo Flow

Only run this section on a local disposable chain.

Before starting, connect a browser wallet to:

```txt
RPC URL: http://127.0.0.1:8545
Chain ID: 31337
```

Use a seeded Hardhat account that has the needed mandate for the action being demonstrated.

### Create Proposal

Open:

```txt
http://localhost:5173/orgs/1/proposals/new
```

Create a demo proposal targeting `DemoTarget.setNumber(orgId, newNumber)`.

After the transaction confirms:

```powershell
cd C:\Users\yuryc\Code\isoniaos\control-plane
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Refresh the proposals list and open the new proposal detail page.

Talking point:

```txt
The write path goes directly to the contracts through the wallet. The UI reflects it only after Control Plane indexes and projects the emitted events.
```

### Approve

Open a proposal waiting for approvals.

Submit approval from a wallet with the required approver mandate. Then re-index and project:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Show that the route explanation marks the required body as approved.

### Veto

Open a proposal whose policy includes a veto-capable body.

Submit veto from a wallet with the matching veto mandate. Then re-index and project:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Show that the proposal status becomes `Vetoed` and execution is blocked.

### Queue

Open an approved proposal whose route requires a timelock.

Submit queue. Then re-index and project:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Show `queuedAtChain`, `executableAtChain`, and timelock state.

### Execute

Open an approved proposal without a required timelock, or a queued proposal whose timelock is satisfied.

Enter the demo number matching the proposal data hash and submit execute. Then re-index and project:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Show that proposal status becomes `Executed`.

Talking point:

```txt
Execution remains intentionally narrow in alpha. App Core only supports the DemoTarget.setNumber path.
```

### Cancel

Open a cancellable proposal.

Submit cancel as the org admin, or as the creator before any required approval. Then re-index and project:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Show that proposal status becomes `Cancelled` and further actions are unavailable.

## 10. Close

Close with:

```txt
v0.1.0-alpha proves the architecture: on-chain authority, off-chain indexing and explanation, and a public governance console.
It is not audited and not production ready.
The next stage is hardening, tests, documentation alignment, and controlled expansion of SDK/App Core capabilities.
```

## Troubleshooting Pointers

- If App Core shows empty data, query `http://localhost:3000/v1/orgs` directly.
- If REST data is empty, confirm seed ran against the same contract addresses Control Plane is indexing.
- If App Core cannot call Control Plane, check `CORS_ORIGINS`.
- If wallet transactions fail, confirm chain ID `31337`, selected account authority, contract addresses, and runtime config.
- If proposal state looks stale after a transaction, run `indexer:once` and `worker:projections` again.

For the detailed setup reference, see `local-e2e-demo-v0.1.md`.
