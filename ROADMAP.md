# IsoniaOS Roadmap

**Document version:** 1.1  
**Project:** IsoniaOS  
**Working product title:** IsoniaOS — A Governance Control Plane for Accountable Digital Organizations  
**Status:** Draft  
**Active target:** v0.6 alpha  
**Primary market:** DAO and Web3 governance  
**Language:** English

---

## Roadmap Philosophy

IsoniaOS should evolve from a focused local governance console into a DAO governance control plane, then into a modular governance operating system for accountable digital organizations.

The roadmap follows several principles:

- start with the essential governance lifecycle;
- prove value in DAO and Web3 governance before expanding beyond blockchain-native organizations;
- integrate with existing governance tools instead of replacing them by default;
- make execution tracking and accountability central early, not late;
- keep the open-source core trustworthy and usable without AI;
- use SaaS to provide convenience, hosting, integrations, analytics, and optional AI-assisted governance;
- introduce advanced governance capabilities gradually;
- treat AI as an assistance layer by default, not as a source of authority.

The long-term goal is governance that is structured, transparent, verifiable, accountable, and understandable.

---

## Version Strategy

- **v0.6** — usable governance console alpha.
- **v0.7** — integration preview.
- **v0.8** — public governance archive and accountability dashboard.
- **v0.9** — optional AI governance digest preview.
- **v1.0** — design partner release.
- **v1.x** — modular governance expansion.
- **v2.x** — accountability, dispute intelligence, and advanced governance workflows.
- **v3.x+** — ecosystem, plugin marketplace, optional arbitration, enterprise, institutional, and civic pilots.

For packages, APIs, SDKs, and contracts, use SemVer:

```text
MAJOR.MINOR.PATCH[-PRERELEASE]
```

Git tags use the same version with a leading `v`, for example `v0.6.0-alpha.1`.

---

# Phase 0 — Strategic Foundation

## Goal

Create a clear DAO-first strategy and ensure Codex, contributors, and future design partners understand the same product direction.

## Deliverables

- Updated whitepaper.
- Updated roadmap.
- Market-entry strategy.
- Competitive landscape.
- Integration strategy.
- Accountability model.
- Trust and security model.
- AI policy.
- SaaS and open-core model.
- v0.6 design partner demo script.
- Codex-friendly development process.

## Success Criteria

- The project no longer sounds like it is trying to start with state-level governance.
- The first market is clearly DAO/Web3 governance.
- The long-term civic vision remains present but appropriately sequenced.
- v0.6 remains scoped to local alpha/demo readiness.
- Codex has clear instructions and does not invent out-of-scope features.

---

# Phase 1 — v0.6: Usable Governance Console Alpha

## Goal

Make the v0.5 Developer Preview usable as a coherent local governance console demo.

A developer or design partner should be able to run IsoniaOS locally, create a Simple DAO+ organization, inspect its governance structure, create a proposal, route it through approval, veto, timelock, and execution, and understand what is happening without reading source code.

## Primary outcomes

1. A cleaner, reusable UI foundation in App Core.
2. Address and multi-address input components suitable for governance authority setup.
3. A Simple DAO+ setup wizard instead of a long raw form.
4. Transparent setup execution progress.
5. A proposal lifecycle demo that can be completed locally.
6. A stronger diagnostics panel for chain, indexer, projections, app config, and wallet state.
7. Documentation that allows an external developer to reproduce the local demo.
8. A design partner demo script that explains value to a DAO operator, not only to a developer.

## Recommended alpha sequence

### v0.6.0-alpha.1 — Repository preparation and UI foundation

Expected results:

- v0.6 docs exist and are the active development context;
- v0.5 compatibility matrix is archived;
- CHANGELOG files have a v0.6 Unreleased section;
- App Core has reusable base UI components;
- address display/input/multi-address components exist.

### v0.6.0-alpha.2 — Simple DAO+ setup wizard

Expected results:

- organization setup is split into steps;
- setup draft model remains browser-side and reviewable;
- multi-address inputs replace raw holder textareas;
- review screen is easier to understand;
- governance bodies and policy routes are visible.

### v0.6.0-alpha.3 — Setup execution UX

Expected results:

- setup actions show pending, signing, submitted, mined, indexed, projected, completed, and failed states;
- users can see tx hashes and indexing status;
- retry guidance exists for failed or timed-out actions;
- execution progress distinguishes chain, indexing, projection, config, and wallet failures.

### v0.6.0-alpha.4 — Proposal lifecycle demo

Expected results:

- create proposal flow is polished;
- approve, veto, queue, execute, and cancel actions are understandable;
- local Hardhat time helpers exist where appropriate;
- proposal route explanation is visible and human-readable;
- final executed state is easy to verify.

### v0.6.0-alpha.5 — Docs and demo readiness

Expected results:

- quickstart-local guide works from a clean clone;
- troubleshooting covers common local failures;
- design partner demo script exists;
- release notes and compatibility matrix are updated;
- v0.6 review checklist passes.

## v0.6 Non-goals

v0.6 must not deliver SaaS billing, tenant management, production deployment, smart contract audit readiness, Safe integration, delegation, token-weighted voting, multi-chain production indexing, AI assistant, custom theme loading from Git, or final brand/marketing design.

## Future Protocol Backlog

### Bootstrap Finalization and Admin Handoff

The v0.6 alpha contracts intentionally use the organization admin as bootstrap authority. A future protocol milestone should add an explicit bootstrap finalization path so the admin can complete organization setup and then give up unilateral control over roles, mandates, and policy rules.

After finalization, mandate and policy changes should move through governance-controlled proposals and routes, or through narrowly scoped role authority such as `BodyAdmin` where that authority is explicitly modeled. Contracts remain the authoritative source of governance power; apps, wallets, and indexers may explain or optimize the flow but must not become the source of authority.

### Admin Batch Activation

A related future EVM contract design item should add typed admin batch functions for bootstrap setup groups. The goal is to reduce setup friction while preserving `msg.sender` as the organization admin during bootstrap actions.

Prefer typed batch helpers over arbitrary calldata multicall as the first production path, for example:

- batch create bodies;
- batch create roles;
- batch assign mandates;
- batch set policy rules;
- or a typed bootstrap activation bundle that combines those setup groups.

Batch activation must emit the same events expected by the Control Plane indexer and preserve deterministic read-model recovery from contract events.

These two upgrades should be designed together: batch activation makes bootstrap setup easier, while bootstrap finalization prevents that bootstrap authority from becoming permanent admin control after governance activation. App Core activation UX should prefer a protocol-level batch path when available, keep serial activation as the reliable default for v0.6, and treat EIP-5792 only as a wallet-level optimization.

EIP-5792 remains optional because support is wallet, account, and chain dependent. It is not reliable enough to be the primary bootstrap path in v0.6, but it may improve the experience later when a user's wallet and local chain support it.

## Product principle

```text
v0.6 should move IsoniaOS from “it works” to “it can be shown to a person and they can understand the value.”
```

---

# Phase 2 — v0.7: Integration Preview

## Goal

Show that IsoniaOS orchestrates the existing DAO governance stack instead of fighting it.

## Scope

v0.7 should support early linked or imported records from common DAO tools. Deep two-way integrations are not required yet.

Initial integration targets:

- Snapshot proposal link/import;
- Safe transaction link/proof;
- Tally or Agora proposal link/import;
- Discourse or forum discussion link;
- GitHub issue/PR link for proposal payload or implementation work;
- block explorer transaction proof link;
- external evidence links for execution status.

## Deliverables

- external resource model;
- basic external proposal/evidence links;
- Snapshot link/import preview;
- Safe transaction proof preview;
- Tally/Agora proposal link preview;
- Discourse/GitHub context links;
- public display of external records in proposal detail;
- integration warnings and trust boundaries.

## Success Criteria

- A DAO can use IsoniaOS without abandoning its existing tools.
- Users can see how a proposal connects to discussions, votes, transactions, and evidence.
- IsoniaOS is visibly a control plane, not another isolated app.

---

# Phase 3 — v0.8: Public Governance Archive and Accountability Dashboard

## Goal

Make accountability the product center.

v0.8 should make it obvious what happened after a governance decision passed.

## Scope

### Public Governance Archive

- public organization page;
- proposal history;
- status filters;
- proposal type filters;
- linked discussions;
- vote/approval summary;
- execution state;
- external evidence;
- historical decision records.

### Basic Accountability Dashboard

- responsible party;
- due date;
- execution status;
- linked transaction hash;
- external proof;
- manual status updates;
- failure/cancellation reason;
- completion confirmation.

Recommended early statuses:

```text
Not Required → Awaiting Execution → In Progress → Blocked → Executed → Completed → Failed → Cancelled
```

## Success Criteria

- A DAO can show the public what happened to approved decisions.
- The product demonstrates the “proposal to proof of execution” wedge.
- v0.8 becomes useful before advanced voting, delegation, or AI modules.

---

# Phase 4 — v0.9: Optional AI Governance Digest Preview

## Goal

Introduce AI as advisory intelligence that improves governance readability without creating authority concerns.

## Allowed AI Features

- proposal summary;
- proposal status explanation;
- route explanation summary;
- basic risk checklist;
- unresolved question detection;
- similar proposal search if governance memory exists;
- execution status summary;
- discussion summary if discussion sources are connected.

## Explicit Non-goals

AI must not vote, execute, approve or reject proposals, invalidate proposals as final authority, replace human/community review, perform binding arbitration, impersonate delegates/users, or hide source limitations.

## Success Criteria

- AI reduces governance reading burden.
- AI remains advisory and clearly labeled.
- Users understand that final authority remains with the organization’s governance model.

---

# Phase 5 — v1.0: Design Partner Release

## Goal

Support real design partner workflows on non-critical DAO processes.

v1.0 should be stable enough for selected DAOs, protocol foundations, or grant programs to use IsoniaOS for a real governance lifecycle that does not create unacceptable production risk.

## Target Design Partner Workflows

- grant application and milestone tracking;
- treasury request with Safe transaction proof;
- protocol operations proposal with review and execution record;
- working group mandate and deliverable tracking;
- community decision with external Snapshot/Tally/Agora link.

## Success Criteria

- 2–3 design partners can complete a real workflow.
- At least one public or anonymized case study can be written.
- The product demonstrates a clear benefit over fragmented tools.
- Users can explain IsoniaOS in one sentence.

---

# Phase 6 — v1.x: Modular Governance Expansion

## Goal

Make IsoniaOS configurable for different DAO types and governance maturity levels.

## Priority Templates

- Simple DAO+;
- Grants DAO;
- Protocol Operations DAO;
- Treasury Committee DAO;
- Foundation/Council;
- Working Group DAO.

Later templates may include Investment Club, Cooperative, Public Consultation, Emergency Governance, and Civic Pilot.

## Scope

- governance templates;
- policy configuration;
- advanced permissions;
- analytics;
- delegate views;
- expanded integrations;
- improved SaaS features.

---

# Phase 7 — v2.x: Accountability and Dispute Intelligence

## Goal

Add structured accountability, dispute workflows, and post-decision review.

## Scope

- milestone tracking;
- post-execution review;
- contributor accountability;
- delegate accountability;
- grant recipient accountability;
- failure reports;
- dispute lifecycle;
- evidence submission;
- position mapping;
- review/mediation workflow;
- public audit exports;
- governance health reports.

Suggested dispute lifecycle:

```text
Dispute Raised → Evidence Submitted → Positions Summarized → Review / Mediation → Recommendation / Resolution → Archived
```

AI may assist with dispute summaries and mediation suggestions, but remains non-binding by default.

---

# Phase 8 — v3.x+: Ecosystem, Advanced Governance, and Institutional Expansion

## Goal

Expand IsoniaOS into a governance ecosystem with plugins, advanced modules, optional arbitration frameworks, enterprise deployments, and carefully scoped civic/institutional pilots.

## Scope

- plugin system;
- integration marketplace;
- advanced identity modules;
- reputation modules;
- governance templates marketplace;
- delegate reputation across organizations;
- public organization directory;
- governance standards documentation;
- enterprise/custom deployments;
- civic/institutional pilots.

Civic and public-governance use cases require legal, compliance, business-development, procurement, privacy, and institutional expertise. They should not be overclaimed before DAO-market validation.

---

# Public Roadmap Short Version

## v0.6 — Governance Console Alpha

Simple DAO+ setup wizard, proposal lifecycle demo, route explanation, setup execution UX, diagnostics, and reproducible local documentation.

## v0.7 — Integration Preview

Initial linked/imported records for Snapshot, Safe, Tally/Agora, Discourse, GitHub, block explorers, and external evidence.

## v0.8 — Accountability Dashboard

Public governance archive, execution status, responsible parties, due dates, transaction proofs, evidence links, and completion/failure records.

## v0.9 — AI Governance Digest

Optional advisory summaries, risk checklists, route explanations, unresolved questions, and similar-proposal search.

## v1.0 — Design Partner Release

Stable enough for selected DAOs, protocol foundations, and grants programs to run real non-critical governance workflows.

## v1.x — Modular Governance

Templates, policy configuration, advanced permissions, analytics, delegate views, and deeper integrations.

Tenant mode, domain binding, organization workspace mapping, and chain deployment mapping should be planned as part of the SaaS and self-hosting path. The normal tenant experience should remain single-org, while multi-org administration should be reserved for operators, agencies, demos, and advanced administration.

Storage work should introduce an Isonia-controlled storage API, upload intent flow, CID registry, and gateway allowlist/no-fetch posture before broad public uploads. Isonia should not expose IPFS/Kubo write RPC directly to browsers or the public internet.

## v2.x — Dispute and Accountability Intelligence

Milestones, post-execution reviews, structured disputes, contributor/delegate accountability, and governance health reports.

## v3.x+ — Ecosystem and Institutional Expansion

Plugins, marketplace, advanced identity/reputation modules, enterprise deployments, and carefully scoped civic/institutional pilots.

---

# Strategic Positioning

## 1. IsoniaOS is a control plane, not a replacement war

```text
IsoniaOS orchestrates the DAO governance stack.
```

## 2. Governance is a lifecycle

```text
Idea → Proposal → Review → Decision → Execution → Accountability → Memory
```

## 3. Execution accountability is the launch wedge

```text
IsoniaOS closes the loop between DAO decisions and execution.
```

## 4. AI is optional assistance by default

```text
AI helps governance become clearer. It does not govern by default.
```

## 5. SaaS provides convenience and intelligence

```text
Open where trust matters. Commercial where reliability, convenience, and intelligence matter.
```
