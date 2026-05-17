# IsoniaOS Product Architecture

**Version:** Draft v0.2
**Status:** Draft
**Project:** IsoniaOS
**Primary product baseline:** v0.8 accountability and integration preview
**Language:** English

---

## 1. Purpose

This document describes the product-first architecture of IsoniaOS as a governance control plane for accountable digital organizations.

IsoniaOS is not primarily a token project. The ISO funding and protocol self-governance layer is documented separately in [ISO Architecture](ISO_ARCHITECTURE.md).

---

## 2. Product Architecture

IsoniaOS combines:

- EVM governance contracts where onchain authority is needed;
- Control Plane indexing, projection, diagnostics, and REST APIs;
- shared TypeScript domain types;
- SDK clients and helpers;
- App Core governance console;
- theme packages;
- external governance integrations;
- optional advisory AI features;
- public governance archive and accountability records.

The product architecture exists to connect decision context, authority, execution, evidence, and memory.

---

## 3. Governance Lifecycle Architecture

The core product lifecycle is:

```text
Idea -> Proposal -> Review -> Decision -> Execution -> Accountability -> Memory
```

IsoniaOS should model:

- proposal draft and metadata;
- proposal type and policy route;
- review and discussion context;
- decision mechanism and result;
- approval, veto, and timelock status;
- execution action and transaction evidence;
- accountability obligations;
- completion, failure, or cancellation state;
- historical memory and related decisions.

Voting is one stage inside this lifecycle. It is not the whole product.

---

## 4. Authority Model

Contracts are authoritative for onchain state they control.

Control Plane, App Core, diagnostics, and AI are explanatory or operational layers unless explicit authority is modeled.

External tools are authoritative only for their own records:

- Snapshot for its offchain vote records;
- Safe for Safe transaction state;
- Tally/Agora/Governor systems for their governance records;
- GitHub for repository and pull request state;
- block explorers as views into chain data;
- Discourse or forums for their discussion records.

IsoniaOS should preserve source labels and trust boundaries across all imported or linked records.

---

## 5. External Integration Architecture

IsoniaOS should integrate with existing DAO tools before trying to replace them.

Relevant integrations include:

- Snapshot proposal links/import previews;
- Safe transaction proof links;
- Tally and Agora proposal links;
- Discourse and forum context links;
- GitHub pull request and commit context;
- block explorer transaction proofs;
- EAS-style attestations;
- ERC-4824-style metadata;
- treasury dashboards and grant systems later.

Integration records should show whether data is linked, imported, synced, verified, stale, missing, or failed.

---

## 6. Accountability and Memory Architecture

The v0.8 accountability baseline focuses on public decision records and proof of execution.

Accountability records may include:

- responsible party;
- due date;
- execution status;
- linked transaction hash;
- external proof;
- manual status update;
- failure or cancellation reason;
- completion confirmation;
- trust boundary and source label.

Manual accountability updates are annotations, not protocol truth. Imported external records are evidence or context unless explicitly modeled as authority for a specific field.

The governance memory layer should preserve proposals, discussions, decisions, execution proofs, rationales, failures, disputes, policy changes, delegate history, and similar historical proposals.

---

## 7. Control Plane Architecture

Control Plane is the indexing, query, diagnostic, and operational backend.

It should provide:

- chain event ingestion;
- raw event storage;
- idempotent processing;
- replayable projections;
- REST API;
- route explanation;
- governance graph generation;
- diagnostics;
- external resource modeling;
- accountability read models.

Control Plane is not the source of governance authority. It explains and projects authority from contracts and explicitly trusted external sources.

---

## 8. App Core Architecture

App Core is the public self-hostable governance console.

It should provide:

- organization dashboard;
- proposal list/detail;
- governance structure views;
- route explanation;
- action and execution status views;
- public governance archive;
- accountability dashboard;
- diagnostics;
- integration evidence views;
- theme adapter.

App Core should not contain SaaS-only billing or private tenant management logic.

---

## 9. AI Advisory Architecture

AI is an interpretability and assistance layer.

Allowed roles include:

- proposal summaries;
- discussion summaries;
- route explanation summaries;
- risk checklists;
- unresolved question detection;
- similar proposal search;
- execution status summaries;
- public objection summaries.

AI must not be the default final authority for proposal validity, voting decisions, execution approval, dispute resolution, or completion confirmation.

---

## 10. ISO Supporting Layer

ISO tokenomics is a supporting funding and protocol self-governance layer for IsoniaOS itself.

It is not required for v0.8 accountability and integration preview. Token launch is not required for product milestones unless explicitly stated in a future roadmap.

The ISO layer is documented in:

- [Tokenomics](TOKENOMICS.md)
- [Governance](GOVERNANCE.md)
- [Identity](IDENTITY.md)
- [Treasury](TREASURY.md)
- [Legal Roadmap](LEGAL_ROADMAP.md)
- [Risk Register](RISK_REGISTER.md)
- [Decision Log](DECISION_LOG.md)
- [ISO Architecture](ISO_ARCHITECTURE.md)

Key constraints:

- no revenue-sharing rights exist at launch;
- Curve Reserve is not treasury;
- launch reserve and redemption asset is native USDC only;
- ETH does not back ISO redemptions at launch;
- governance power requires verified identity and activation/staking.

---

## 11. Non-Goals

The product architecture does not require:

- token launch for v0.8;
- production SaaS billing;
- full Safe/Snapshot/Tally/Agora integration at v0.8;
- NFT voting runtime;
- production-grade indexer;
- binding AI governance;
- production audit readiness;
- custom domains;
- full IPFS upload service.

---

## 12. Related Documents

- [Whitepaper](WHITEPAPER.md)
- [Roadmap](ROADMAP.md)
- [v0.8 Accountability and Integration Preview](v0.8/accountability-and-integration-preview.md)
- [Trust and Security](strategy/TRUST-AND-SECURITY.md)
- [AI Policy](strategy/AI-POLICY.md)
- [ISO Architecture](ISO_ARCHITECTURE.md)
