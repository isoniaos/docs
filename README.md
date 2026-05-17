# IsoniaOS Documentation

This repository contains the active IsoniaOS public documentation, strategy documents, and archived historical material.

## Active Documentation Baseline

The active public design baseline is **Draft v0.2** for ISO tokenomics, identity-aware governance, treasury separation, legal phasing, and reserve asset policy.

IsoniaOS is a governance architecture layer for accountable digital organizations. It is designed to make authority visible, scoped, delegated, constrained, auditable, and eventually recallable.

Core thesis:

```text
Governance is not a vote. Governance is a lifecycle.
```

Core architecture principle:

```text
Authority on-chain.
Intelligence off-chain.
Verification public.
```

The v0.2 design keeps the launch token architecture conservative:

- token name: Isonia;
- token symbol: ISO;
- standard ERC-20;
- no fee-on-transfer;
- no transfer tax;
- native USDC-only launch bonding curve settlement and redemption;
- Curve Reserve is not treasury or operational runway;
- ETH is not the launch redemption asset and does not back ISO redemptions at launch;
- ETH may be used for grants, donations, non-reserve treasury allocation, and future adapter research;
- verified identity and activation/staking are required for governance power;
- no revenue-sharing rights exist at launch.

## Active Documentation

### v0.2 design baseline

- [Whitepaper](WHITEPAPER.md)
- [Roadmap](ROADMAP.md)
- [Tokenomics](TOKENOMICS.md)
- [Governance](GOVERNANCE.md)
- [Identity](IDENTITY.md)
- [Treasury](TREASURY.md)
- [Legal Roadmap](LEGAL_ROADMAP.md)
- [Risk Register](RISK_REGISTER.md)
- [Decision Log](DECISION_LOG.md)
- [Architecture](ARCHITECTURE.md)

### Product and strategy

- [Market Entry Strategy](strategy/MARKET-ENTRY.md)
- [Competitive Landscape](strategy/COMPETITIVE-LANDSCAPE.md)
- [Integration Strategy](strategy/INTEGRATION-STRATEGY.md)
- [Accountability Model](strategy/ACCOUNTABILITY-MODEL.md)
- [Trust and Security](strategy/TRUST-AND-SECURITY.md)
- [AI Policy](strategy/AI-POLICY.md)
- [SaaS and Open-Core Model](strategy/SAAS-AND-OPEN-CORE.md)
- [Tenant and Domain Model](strategy/TENANT-AND-DOMAIN-MODEL.md)
- [Storage and IPFS Model](strategy/STORAGE-AND-IPFS-MODEL.md)
- [Narrative and Messaging](strategy/NARRATIVE-AND-MESSAGING.md)

### v0.8 accountability and integration preview

- [v0.8 Documentation Index](v0.8/README.md)
- [Accountability and Integration Preview](v0.8/accountability-and-integration-preview.md)
- [Testing and Demo Strategy](v0.8/testing-and-demo-strategy.md)
- [Demo Organization and Governance Process](v0.8/demo-organization-and-governance-process.md)
- [Backlog and Implementation Sequence](v0.8/backlog-and-implementation-sequence.md)

### v0.7 archived protocol foundation

- [v0.7 Documentation Index](v0.7/README.md)
- [Archived v0.7 Roadmap](archive/v0.7/roadmap.md)
- [Archived v0.7 Protocol Roadmap](archive/v0.7/protocol-roadmap.md)
- [Bootstrap Finalization and Admin Handoff](archive/v0.7/bootstrap-finalization.md)
- [Typed Admin Batch Activation](archive/v0.7/admin-batch-activation.md)
- [Proposal Action Builder](archive/v0.7/proposal-action-builder.md)
- [Storage and Metadata](archive/v0.7/storage-and-metadata.md)
- [Archived Control Plane v0.7 Roadmap](archive/v0.7/control-plane-roadmap.md)
- [Archived App Core v0.7 Roadmap](archive/v0.7/app-core-roadmap.md)
- [Archived v0.7 Compatibility Matrix](archive/v0.7/compatibility-matrix.md)
- [Archived v0.7 Design Partner Demo Plan](archive/v0.7/design-partner-demo-plan.md)
- [Archived v0.7 Design Partner Preview Pack](archive/v0.7/design-partner-preview-pack.md)

### Development process

- [Development Process](DEVELOPMENT-PROCESS.md)
- [Agent Rules](AGENTS.md)
- [Versioning Rules](VERSIONING.md)
- [Documentation Changelog](CHANGELOG.md)

## Archived Documentation

- v0.7 Protocol Hardening Alpha documents are archived under `archive/v0.7/`.
- v0.6 Governance Console Alpha documents are archived under `archive/v0.6/`.
- v0.5 Developer Preview documents are archived under `archive/v0.5/`.
- The v0.5 known-good tag set is recorded in [archive/v0.5/compatibility-matrix.md](archive/v0.5/compatibility-matrix.md).
- Historical v0.1 documents are archived under `archive/v0.1/`.

Archived v0.1, v0.5, v0.6, and v0.7 documents are historical references and are not part of the active v0.2 tokenomics/governance design surface.

## Public Repository Note

Some strategy documents are intentionally public because IsoniaOS is infrastructure that needs trust. Keep sensitive partner details, pricing negotiations, private pipeline notes, and internal fundraising material out of this repository unless the team explicitly decides otherwise.
