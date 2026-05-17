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
- integration-lab validation harnesses kept outside core product code;
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

### 5.1 Provider Adapter Boundary

Control Plane should use generic evidence, proof, and action metadata models with provider adapters at the edge.

Core route explanation and proposal/accountability logic should not hardcode customer-specific or demo-specific target contracts.

Provider adapters may handle:

- URL parsing;
- external ID extraction;
- metadata fetch;
- status normalization;
- verification checks where available;
- stale, failed, missing, unsupported, and unknown states;
- provider-specific rate-limit and credential behavior.

The core domain should continue to expose source labels, authority claims, verification status, and last-sync metadata. A provider adapter must not silently turn linked context into governance authority.

### 5.2 Integration Lab Boundary

Real-world provider validation should live in an `integration-lab/` repository or workspace area, not in audited/product core.

The integration lab may contain:

- Sepolia deployment manifests;
- Snapshot testnet space workflows;
- Safe Sepolia transaction proof workflows;
- Tally/OpenZeppelin Governor compatibility experiments;
- Agora research and linking notes;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation-ready QA scenarios;
- field notes and issue logs.

The integration lab validates provider assumptions and public testnet workflows. It should not define core governance authority, Control Plane internals, or App Core product behavior.

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

### 8.1 Template Architecture

Organization and governance templates should be versioned configuration blueprints. They help create structures, proposal types, policy routes, evidence expectations, action metadata, and integration/source defaults.

Templates are not governance authority by themselves.

Template families may include:

- organization templates;
- proposal type templates;
- policy route templates;
- accountability requirement templates;
- external evidence requirement templates;
- action metadata templates;
- integration/source templates.

Guardrails:

- templates cannot silently grant roles, permissions, execution rights, or veto rights;
- authority-changing output must go through explicit setup, review, or governed activation;
- templates should be exportable/importable as data;
- custom or risky templates should display warnings;
- SaaS may later support private/team templates;
- templates must not allow arbitrary code execution in core.

### 8.2 SaaS and Hosted Environment Boundary

Managed SaaS is a deployment and operations layer over the product architecture. It should not become the source of governance authority.

Before public beta readiness can be claimed, the product architecture should support a documented hosted baseline:

- hosted Control Plane and App Core deployment path;
- managed Postgres/indexer infrastructure direction;
- dev and stage environment separation, with production later;
- tenant and organization provisioning plan;
- integration credential management direction;
- monitoring, logging, backups, and restore expectations;
- custom domain direction without claiming completion.

Public App Core remains self-hostable. SaaS-only billing, private tenant administration, and operator workflows belong outside public App Core.

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
- arbitrary code execution through templates.

---

## 12. Related Documents

- [Whitepaper](WHITEPAPER.md)
- [Roadmap](ROADMAP.md)
- [v0.8 Accountability and Integration Preview](v0.8/accountability-and-integration-preview.md)
- [v0.8 Integration Lab and Public Beta Replan](v0.8/integration-lab-and-public-beta-replan.md)
- [Trust and Security](strategy/TRUST-AND-SECURITY.md)
- [AI Policy](strategy/AI-POLICY.md)
- [ISO Architecture](ISO_ARCHITECTURE.md)
