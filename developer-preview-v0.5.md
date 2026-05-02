# IsoniaOS v0.5 Developer Preview Runbook

## Purpose

This runbook verifies the v0.5 Developer Preview without frontend, SaaS, AI governance features, production claims, or audit claims.

The target path is:

```txt
Hardhat local chain
  -> evm-contracts deployment
  -> demo governance seed data
  -> control-plane indexing and projections
  -> REST API reads
  -> SDK reads
```

## Compatibility Set

Use repositories from the same finalization set. The package versions in that set are:

```txt
@isonia/evm-contracts   0.5.0-alpha.3
@isonia/types           0.5.0-alpha.3
@isonia/control-plane   0.5.0-alpha.3
@isonia/sdk             0.5.0-alpha.6
```

The SDK and Control Plane both consume shared DTOs from `@isonia/types`. Do not mix a newer Control Plane or SDK with an older `@isonia/types` tag than the one declared in that package's `package.json`.

## Prerequisites

- Node.js with Corepack enabled.
- PostgreSQL running locally.
- A PostgreSQL database named `control-plane`.
- Dependencies installed in `evm-contracts`, `control-plane`, `sdk`, and `types`.

PowerShell examples are used below. On macOS or Linux, replace `$env:NAME = "value"` with `export NAME="value"`.

## 1. Start Local Contracts

Open terminal A:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm install
corepack pnpm hardhat node --hostname 127.0.0.1 --port 8545
```

Keep this terminal running.

Open terminal B:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm deploy:developer-preview
```

Read the deployed addresses from:

```txt
evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json
```

Map them as:

```txt
IsoniaProtocolV01Module#GovCore      -> GOV_CORE_ADDRESS
IsoniaProtocolV01Module#GovProposals -> GOV_PROPOSALS_ADDRESS
IsoniaProtocolV01Module#DemoTarget   -> DEMO_TARGET_ADDRESS
```

## 2. Seed Demo Data

In terminal B, set the actual deployed addresses and seed:

```powershell
$env:GOV_CORE_ADDRESS = "0x..."
$env:GOV_PROPOSALS_ADDRESS = "0x..."
$env:DEMO_TARGET_ADDRESS = "0x..."

corepack pnpm seed:developer-preview
```

On a fresh local chain, the seed prints JSON for:

```txt
simple-dao-plus
bicameral-preview
```

Keep the printed organization and proposal IDs for REST and SDK checks.

## 3. Configure Control Plane

Open terminal C:

```powershell
cd C:\Users\yuryc\Code\isoniaos\control-plane
corepack pnpm install
Copy-Item .env.example .env
```

Edit `.env` and set:

```txt
CHAIN_ID=31337
RPC_URL=http://127.0.0.1:8545
GOV_CORE_ADDRESS=0x...
GOV_PROPOSALS_ADDRESS=0x...
START_BLOCK=0
CONFIRMATIONS=0
BLOCK_RANGE_SIZE=1000
API_PORT=3000
```

Leave `GOV_CORE_ADDRESS` and `GOV_PROPOSALS_ADDRESS` blank until real deployed addresses are available. The zero address is rejected.

## 4. Index and Project

In terminal C:

```powershell
corepack pnpm db:migrate
corepack pnpm db:reset
corepack pnpm indexer:once
corepack pnpm worker:projections
```

Run `indexer:once` and `worker:projections` again after additional local chain transactions.

## 5. Start REST API

In terminal C:

```powershell
corepack pnpm start:dev
```

From another terminal:

```powershell
Invoke-RestMethod http://localhost:3000/v1/health
Invoke-RestMethod http://localhost:3000/v1/version | ConvertTo-Json -Depth 6
Invoke-RestMethod http://localhost:3000/v1/diagnostics | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs/1/policies | ConvertTo-Json -Depth 8
Invoke-RestMethod http://localhost:3000/v1/orgs/1/proposals/1/route | ConvertTo-Json -Depth 8
```

Expected results:

- `/v1/health` returns `status: ok`.
- `/v1/version` reports `service: isonia-control-plane`, version `0.5.0-alpha.3`, chain ID `31337`, and the configured contract addresses.
- `/v1/diagnostics` has no contract-address-missing errors once addresses are set.
- `/v1/orgs` includes the seeded organizations.
- `/v1/orgs/1/policies` returns versioned policy rules.
- `/v1/orgs/1/proposals/1/route` returns policy-versioned route explanation data.

## 6. Use SDK

Open terminal D:

```powershell
cd C:\Users\yuryc\Code\isoniaos\sdk
corepack pnpm install
corepack pnpm build
```

Run a read smoke check against the local Control Plane:

```powershell
node -e "const { createIsoniaControlPlaneClient } = require('./dist/index.js'); const client = createIsoniaControlPlaneClient({ baseUrl: 'http://localhost:3000' }); (async () => { console.log(await client.getHealth()); console.log(await client.getOrganizations()); console.log(await client.policies.list('1')); console.log(await client.getProposalRoute('1', '1')); })().catch((error) => { console.error(error); process.exit(1); });"
```

The SDK should return the same DTO shapes as the REST checks because both depend on `@isonia/types`.

## Verification Commands

Before tagging this preview set, run:

```powershell
cd C:\Users\yuryc\Code\isoniaos\evm-contracts
corepack pnpm test

cd C:\Users\yuryc\Code\isoniaos\types
corepack pnpm typecheck
corepack pnpm build

cd C:\Users\yuryc\Code\isoniaos\control-plane
corepack pnpm test
corepack pnpm build

cd C:\Users\yuryc\Code\isoniaos\sdk
corepack pnpm test
```

## Out of Scope

- No production deployment.
- No frontend acceptance requirement.
- No SaaS features.
- No AI governance features.
- No audit or security assurance claim.
