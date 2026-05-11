# IsoniaOS v0.6 Design Partner Demo Script

## Demo Purpose

Show a design partner that IsoniaOS makes governance legible as a lifecycle: setup, proposal creation, route explanation, approval, veto or no-veto, timelock, execution, result, and memory.

This is a local v0.6 alpha demo. It should be presented as product validation and local self-hosted readiness, not as production treasury control.

## What This Demo Proves

- A local operator can run the public IsoniaOS stack.
- App Core can create or use a Simple DAO+ organization.
- Governance bodies, roles, policy routes, and proposal state are visible.
- Proposal actions are shown as a lifecycle, not only as a vote.
- Control Plane can index and project contract events into read models.
- Diagnostics can distinguish chain, API, indexer, projection, config, and wallet issues.
- DemoTarget execution can be verified after proposal execution.

## What This Demo Does Not Prove

- Production readiness.
- Smart contract audit readiness.
- Hosted SaaS readiness.
- Billing, tenant management, or platform admin workflows.
- Safe integration.
- Delegation or token-weighted voting.
- AI-assisted governance.
- Multi-chain production indexing.
- Arbitrary calldata authoring or production execution automation.

## Pre-Demo Checklist

- Required repositories are cloned and on the versions listed in [Compatibility Matrix](compatibility-matrix.md).
- Local Hardhat node is running on `http://127.0.0.1:8545`.
- Browser wallet is connected to chain ID `31337`.
- Demo wallet accounts are funded on the local chain.
- Contracts are deployed locally.
- `control-plane/.env` uses the deployed GovCore and GovProposals addresses.
- Local PostgreSQL is running and migrations have been applied.
- Control Plane API, indexer, and projection worker are running.
- `app-core/public/isonia.config.local.json` uses the same contract addresses and includes DemoTarget.
- App Core is running at `http://localhost:5173`.
- `/diagnostics` is green enough for the demo.
- The operator has decided whether to create Simple DAO+ live or use a preseeded demo fixture.
- The proposal lifecycle path has been smoke-tested once before the partner call.

## Demo Flow

### 1. Open App Core

Open:

```text
http://localhost:5173
```

Say that this is the public self-hostable App Core running against a local chain and local Control Plane.

### 2. Open Diagnostics

Open:

```text
http://localhost:5173/diagnostics
```

Confirm:

- API status.
- Configured chain.
- Latest and safe block if available.
- GovCore, GovProposals, and DemoTarget addresses.
- Indexer status.
- Projection status and backlog.
- Connected wallet and wallet chain.
- Runtime config feature gates for setup and proposal actions.

Explain that diagnostics are part of the trust model because read models can lag behind chain state.

### 3. Create Simple DAO+ Organization Through Setup Wizard

Open:

```text
http://localhost:5173/orgs/new
```

Walk through the Simple DAO+ setup wizard:

- organization identity;
- admin address;
- General Council;
- Treasury Committee;
- Security Council;
- holder addresses;
- policy routes;
- review screen.

Explain that the setup draft is not authority. Authority is created only by explicit contract transactions.

### 4. Execute Setup Actions One By One

Submit setup transactions one at a time.

Call out each lifecycle stage:

- wallet signing;
- submitted;
- mined;
- indexed;
- projected;
- completed.

If an action is mined but the app is waiting for read-model state, open diagnostics instead of saying the transaction failed.

### 5. Confirm Setup Completion

Show the setup completion state and then open the organization overview or governance page.

Confirm that the created bodies, roles, mandates, and policy routes are visible.

### 6. Create DemoTarget Proposal

Open the proposal creation page for the organization:

```text
/orgs/<orgId>/proposals/new
```

Create a DemoTarget proposal using the configured DemoTarget action. Keep the scenario simple: the proposal changes the DemoTarget value for the organization.

Do not show or imply an arbitrary calldata builder.

### 7. Open Proposal Details

Open:

```text
/orgs/<orgId>/proposals/<proposalId>
```

Show:

- proposal ID;
- organization ID;
- proposal type;
- creator;
- target;
- value;
- data hash;
- status;
- metadata fallback label if applicable.

### 8. Explain Route

Use the route explanation to show:

- required approval bodies;
- collected approvals;
- pending approvals;
- veto-capable bodies;
- veto state;
- executor body;
- timelock state;
- whether execution is available;
- next blocker.

Talking point:

```text
Governance should be understandable before anyone clicks an action button.
```

### 9. Approve Required Bodies

Use the appropriate wallet or holder account to approve as required by the route.

After each approval:

- wait for the transaction receipt;
- wait for indexer/projection update;
- show route explanation updating collected and pending approvals.

### 10. Optional Veto Path

Show veto only if the demo variant is safe and resettable.

If veto is shown, explain that veto is a route-level governance constraint, not a UI override. After showing it, reset the local chain or use a separate proposal so the main execution path can still complete.

### 11. Queue When Timelock Applies

When approvals are complete, queue the proposal if the route requires a timelock.

Show that the proposal is approved but not immediately executable until the timelock condition is satisfied.

### 12. Use Local Hardhat Time Controls Only On Chain ID 31337

If App Core shows time controls, use them only on chain ID `31337`.

If controls are hidden, explain that local time controls are intentionally local-only.

Do not use local Hardhat controls as evidence of production behavior.

### 13. Execute Proposal

Execute the proposal when the route says it is executable.

After execution:

- wait for the transaction receipt;
- wait for Control Plane indexing and projections;
- refresh proposal details if needed.

### 14. Show DemoTarget Result

Show the DemoTarget result panel or equivalent state proving the demo action executed.

Explain that the UI verifies the narrow configured DemoTarget action path for this demo and does not provide arbitrary calldata construction.

### 15. Show Governance Memory, Proposal Archive, And Diagnostics

Close by showing:

- proposal final status;
- proposal archive/list;
- organization governance view;
- diagnostics after execution.

Point out that the record remains inspectable after execution.

## Common Demo Talking Points

- Governance is a lifecycle, not a vote.
- IsoniaOS orchestrates the existing governance stack instead of replacing every tool.
- Contracts remain authoritative for onchain state.
- Control Plane indexes events, runs projections, and serves read models.
- UI buttons are hints, not authority.
- Indexing and projection delays are expected failure modes and must be visible.
- Local Hardhat tools are local-only.
- v0.6 has no arbitrary calldata builder.
- v0.6 does not include Safe integration, delegation, token-weighted voting, AI, SaaS billing, or production deployment.

## Demo Failure Recovery

### Wallet Wrong Chain

Symptoms:

- write actions disabled or failing;
- wallet chain differs from App Core configured chain;
- local time controls hidden.

Recovery:

- switch wallet to chain ID `31337`;
- confirm RPC URL is `http://127.0.0.1:8545`;
- reload `/diagnostics`.

### Account Not Funded

Symptoms:

- transaction fails for insufficient funds;
- wallet can connect but cannot submit local transactions.

Recovery:

- import or fund a Hardhat account;
- use Hardhat local balance tooling only on chain ID `31337`;
- retry the transaction after balance is visible.

### Transaction Mined But Not Indexed

Symptoms:

- wallet shows success;
- proposal or setup state does not update;
- diagnostics show stale indexer or old last indexed block.

Recovery:

- open App Core `/diagnostics`;
- open Control Plane `/v1/diagnostics`;
- open Control Plane `/v1/diagnostics/indexer`;
- confirm the indexer process is running;
- confirm `START_BLOCK` and contract addresses include the transaction block;
- restart Control Plane workers if needed.

### Stale Contract Addresses

Symptoms:

- diagnostics contract addresses differ from App Core runtime config;
- read models are empty after a redeploy;
- transactions target old addresses.

Recovery:

- reread `evm-contracts/ignition/deployments/chain-31337/deployed_addresses.json`;
- update `control-plane/.env`;
- update `app-core/public/isonia.config.local.json`;
- restart Control Plane and App Core;
- reload diagnostics.

### Local Hardhat Restarted

Symptoms:

- wallet has old nonce or network state;
- contract calls fail;
- old read models no longer match the running chain.

Recovery:

- redeploy contracts;
- update Control Plane and App Core config;
- reset or recreate local database if the old read model conflicts with the new chain;
- rerun setup or seed.

### Proposal Action Hash Mismatch

Symptoms:

- execute button is blocked;
- DemoTarget action verification reports a mismatch.

Recovery:

- confirm `demoTargetAddress` in runtime config matches the deployed DemoTarget;
- confirm the proposal was created through the DemoTarget demo path;
- do not bypass the hash check for the demo;
- create a fresh proposal after fixing config if needed.

### Control Plane Not Running

Symptoms:

- `/diagnostics` shows API unreachable;
- `/v1/diagnostics` does not respond;
- App Core lists stale or no organizations.

Recovery:

- start PostgreSQL;
- run migrations if needed;
- start `corepack pnpm dev` in `control-plane`;
- confirm `API_PORT` and `CORS_ORIGINS`;
- reload App Core.
