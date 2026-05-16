# IsoniaOS Roadmap

**Document version:** 1.2
**Project:** IsoniaOS  
**Working product title:** IsoniaOS - A Governance Control Plane for Accountable Digital Organizations
**Status:** Draft  
**Active target:** v0.8 accountability and integration preview
**Primary market:** DAO and Web3 governance  
**Language:** English

---

## Roadmap Philosophy

IsoniaOS should evolve from a focused local governance console into a DAO governance control plane, then into a modular governance operating system for accountable digital organizations.

The roadmap follows several principles:

- start with the essential governance lifecycle;
- prove value in DAO and Web3 governance before expanding beyond blockchain-native organizations;
- make authority visible, scoped, auditable, and eventually recallable;
- keep contracts authoritative for onchain governance state;
- treat Control Plane, App Core, diagnostics, and AI as explanatory or operational layers unless authority is explicitly modeled;
- introduce advanced governance capabilities gradually;
- keep AI as an assistance layer by default, not as a source of authority.

The long-term goal is governance that is structured, transparent, verifiable, accountable, and understandable.

---

## Version Strategy

- **v0.6** - usable governance console alpha. Archived baseline.
- **v0.7** - protocol hardening alpha. Archived protocol foundation.
- **v0.8** - public governance archive, accountability dashboard, and integration preview. Active target.
- **v0.9** - optional AI governance digest preview.
- **v1.0** - design partner release.
- **v1.x** - modular governance expansion.
- **v2.x** - accountability, dispute intelligence, and advanced governance workflows.
- **v3.x+** - ecosystem, plugin marketplace, optional arbitration, enterprise, institutional, and civic pilots.

For packages, APIs, SDKs, and contracts, use SemVer:

```text
MAJOR.MINOR.PATCH[-PRERELEASE]
```

Git tags use the same version with a leading `v`, for example `v0.7.0-alpha.1`.

---

# Phase 0 - Strategic Foundation

## Goal

Create a clear DAO-first strategy and ensure Codex, contributors, and future design partners understand the same product direction.

## Deliverables

- Whitepaper.
- Roadmap.
- Market-entry strategy.
- Competitive landscape.
- Integration strategy.
- Accountability model.
- Trust and security model.
- AI policy.
- SaaS and open-core model.
- Codex-friendly development process.

## Success Criteria

- The project no longer sounds like it is trying to start with state-level governance.
- The first market is clearly DAO/Web3 governance.
- The long-term civic vision remains present but appropriately sequenced.
- Codex has clear instructions and does not invent out-of-scope features.

---

# Phase 1 - v0.6: Usable Governance Console Alpha

## Status

v0.6 is the completed baseline and is no longer the active documentation target.

Its purpose was to make the v0.5 Developer Preview usable as a coherent local governance console demo.

## Baseline outcomes

v0.6 established:

- organization creation and setup flows;
- Simple DAO+ setup direction;
- proposal lifecycle demo;
- route explanation;
- setup execution UX;
- diagnostics;
- governance structure visualization;
- demo-stack readiness;
- documentation for reproducible local demos.

## Archived docs

v0.6 documentation lives under:

```text
archive/v0.6/
```

Archived v0.6 docs are historical references. They should not be treated as the active documentation surface.

---

# Phase 2 - v0.7: Protocol Hardening Alpha

## Status

v0.7 is archived and is no longer the active documentation target.

Its purpose was to move from a demo-ready UX/product foundation to protocol hardening and real governance execution foundations.

## Archived outcomes

v0.7 established:

1. typed admin batch activation;
2. bootstrap finalization and admin handoff;
3. explicit organization lifecycle state;
4. Control Plane read-model direction for new protocol states;
5. App Core support direction for finalization and batch activation;
6. Proposal Action Builder design baseline;
7. metadata/storage schema baseline;
8. design partner protocol preview materials.

The v0.7 Proposal Action Builder and storage/metadata baselines are design foundations for later work. They do not imply production storage, upload APIs, IPFS pinning, managed gateway implementation, encryption/key management, full Proposal Action Builder readiness, Safe integration, or audit readiness.

## Archived docs

v0.7 documentation lives under:

```text
archive/v0.7/
```

Read as historical foundation:

- [`archive/v0.7/README.md`](archive/v0.7/README.md)
- [`archive/v0.7/roadmap.md`](archive/v0.7/roadmap.md)
- [`archive/v0.7/protocol-roadmap.md`](archive/v0.7/protocol-roadmap.md)
- [`archive/v0.7/bootstrap-finalization.md`](archive/v0.7/bootstrap-finalization.md)
- [`archive/v0.7/admin-batch-activation.md`](archive/v0.7/admin-batch-activation.md)
- [`archive/v0.7/compatibility-matrix.md`](archive/v0.7/compatibility-matrix.md)

---

# Phase 3 - v0.8: Accountability and Integration Preview

## Goal

Make accountability the product center while beginning careful external tool linkage after the archived v0.7 protocol foundation is clear.

## Source of truth

The active v0.8 planning and architecture baseline lives under:

```text
v0.8/
```

Read first:

- [`v0.8/README.md`](v0.8/README.md)
- [`v0.8/accountability-and-integration-preview.md`](v0.8/accountability-and-integration-preview.md)
- [`v0.8/testing-and-demo-strategy.md`](v0.8/testing-and-demo-strategy.md)
- [`v0.8/demo-organization-and-governance-process.md`](v0.8/demo-organization-and-governance-process.md)
- [`v0.8/backlog-and-implementation-sequence.md`](v0.8/backlog-and-implementation-sequence.md)

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

### Integration Preview

- external resource model;
- Snapshot proposal link/import preview;
- Safe transaction proof link;
- Tally/Agora proposal link;
- Discourse/GitHub context links;
- block explorer transaction proof links;
- source labels and trust-boundary warnings.

## Success Criteria

- A DAO can show the public what happened to approved decisions.
- The product demonstrates the proposal-to-proof-of-execution wedge.
- External records are linked or imported without overclaiming authority.
- Manual accountability updates are clearly presented as annotations, not protocol truth.

---

# Phase 4 - v0.9: Optional AI Governance Digest Preview

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

---

# Phase 5 - v1.0: Design Partner Release

## Goal

Support real design partner workflows on non-critical DAO processes.

v1.0 should be stable enough for selected DAOs, protocol foundations, or grant programs to use IsoniaOS for a real governance lifecycle that does not create unacceptable production risk.

## Target Design Partner Workflows

- grant application and milestone tracking;
- treasury request with transaction proof;
- protocol operations proposal with review and execution record;
- working group mandate and deliverable tracking;
- community decision with external Snapshot/Tally/Agora link.

## Success Criteria

- 2-3 design partners can complete a real workflow.
- At least one public or anonymized case study can be written.
- The product demonstrates a clear benefit over fragmented tools.
- Users can explain IsoniaOS in one sentence.

---

# Phase 6 - v1.x: Modular Governance Expansion

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

---

# Phase 7 - v2.x: Accountability and Dispute Intelligence

## Goal

Add structured accountability, dispute workflows, and post-decision review.

AI may assist with dispute summaries and mediation suggestions, but remains non-binding by default.

---

# Phase 8 - v3.x+: Ecosystem, Advanced Governance, and Institutional Expansion

## Goal

Expand IsoniaOS into a governance ecosystem with plugins, advanced modules, optional arbitration frameworks, enterprise deployments, and carefully scoped civic/institutional pilots.

Civic and public-governance use cases require legal, compliance, business-development, procurement, privacy, and institutional expertise. They should not be overclaimed before DAO-market validation.
