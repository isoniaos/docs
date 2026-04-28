# IsoniaOS v0.1 Local End-to-End Demo

## Purpose

This guide runs the first local end-to-end IsoniaOS demo:

```txt
Hardhat local chain
  -> evm-contracts deployment
  -> demo org/policy/proposal seed data
  -> control-plane event indexing and projections
  -> app-core local UI
```

The demo proves that app-core can render indexed governance data from control-plane instead of reading governance state directly from RPC.

## Prerequisites

- Node.js with Corepack enabled.
- PostgreSQL running locally.
- A local PostgreSQL database named `control-plane`.
- Dependencies installed in each package that participates in the demo:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm install

cd C:\Users\yuryc\Code\isoniaos\control-plane
corepack pnpm install

cd C:\Users\yuryc\Code\isoniaos\app-core
corepack pnpm install
```

The commands below use PowerShell syntax. On macOS or Linux, replace `$env:NAME = "value"` with `export NAME="value"`.

## 1. Start the Local EVM Chain

Open terminal A:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm hardhat node --hostname 127.0.0.1 --port 8545
```

Keep this terminal running for the whole demo.

Expected local chain values:

```txt
RPC URL:  http://127.0.0.1:8545
Chain ID: 31337
```

## 2. Deploy evm-contracts

Open terminal B:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm deploy:local
```

For a fresh Hardhat chain, the deterministic local addresses are usually:

```txt
DemoTarget:   0x5FbDB2315678afecb367f032d93F642f64180aa3
GovCore:      0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
GovProposals: 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0
```

The deployed addresses are also written to:

```txt
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

Use the actual addresses from that file if they differ from the values above.

## 3. Seed Demo Governance Data

In terminal B, set the deployed contract addresses and run the seed script:

```powershell
$env:GOV_CORE_ADDRESS = "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512"
$env:GOV_PROPOSALS_ADDRESS = "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0"
$env:DEMO_TARGET_ADDRESS = "0x5FbDB2315678afecb367f032d93F642f64180aa3"

corepack pnpm seed:local
```

The seed script prints JSON. Save the `organizations` block from that output for verification.

On a fresh chain, the seeded data should be:

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

If your seed output reports different IDs, use the reported IDs in the API and app-core verification steps.

## 4. Configure and Index control-plane

The current control-plane reads `process.env` directly. The `.env.example` file is a reference, but it is not automatically loaded by the app.

Open terminal C:

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

Create or update the schema:

```powershell
corepack pnpm db:migrate
```

For a clean local demo database, reset the tables after migration:

```powershell
corepack pnpm db:reset
```

Index the chain logs and build projections:

```powershell
corepack pnpm indexer:once
corepack pnpm worker:projections
```

`worker:projections` processes all pending confirmed raw events and exits when idle. If you submit more transactions later, run `indexer:once` and `worker:projections` again.

## 5. Start control-plane API

In terminal C, keep the same environment variables set and start the REST API:

```powershell
corepack pnpm start:dev
```

The API should be available at:

```txt
http://localhost:3000/v1
```

Quick checks from another terminal:

```powershell
Invoke-RestMethod http://localhost:3000/v1/health
Invoke-RestMethod http://localhost:3000/v1/version | ConvertTo-Json -Depth 6
Invoke-RestMethod http://localhost:3000/v1/orgs | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs/1/proposals | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs/1/proposals/1/route | ConvertTo-Json -Depth 8
```

Expected results:

- `/v1/health` returns `status: ok`.
- `/v1/version` reports chain ID `31337` and the deployed GovCore/GovProposals addresses.
- `/v1/orgs` returns at least `simple-dao-plus` and `bicameral-preview`.
- `/v1/orgs/1/proposals` returns seeded proposals.
- `/v1/orgs/1/proposals/1/route` returns route explanation data for proposal `1`.

## 6. Configure app-core

Check `app-core/public/isonia.config.json`.

For the default fresh local deployment it should contain:

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
    "createProposal": false,
    "writeActions": false
  },
  "metadata": {
    "enabled": true,
    "ipfsGatewayUrl": "https://ipfs.io/ipfs/",
    "timeoutMs": 1500
  },
  "wallet": {
    "reownProjectId": ""
  }
}
```

If your deployed addresses differ, update `app-core/public/isonia.config.json` before starting Vite.

## 7. Start app-core

Open terminal D:

```powershell
cd C:\Users\yuryc\Code\isoniaos\app-core
corepack pnpm dev
```

The app should be available at:

```txt
http://localhost:5173
```

## 8. Verify the UI Routes

Open:

```txt
http://localhost:5173/orgs
```

Expected result:

- The organizations list renders.
- `simple-dao-plus` and `bicameral-preview` are visible.
- Organization rows include status, admin, chain ID, and data status from control-plane.

Then open a proposal detail route. For a fresh seed, use:

```txt
http://localhost:5173/orgs/1/proposals/1
```

Expected result:

- The proposal details screen renders.
- It shows the proposal ID, proposal type, status, target, creator, policy version, and data hash.
- It shows the route explanation panel with required approvals, veto bodies, timelock state, executable state, and blocked reasons.

If your seed output used different IDs, substitute the reported values:

```txt
http://localhost:5173/orgs/<orgId>/proposals/<proposalId>
```

## Troubleshooting

### Empty Data in app-core

Check the API directly first:

```powershell
Invoke-RestMethod http://localhost:3000/v1/orgs | ConvertTo-Json -Depth 8
```

If the API is empty:

- Confirm the seed command ran after contract deployment.
- Confirm `GOV_CORE_ADDRESS` and `GOV_PROPOSALS_ADDRESS` in control-plane match the deployed addresses.
- Confirm `START_BLOCK=0` for the first local indexing pass.
- Run `corepack pnpm indexer:once`, then `corepack pnpm worker:projections`.
- If the Hardhat node was restarted, run `corepack pnpm db:reset`, then index and project again.

Common mistake: running `seed:local` without all three seed environment variables set. In that mode, the seed script deploys another protocol instance and seeds that instance, while control-plane may still be indexing the Ignition deployment addresses.

### CORS Errors

Browser CORS failures usually mean the app origin is not allowed by control-plane.

Set `CORS_ORIGINS` to include the exact Vite origin you are using:

```powershell
$env:CORS_ORIGINS = "http://localhost:5173,http://127.0.0.1:5173"
```

Then restart `corepack pnpm start:dev`.

If Vite uses another port, add that origin too. Do not include a trailing slash.

### Wrong Chain

All local demo components must agree on chain ID `31337`:

- Hardhat node runs at `http://127.0.0.1:8545`.
- control-plane uses `CHAIN_ID=31337` and `RPC_URL=http://127.0.0.1:8545`.
- app-core uses `chainId: 31337` and `rpcUrl: http://127.0.0.1:8545`.
- The browser wallet, if connected, is connected to the local Hardhat chain.

If `/v1/version` reports a different chain ID than `app-core/public/isonia.config.json`, fix the mismatched config and restart the affected service.

### Wrong Contract Addresses

Use the address mapping from:

```txt
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

Map it exactly:

```txt
IsoniaProtocolV01Module#GovCore      -> GOV_CORE_ADDRESS and contracts.govCoreAddress
IsoniaProtocolV01Module#GovProposals -> GOV_PROPOSALS_ADDRESS and contracts.govProposalsAddress
IsoniaProtocolV01Module#DemoTarget   -> DEMO_TARGET_ADDRESS and contracts.demoTargetAddress
```

If the Hardhat node has been reset but Ignition still has old local deployment state, redeploy and make sure the JSON file, control-plane environment, seed environment, and app-core runtime config all use the same address set.
