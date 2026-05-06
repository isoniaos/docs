# IsoniaOS v0.6 Local Troubleshooting

## Purpose

This guide covers common local failures while running the v0.6 alpha demo stack.

Use it with:

- [Quickstart Local](quickstart-local.md)
- [Design Partner Demo Script](design-partner-demo-script.md)
- App Core `/diagnostics`
- Control Plane `/v1/diagnostics`
- Control Plane `/v1/diagnostics/indexer`

## Diagnostics Routes

App Core:

```text
http://localhost:5173/diagnostics
```

Control Plane:

```text
http://localhost:3000/v1/diagnostics
http://localhost:3000/v1/diagnostics/indexer
```

Use diagnostics before retrying a transaction. A mined transaction followed by stale UI state is often an indexing, projection, or config issue rather than a chain failure.

## Wallet Connected To Wrong Chain

Symptoms:

- App Core shows wallet chain mismatch.
- Write actions are disabled or fail.
- Local Hardhat time controls are hidden.
- Transactions are sent to an unexpected network.

Checks:

- App Core configured chain is `31337`.
- Wallet chain is `31337`.
- Wallet RPC URL points at `http://127.0.0.1:8545`.

Recovery:

- Switch the wallet to Hardhat Local.
- Add chain ID `31337` manually if needed.
- Reload `/diagnostics`.

## Browser Wallet Account Not Funded

Symptoms:

- Wallet connects but transaction submission fails.
- Error mentions insufficient funds or gas.

Checks:

- The selected wallet account has a balance on the local Hardhat chain.
- The account is not only funded on another network.

Recovery:

- Import one of the Hardhat development accounts into the wallet, or fund the selected wallet account from a Hardhat account.
- Use local Hardhat balance tooling only against chain ID `31337`.

## Stale Runtime Contract Addresses

Symptoms:

- App Core loads but organizations or proposals are empty.
- Contract calls fail.
- Diagnostics show contract address mismatch between frontend and backend.
- Transactions target old local addresses.

Cause:

Hardhat redeploys can produce addresses that differ from the addresses in App Core runtime config or Control Plane `.env`.

Recovery:

- Read `evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json`.
- Update `control-plane/.env`.
- Update `app-core/public/isonia.config.local.json`.
- Restart Control Plane and App Core.
- Reload `/diagnostics`.

## Control Plane API Unreachable

Symptoms:

- App Core `/diagnostics` reports API unreachable.
- `http://localhost:3000/v1/diagnostics` does not respond.
- Browser console shows network or CORS errors.

Checks:

- PostgreSQL is running.
- `.env` exists in `control-plane`.
- `API_PORT=3000` or App Core `apiBaseUrl` matches the actual port.
- `CORS_ORIGINS` includes `http://localhost:5173` and `http://127.0.0.1:5173`.

Recovery:

- Start PostgreSQL.
- Run `corepack pnpm db:migrate`.
- Start `corepack pnpm dev` in `control-plane`.
- Reload App Core diagnostics.

## Indexer Stale

Symptoms:

- Transactions are mined but not reflected in raw event counts.
- `/v1/diagnostics/indexer` shows stale or unknown indexer heartbeat.
- Last indexed block is behind latest safe block.

Checks:

- `RPC_URL` points at the running Hardhat node.
- `CHAIN_ID=31337`.
- Contract addresses in `.env` are current.
- `START_BLOCK` is before the deployment block.
- The indexer process is running.

Recovery:

- Restart `corepack pnpm dev` or the indexer worker.
- Confirm the chain did not restart without updating local config.
- If the local chain was reset, redeploy and update config.

## Projection Backlog

Symptoms:

- Raw events exist but read models lag.
- `/diagnostics` shows projection backlog greater than zero.
- Proposal route is missing or stale even though events were indexed.

Checks:

- Projection worker is running.
- `failedProjectionCount` is zero.
- Latest projection error is empty or understood.

Recovery:

- Wait briefly if the backlog is draining.
- Restart the projection worker if heartbeat is stale.
- Use the repository README/manual commands for retrying failed projections if failures remain.
- Rebuild projections only for local recovery when the current demo state can be recreated.

## Transaction Mined But Read Model Not Updated

Symptoms:

- Wallet shows transaction success.
- Explorer or receipt confirms mined block.
- App Core still shows old setup/proposal state.

Checks:

- Latest indexed block is at or beyond the receipt block.
- Projection backlog is zero.
- Contract addresses match the transaction target.
- The event is one that Control Plane decodes.

Recovery:

- Open App Core `/diagnostics`.
- Open `/v1/diagnostics` and `/v1/diagnostics/indexer`.
- Wait if the indexer/projection worker is behind.
- Restart workers if heartbeat is stale.
- Do not resubmit the transaction unless diagnostics show it was never submitted or mined.

## Proposal Route Unavailable

Symptoms:

- Proposal details load but route explanation is missing.
- Route says policy snapshot is missing.
- Approval/queue/execute hints are unavailable.

Checks:

- Proposal was created after the relevant policy rule existed.
- Proposal `policyVersion` has been indexed and projected.
- Projection backlog is zero.
- Control Plane has policy-rule read models for the organization.

Recovery:

- Wait for projections if backlog exists.
- Confirm setup actions completed and projected.
- Recreate the proposal after fixing setup/config if it was created against incomplete local state.

## DemoTarget Hash Mismatch

Symptoms:

- Execute action is blocked.
- App Core reports DemoTarget action verification failed.
- Proposal target or data hash does not match expected DemoTarget action.

Checks:

- `contracts.demoTargetAddress` matches the deployed DemoTarget.
- The proposal was created through the DemoTarget demo flow.
- The organization ID and demo number match the intended proposal action.

Recovery:

- Fix runtime config.
- Create a new DemoTarget proposal.
- Do not bypass the hash check for the v0.6 demo.

## Local Hardhat Time Controls Hidden

Symptoms:

- Proposal has a timelock but local time controls do not appear.

Checks:

- App Core configured chain ID is `31337`.
- Wallet chain is `31337`.
- Runtime config was reloaded after edits.

Recovery:

- Switch wallet to chain ID `31337`.
- Fix runtime config if it points at a non-local chain.
- Reload App Core.

Local time controls are intentionally hidden outside local Hardhat.

## Local PostgreSQL Connection Issues

Symptoms:

- `db:migrate` fails.
- Control Plane exits at startup.
- Errors mention connection refused, database missing, role missing, or authentication failure.

Checks:

- PostgreSQL service is running.
- Database name matches `PG_DATABASE` or `DATABASE_URL`.
- User and password match local PostgreSQL.
- Port matches `PG_PORT`.

Recovery:

- Create the local database if it does not exist.
- Update `.env` to match local credentials.
- Prefer `DATABASE_URL` if individual `PG_*` values are confusing.
- Rerun `corepack pnpm db:migrate`.

## pnpm GitHub Dependency Refs Or Tags Not Resolving

Symptoms:

- `corepack pnpm install` fails while fetching `github:isoniaos/...#v...`.
- Error says revision or tag was not found.

Checks:

- The tag exists in the referenced public repository.
- The dependency ref includes the leading `v`.
- The package version itself does not include the leading `v`.
- Network access to GitHub is available.

Recovery:

- Run `git fetch --tags origin` in the referenced repository if checking locally.
- Confirm the ref in `package.json` matches [Compatibility Matrix](compatibility-matrix.md).
- Retry install after correcting the ref or checking out the intended tag.

## CRLF/LF Warnings During Git Work

Symptoms:

- Git prints warnings such as `LF will be replaced by CRLF`.

Meaning:

This is a line-ending normalization warning from local Git settings. It does not usually mean the docs or code failed.

Recovery:

- Avoid touching unrelated files.
- Do not normalize large file sets as part of a docs-only task.
- If a file must be edited, let the repository settings and review diff show the actual changed content.
- Run `git diff --check` before handing off.
