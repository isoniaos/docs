# IsoniaOS v0.6 Demo Readiness Checklist

Use this checklist before running the local design partner demo.

## Repository State

- [ ] `docs` cloned.
- [ ] `types` cloned.
- [ ] `sdk` cloned.
- [ ] `evm-contracts` cloned.
- [ ] `control-plane` cloned.
- [ ] `theme-default` cloned.
- [ ] `app-core` cloned.
- [ ] Versions/tags checked against [Compatibility Matrix](compatibility-matrix.md).
- [ ] No demo depends on an uncommitted package version.

## Chain And Contracts

- [ ] Local Hardhat node running on `http://127.0.0.1:8545`.
- [ ] Wallet connected to chain ID `31337`.
- [ ] Demo wallet account funded.
- [ ] Contracts deployed locally.
- [ ] GovCore address recorded.
- [ ] GovProposals address recorded.
- [ ] DemoTarget address recorded.

## Control Plane

- [ ] `control-plane/.env` created from `.env.example`.
- [ ] PostgreSQL running.
- [ ] Database credentials verified.
- [ ] Contract addresses copied into `.env`.
- [ ] Migrations applied.
- [ ] API running.
- [ ] Indexer running.
- [ ] Projection worker running.
- [ ] `/v1/diagnostics` reachable.
- [ ] `/v1/diagnostics/indexer` reachable.

## App Core

- [ ] `app-core/public/isonia.config.local.json` created.
- [ ] `apiBaseUrl` points at local Control Plane.
- [ ] Runtime chain ID is `31337`.
- [ ] Runtime GovCore address matches Control Plane.
- [ ] Runtime GovProposals address matches Control Plane.
- [ ] Runtime DemoTarget address matches deployment.
- [ ] `features.writeActions` enabled for demo.
- [ ] `features.createProposal` enabled for demo.
- [ ] `features.manageOrg` enabled for setup demo.
- [ ] App Core running at `http://localhost:5173`.

## Diagnostics

- [ ] App Core `/diagnostics` opens.
- [ ] API reachable.
- [ ] Wallet chain matches configured chain.
- [ ] Contract addresses match.
- [ ] Indexer not stale.
- [ ] Projection backlog is zero or draining.
- [ ] No unexpected failed projections.

## Demo Flow

- [ ] Simple DAO+ setup wizard completed or preseeded fixture confirmed.
- [ ] Setup completion visible.
- [ ] Governance bodies visible.
- [ ] Proposal lifecycle smoke-tested.
- [ ] DemoTarget proposal created.
- [ ] Route explanation visible.
- [ ] Required approvals completed.
- [ ] Queue/timelock path completed if applicable.
- [ ] Local time controls used only on chain ID `31337`.
- [ ] Proposal executed.
- [ ] DemoTarget result visible.
- [ ] Proposal archive or final proposal state visible.
- [ ] Diagnostics checked after execution.
