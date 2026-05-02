# IsoniaOS v0.1-alpha Release Checklist

Status: Pre-tag checklist  
Scope: Local verification before tagging the v0.1-alpha repositories

## Purpose

Use this checklist before creating v0.1-alpha tags. It verifies that the protocol, shared packages, Control Plane, app-core, and the local demo still line up.

Do not continue to tagging if any required command fails or if a manual governance flow behaves differently from the v0.1 docs.

## Package Checks

Run each command from the repository named in the heading.

### evm-contracts

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm install
corepack pnpm test
```

Expected result:

- All Hardhat protocol tests pass.

### types

```powershell
cd C:\Users\yuryc\Code\isoniaos\types
corepack pnpm install
corepack pnpm build
corepack pnpm typecheck
```

Expected result:

- `dist/` builds successfully.
- TypeScript reports no type errors.

### sdk

```powershell
cd C:\Users\yuryc\Code\isoniaos\sdk
corepack pnpm install
corepack pnpm build
corepack pnpm test
```

Expected result:

- SDK TypeScript build succeeds.
- SDK path and client tests pass.

### theme-default

```powershell
cd C:\Users\yuryc\Code\isoniaos\theme-default
corepack pnpm install
corepack pnpm build
corepack pnpm typecheck
```

Expected result:

- Theme package builds successfully.
- TypeScript reports no type errors.

### control-plane

```powershell
cd C:\Users\yuryc\Code\isoniaos\control-plane
corepack pnpm install
corepack pnpm build
corepack pnpm test
```

Expected result:

- Nest build succeeds.
- Jest tests pass.

### app-core

```powershell
cd C:\Users\yuryc\Code\isoniaos\app-core
corepack pnpm install
corepack pnpm typecheck
corepack pnpm build
```

Expected result:

- TypeScript reports no type errors.
- Vite production build succeeds.

## Local End-to-End Demo

Follow `local-e2e-demo-v0.1.md` for detailed setup. The short release path is:

### Start local chain

Terminal A:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm hardhat node --hostname 127.0.0.1 --port 8545
```

Keep this terminal running.

### Deploy and seed protocol

Terminal B:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm deploy:local
```

Use the actual addresses from:

```txt
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

Then seed with those addresses:

```powershell
$env:GOV_CORE_ADDRESS = "<GovCore address>"
$env:GOV_PROPOSALS_ADDRESS = "<GovProposals address>"
$env:DEMO_TARGET_ADDRESS = "<DemoTarget address>"
corepack pnpm seed:local
```

Record the printed organization and proposal IDs.

### Index and project events

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
$env:GOV_CORE_ADDRESS = "<GovCore address>"
$env:GOV_PROPOSALS_ADDRESS = "<GovProposals address>"
$env:START_BLOCK = "0"
$env:CONFIRMATIONS = "0"
$env:BLOCK_RANGE_SIZE = "1000"
$env:POLL_INTERVAL_MS = "5000"
$env:API_PORT = "3000"
$env:CORS_ORIGINS = "http://localhost:5173,http://127.0.0.1:5173"
$env:CORS_CREDENTIALS = "false"

corepack pnpm db:migrate
corepack pnpm db:reset
corepack pnpm indexer:once
corepack pnpm worker:projections
corepack pnpm start:dev
```

Keep the API running.

### Start app-core

Confirm `app-core/public/isonia.config.json` uses the same chain ID and contract addresses as the deployment. Ensure local write testing has:

```json
{
  "features": {
    "createProposal": true,
    "writeActions": true
  }
}
```

Terminal D:

```powershell
cd C:\Users\yuryc\Code\isoniaos\app-core
corepack pnpm dev
```

Open:

```txt
http://localhost:5173/orgs
```

## Manual Demo Checks

### Read-only checks

- `/orgs` renders seeded organizations.
- `/orgs/1` renders the organization overview.
- `/orgs/1/governance` renders bodies, roles, and mandates.
- `/orgs/1/proposals` renders seeded proposals.
- `/orgs/1/proposals/1` renders proposal details and route explanation.
- `/orgs/1/graph` renders graph data.

### Create proposal

- Open the create proposal flow from an organization proposals page.
- Connect the local Hardhat wallet that has proposer authority or org admin authority.
- Create a demo proposal against `DemoTarget`.
- Run `corepack pnpm indexer:once` and `corepack pnpm worker:projections` in control-plane.
- Confirm the proposal appears in the proposals list and detail page with the expected policy version and route.

### Approve flow

- Open a proposal that is waiting for required approvals.
- Submit each required approval with a wallet that has the matching approver mandate.
- Re-run `indexer:once` and `worker:projections`.
- Confirm the route marks the required bodies as approved.
- Confirm proposal status reaches `Approved` after the final required approval.

### Veto flow

- Open a proposal whose policy snapshot includes a veto-capable body.
- Submit a veto with a wallet that has the matching veto mandate.
- Re-run `indexer:once` and `worker:projections`.
- Confirm proposal status becomes `Vetoed`.
- Confirm execute and queue actions are not available after veto.

### Queue flow

- Open an approved proposal whose route has a required timelock.
- Confirm the Queue action is visible only while status is `Approved` and the route says timelock is required.
- Submit Queue.
- Re-run `indexer:once` and `worker:projections`.
- Confirm proposal status becomes `Queued`.
- Confirm queued and executable chain times are shown.

### Execute flow

- Open an approved proposal with no required timelock, or a queued proposal whose timelock is satisfied.
- Confirm Execute is the preferred action when route execution is executable and no timelock queue is required.
- Enter the demo number that matches the proposal data hash.
- Submit Execute with an executor-authorized wallet.
- Re-run `indexer:once` and `worker:projections`.
- Confirm proposal status becomes `Executed`.
- Confirm the proposal cannot be executed again.

### Cancel flow

- Open a cancellable proposal.
- Confirm the UI explains that contract authority is final.
- Confirm org admin can cancel.
- Confirm the proposal creator can cancel only before any required approval.
- Re-run `indexer:once` and `worker:projections`.
- Confirm proposal status becomes `Cancelled`.
- Confirm approve, veto, queue, execute, and cancel actions are no longer available.

## Pre-Tag Review

- No dependency additions were made for release polish.
- No protocol logic changed.
- Shared DTOs, route explanation semantics, and app-core behavior remain aligned.
- Public documentation is English.
- The final commit list is small and reviewable.
