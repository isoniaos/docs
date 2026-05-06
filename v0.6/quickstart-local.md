# IsoniaOS v0.6 Quickstart Local

## Purpose

This guide describes the local v0.6 alpha demo path from clean public repository clones.

It is for developers and demo operators who want to run the self-hosted stack locally, create a Simple DAO+ organization, and complete the proposal lifecycle demo.

This is an alpha/local-demo setup. It is not production deployment guidance.

## Prerequisites

- Node.js >= 22.
- Recommended: latest Node 22 LTS patch.
- Node 24 may be tested later, but the v0.6 baseline is Node 22.
- Corepack and pnpm.
- Git.
- Local PostgreSQL.
- Browser wallet such as MetaMask or Rabby.
- Local Hardhat node.
- A browser that can open App Core at the Vite dev server URL.

If a repository README or `package.json` requires a higher Node version, use the higher requirement for that repository.

## Repositories

Clone these public repositories:

- `docs`
- `types`
- `sdk`
- `evm-contracts`
- `control-plane`
- `theme-default`
- `app-core`

Recommended clone layout:

```text
isoniaos/
  docs/
  types/
  sdk/
  evm-contracts/
  control-plane/
  theme-default/
  app-core/
```

Sibling repositories make local inspection and optional workspace-source testing easier.

## Known-Good Versions

Use [Compatibility Matrix](compatibility-matrix.md) as the source of truth for the alpha demo stack.

For a clean clone, fetch tags in each repository and check out the matrix tag where one is listed:

```sh
git fetch --tags origin
git checkout <tag-from-compatibility-matrix>
```

For `docs`, the alpha.5 tag is expected to be assigned only after this documentation task is accepted.

Do not use untagged package versions as release evidence unless the compatibility matrix has been intentionally updated after review.

## High-Level Startup Order

1. Fetch tags and check out known-good tags, or use the branch/ref noted in the compatibility matrix.
2. Install dependencies.
3. Start the local Hardhat node.
4. Deploy `evm-contracts` locally.
5. Seed Simple DAO+ or run the setup flow, depending on the current demo variant.
6. Configure Control Plane `.env`.
7. Run Control Plane migrations.
8. Start Control Plane API, indexer, and projections.
9. Configure App Core runtime config.
10. Start App Core.
11. Open diagnostics.
12. Run Simple DAO+ setup.
13. Run the proposal lifecycle demo.

## Install Dependencies

Run dependency installation inside each package repository that has a `package.json`:

```sh
corepack pnpm install
```

Start with lower-level packages first:

1. `types`
2. `sdk`
3. `evm-contracts`
4. `control-plane`
5. `theme-default`
6. `app-core`

If pnpm cannot resolve GitHub dependency refs, confirm the referenced tags exist in the corresponding public repository, then retry installation.

## Startup Order

### 1. Start Local Hardhat

In `evm-contracts`, the README documents:

```sh
corepack pnpm hardhat node --hostname 127.0.0.1 --port 8545
```

Keep this process running. Browser wallets should be connected to chain ID `31337`.

### 2. Deploy Contracts Locally

In another terminal in `evm-contracts`, deploy the protocol contracts.

The repository README currently documents:

```sh
corepack pnpm deploy:developer-preview
```

The package scripts also expose `deploy:local`. Verify against the repository README before changing the command used for a demo.

After deployment, read the generated local addresses from:

```text
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

Exact local addresses may change after a redeploy, especially after deleting deployment artifacts or restarting with a fresh chain.

### 3. Seed or Use the Setup Flow

There are two local-demo paths:

- Use App Core setup flow to create Simple DAO+ through `/orgs/new`.
- Use a repository seed script if the demo variant requires preseeded data.

The `evm-contracts` README currently documents this seed command:

```sh
corepack pnpm seed:developer-preview
```

Use the seed path only when the current demo script explicitly expects preseeded Simple DAO+ data. Otherwise, use the App Core setup wizard so the demo shows the setup workflow.

### 4. Configure Control Plane

In `control-plane`, copy the local environment example:

```sh
cp .env.example .env
```

On Windows PowerShell:

```powershell
Copy-Item .env.example .env
```

Set at least:

```text
CHAIN_ID=31337
RPC_URL=http://127.0.0.1:8545
GOV_CORE_ADDRESS=<deployed GovCore address>
GOV_PROPOSALS_ADDRESS=<deployed GovProposals address>
START_BLOCK=0
CONFIRMATIONS=0
API_PORT=3000
CORS_ORIGINS=http://localhost:5173,http://127.0.0.1:5173
```

If `DATABASE_URL` is used, keep it consistent with the local PostgreSQL database. Otherwise use the `PG_*` variables from `.env.example`.

Control Plane is not governance authority. Smart contracts remain authoritative; Control Plane indexes events, builds read models, exposes diagnostics, and can lag behind chain state.

### 5. Run Migrations

In `control-plane`:

```sh
corepack pnpm db:migrate
```

If this fails, verify PostgreSQL is running, the database exists, and credentials match `.env`.

### 6. Start Control Plane API, Indexer, and Projections

In `control-plane`, the README documents:

```sh
corepack pnpm dev
```

This starts the REST API, continuous indexer, and continuous projection worker for local development.

Diagnostics should be available at:

```text
http://localhost:3000/v1/diagnostics
http://localhost:3000/v1/diagnostics/indexer
```

### 7. Configure App Core Runtime Config

In `app-core`, copy the runtime config example:

```sh
cp public/isonia.config.example.json public/isonia.config.local.json
```

On Windows PowerShell:

```powershell
Copy-Item public/isonia.config.example.json public/isonia.config.local.json
```

Edit `public/isonia.config.local.json` so it matches the local contract deployment and Control Plane API:

```json
{
  "apiBaseUrl": "http://localhost:3000",
  "chainId": 31337,
  "rpcUrl": "http://127.0.0.1:8545",
  "contracts": {
    "govCoreAddress": "<deployed GovCore address>",
    "govProposalsAddress": "<deployed GovProposals address>",
    "demoTargetAddress": "<deployed DemoTarget address>"
  },
  "features": {
    "createProposal": true,
    "writeActions": true,
    "manageOrg": true
  },
  "wallet": {
    "reownProjectId": ""
  }
}
```

Use an empty `wallet.reownProjectId` for injected-wallet fallback in self-hosted local mode unless you intentionally provide a local Reown Project ID.

Runtime config and Control Plane config must point at the same deployed contract addresses.

### 8. Start App Core

In `app-core`:

```sh
corepack pnpm dev
```

The default Vite URL is:

```text
http://localhost:5173
```

### 9. Open Diagnostics

Open:

```text
http://localhost:5173/diagnostics
```

Confirm:

- API is reachable.
- App Core chain ID is `31337`.
- Wallet chain is `31337`.
- Control Plane sees the expected contract addresses.
- Indexer is not stale.
- Projection backlog is zero or draining.
- Runtime config contract addresses match the local deployment.

### 10. Run Simple DAO+ Setup

Open:

```text
http://localhost:5173/orgs/new
```

Use the Simple DAO+ setup wizard. Execute setup actions one by one and wait for each action to move through wallet signing, submitted, mined, indexed, projected, and completed states.

If the setup action is mined but not visible in the app, check `/diagnostics`, `/v1/diagnostics`, and `/v1/diagnostics/indexer` before retrying.

### 11. Run Proposal Lifecycle Demo

After setup completion:

1. Open the organization proposal page.
2. Create a DemoTarget proposal.
3. Open proposal details.
4. Inspect route explanation.
5. Approve from required bodies.
6. Queue when timelock applies.
7. Use local Hardhat time controls only on chain ID `31337`.
8. Execute the proposal.
9. Confirm final proposal state and DemoTarget result.

Use [Design Partner Demo Script](design-partner-demo-script.md) for the operator flow and talk track.

## Local Address Rules

Local addresses are not stable across every redeploy. After any Hardhat restart, redeploy, or deployment artifact cleanup:

- reread `deployed_addresses.json`;
- update `control-plane/.env`;
- update `app-core/public/isonia.config.local.json`;
- restart Control Plane and App Core if needed;
- reload `/diagnostics`.

If Control Plane and App Core disagree about contract addresses, the UI can show stale or empty read models even if transactions were mined successfully.
