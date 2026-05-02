# IsoniaOS v0.1.0-alpha Known Limitations

Status: Alpha closure  
Date: 2026-04-29  
Scope: Current local prototype repositories and v0.1 documentation

## Safety Notice

IsoniaOS v0.1.0-alpha is not audited and is not production ready.

Do not use this release with real assets, mainnet authority, production organizations, or high-stakes governance decisions.

## Security and Production Readiness

- No external smart contract audit has been completed.
- No formal verification has been completed.
- No bug bounty program is attached to this alpha.
- No production incident response, key management, or operational runbook is included.
- No production deployment hardening has been completed for contracts, Control Plane, App Core, or SaaS.
- Local demo keys and Hardhat accounts must never be treated as secure accounts.

## Protocol Limitations

- The protocol is a prototype and is not production ready.
- Execution is restricted to the configured `DemoTarget`; arbitrary production execution is intentionally not supported.
- Safe, Tally, Hats, Snapshot, and other external governance integrations are not implemented.
- Token voting, quadratic voting, reputation scoring, and anti-Sybil/personhood systems are not implemented.
- Upgradeable proxies are not implemented.
- Mainnet deployment is not supported by these closure docs.
- Multi-chain production deployment is not implemented.
- Organization admin authority is still a simple v0.1 model, not a complete constitutional authority system.
- Metadata is referenced by URI/hash and is not stored as rich on-chain data.
- The protocol is not gas-optimized for large production organizations.
- The seed topologies are demo data, not recommended real governance templates.

## Control Plane Limitations

- Control Plane is not the source of governance authority; it only indexes and explains contract state.
- The current alpha is oriented around configured GovCore/GovProposals contract addresses, not a production registry of many protocol deployments.
- Ingestion uses polling with `getLogs`; WebSocket acceleration is not part of the alpha baseline.
- The local demo commonly uses `CONFIRMATIONS=0`, which is not appropriate for production chains.
- `blockHash` is stored for reorg detection, and projections are rebuildable, but production-grade automated reorg recovery is not complete.
- The rebuild path exists, but partial replay/admin tooling is not a complete production operations surface.
- Rate limiting, API keys, billing, tenant admin, and public SaaS operations are not implemented as production systems.
- GraphQL is intentionally not implemented.
- Webhooks and streaming APIs are not implemented.
- Control Plane does not replace on-chain checks; frontend or API route availability must not be treated as authority.

## REST and DTO Limitations

- v0.1 exposes REST only.
- API responses are read-model projections and can lag chain state until events are indexed and projected.
- Big integer and blockchain numeric values are represented as strings where required by shared DTOs.
- Public write APIs for governance actions are not part of Control Plane v0.1; writes go through wallet transactions against contracts.
- Route explanation depends on projected policy snapshots. If the matching policy version is missing, the route must report `policy_snapshot_missing` instead of falling back to the latest policy.

## SDK Limitations

- `@isonia/sdk` currently provides Control Plane REST client helpers and path helpers.
- The alpha SDK does not yet include viem-based protocol clients.
- The alpha SDK does not include transaction builders for arbitrary governance actions.
- The alpha SDK must not be treated as a governance authority layer.

## App Core Limitations

- App Core is a React + Vite SPA prototype, not a finished production console.
- App Core reads from Control Plane and can lag until indexer/projection scripts run.
- Write controls are gated by runtime config and wallet state, but contracts remain the final authority.
- Proposal execution UI is limited to the configured `DemoTarget.setNumber(orgId, newNumber)` path.
- App Core does not include an arbitrary calldata builder.
- App Core does not include full organization administration or governance topology editing screens.
- App Core does not include SaaS billing, tenant administration, premium analytics, or operator dashboards.
- The graph page is a v0.1 data view, not a full production graph exploration product.
- Metadata resolution is best-effort and optional. Failures fall back to deterministic labels.
- IPFS support is gateway-based URI resolution only; App Core does not publish metadata to IPFS.
- Reown AppKit is optional wallet UX. If `wallet.reownProjectId` is empty or Reown initialization fails, App Core uses injected wallet fallback.
- Browser wallet behavior depends on the user's wallet, local chain configuration, and selected account authority.
- Responsive basics exist, but full production mobile UX has not been completed.

## Theme Limitations

- `@isonia/theme-default` is a default theme package with CSS variables, tokens, brand metadata, and a placeholder logo.
- No theme marketplace exists.
- No visual theme editor exists.
- Runtime remote theme compilation/loading is not implemented.

## SaaS and Web Limitations

- `saas` is only a placeholder boundary in the current workspace.
- Billing, subscriptions, tenant administration, public API key management, and hosted operator dashboards are not implemented.
- `web` is only a placeholder boundary in the current workspace.
- The public `isonia.org` marketing/documentation website is not implemented in this alpha.

## Documentation Limitations

- Some v0.1 specs describe intended architecture and acceptance criteria, while this closure document describes the alpha scope.
- If a spec and current implementation appear to differ, treat the closure docs and release checklist as the alpha boundary, then update the relevant spec before expanding scope.
- These docs do not replace an audit, threat model, production readiness review, or legal/compliance review.

## Explicit Non-Production Boundary

v0.1.0-alpha is suitable for:

- local demos;
- architecture review;
- typed interface validation;
- protocol/control-plane/app-core alignment;
- early contributor onboarding.

v0.1.0-alpha is not suitable for:

- real treasury management;
- mainnet deployment;
- live organizational authority;
- regulated governance workflows;
- customer-facing SaaS production use.
