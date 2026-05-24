# IsoniaOS Roadmap

**Status:** Public roadmap
**Primary market:** DAO and Web3 governance
**Current cycle:** Accountability, integration preview, and production-shaped normalization

This roadmap explains the public product direction. Detailed internal implementation sequencing lives in the private workspace.

## Roadmap Philosophy

IsoniaOS should evolve from a focused governance lifecycle foundation into a DAO governance control plane, then into a modular governance operating system for accountable digital organizations.

The roadmap follows several principles:

- start with the essential governance lifecycle;
- prove value in DAO and Web3 governance before expanding beyond blockchain-native organizations;
- make authority visible, scoped, auditable, and eventually recallable;
- keep contracts authoritative for modeled onchain governance state;
- treat Control Plane, App Core, diagnostics, and AI as explanatory or operational layers unless authority is explicitly modeled;
- introduce advanced governance capabilities gradually;
- keep AI as an assistance layer by default, not as a source of authority;
- keep ISO-related funding or protocol self-governance work separate from the public product roadmap unless explicitly scoped.

The long-term goal is governance that is structured, transparent, verifiable, accountable, and understandable.

## Version Strategy

IsoniaOS uses product milestone labels for public roadmap communication:

```text
v0.6 -> v0.7 -> v0.8 -> public beta readiness wave -> v0.9 -> v1.0 -> v1.x -> v2.x -> v3.x+
```

Package versions and repository tags use SemVer in their own repositories. Public milestone labels do not imply that every repository is released or tagged at the same moment.

Old public version folders are not kept as active public docs. Historical material remains available through Git history, tags, and private migration records.

## Historical Baseline

### v0.6: usable governance console alpha

v0.6 established the usable local governance-console baseline:

- organization creation and setup direction;
- Simple DAO+ flow;
- proposal lifecycle demo;
- route explanation;
- setup execution UX;
- diagnostics;
- governance structure visualization;
- reproducible local demo documentation.

This is historical context, not the current self-hosting path.

### v0.7: protocol-hardening alpha

v0.7 established protocol foundation work:

- typed admin batch activation;
- bootstrap finalization and admin handoff;
- explicit organization lifecycle state;
- Control Plane read-model direction;
- App Core finalization UX direction;
- Proposal Action Builder design baseline;
- storage and metadata schema direction;
- design partner protocol preview materials.

These foundations inform current work but do not imply production storage, upload APIs, IPFS pinning, managed gateway implementation, full Proposal Action Builder readiness, full Safe integration, or audit completion.

## Current Cycle

The current cycle repairs documentation boundaries and then continues production-shaped normalization across core repositories.

Publicly safe work order:

1. Public docs repair around human-facing product, developer, and operator guidance.
2. Contract normalization and demo/mock isolation.
3. Shared types for archive, accountability, external resources, source labels, trust boundaries, and authority claims.
4. Control Plane updates for generic proof/action metadata, provider adapter boundaries, replay-safe projections, and diagnostics.
5. SDK alignment with shared types and Control Plane APIs.
6. App Core updates for public archive, accountability surfaces, runtime config, and visible trust boundaries.
7. Theme package work when scheduled.
8. Integration-lab validation outside core product repositories.

This cycle is production-shaped work. It is not a production, audit, public beta, legal, SaaS, provider-complete, or token-launch claim.

## v0.8: Accountability and Integration Preview

v0.8 is the active product target.

Goal:

```text
Show what happened after a governance decision.
```

Product wedge:

```text
proposal -> approval/decision -> responsible party -> execution status -> proof/evidence -> historical record
```

### Public Governance Archive

The Public Governance Archive should let members, contributors, delegates, grantees, auditors, journalists, and observers understand:

- what decisions exist;
- how proposals moved through governance;
- what was approved, rejected, cancelled, queued, executed, or still pending;
- who is responsible for follow-through;
- what evidence or proof has been attached;
- which external resources provide context;
- what historical record remains after the proposal is no longer active.

### Basic Accountability Dashboard

The accountability surface should answer:

1. What was approved?
2. Who is responsible?
3. What is due?
4. What is the current execution status?
5. What proof or evidence exists?
6. What failed, changed, or remains unresolved?

Manual records are useful early, but they must be labeled as annotations rather than protocol truth.

### Integration Preview

Initial integration posture is link-first:

- Snapshot proposal links/import previews;
- Safe transaction proof links;
- Tally/Agora proposal links;
- Discourse/GitHub context links;
- block explorer transaction proof links;
- source labels;
- trust-boundary warnings.

External records are evidence or context unless explicit source modeling makes a source authoritative for a specific field.

### v0.8 non-goals

v0.8 does not claim:

- production SaaS;
- audited governance;
- full Safe integration;
- full Snapshot integration;
- full Tally or Agora integration;
- NFT voting runtime;
- production-grade indexing;
- AI governance;
- automatic external execution;
- token launch;
- external records as authority by default.

## Public Beta Readiness Wave

The public beta readiness wave is a gated decision process after core v0.8 runtime surfaces are stable enough to harden.

Required workstreams include:

- production-shaped core cleanup across contracts, shared types, Control Plane, SDK, App Core, theme, and docs;
- demo, mock, and integration-lab isolation from product/security claims;
- integration-lab validation on Sepolia;
- hosted dev and stage baseline for Control Plane and App Core;
- managed database/indexer direction;
- SaaS readiness baseline without claiming production SaaS;
- ISO funding/protocol self-governance boundary review without making token launch a product dependency;
- custom organization and governance template guardrails;
- client contract authority and managed execution review;
- security review or audit gate focused on authority, execution, access control, integrations, and demo/mock isolation;
- docs and public claims review.

Public beta readiness should be evaluated by evidence, not implied by a feature list.

## v0.9: Optional AI Governance Digest

v0.9 may introduce optional advisory intelligence:

- proposal summaries;
- status explanations;
- route explanation summaries;
- risk checklists;
- unresolved question detection;
- similar proposal search;
- execution status summaries;
- discussion summaries when sources are connected.

AI must not vote, execute, approve or reject proposals, invalidate proposals as final authority, replace human/community review, perform binding arbitration, impersonate delegates/users, or hide source limitations.

## v1.0: Design Partner Release

v1.0 should support selected design partner workflows on non-critical governance processes.

Target workflows:

- grant application and milestone tracking;
- treasury request with transaction proof;
- protocol operations proposal with review and execution record;
- working group mandate and deliverable tracking;
- community decision with external Snapshot, Tally, or Agora link.

Success criteria:

- two or three design partners can complete real workflows;
- at least one public or anonymized case study can be written;
- the product demonstrates a clear benefit over fragmented tools;
- users can explain IsoniaOS in one sentence.

## v1.x: Modular Governance Expansion

v1.x expands configurability for different DAO types and governance maturity levels.

Priority template families:

- Simple DAO+;
- Grants DAO;
- Protocol Operations DAO;
- Treasury Committee DAO;
- Foundation/Council;
- Working Group DAO.

Template guardrails:

- templates are versioned configuration blueprints, not authority by themselves;
- templates cannot silently grant roles, permissions, execution rights, veto rights, owner rights, selector permissions, value permissions, or parameter permissions;
- authority-changing output must go through explicit governed setup or activation;
- templates should be exportable/importable as data;
- risky or custom templates should show warnings;
- templates must not allow arbitrary code execution in core.

## v2.x: Accountability and Dispute Intelligence

v2.x focuses on deeper accountability and dispute workflows:

- milestone tracking;
- post-execution reviews;
- contributor accountability;
- delegate accountability;
- structured disputes;
- failure and deviation reports;
- governance health reports;
- optional advisory dispute summaries.

AI may assist with summaries and issue framing, but remains non-binding by default.

## v3.x+: Ecosystem and Institutional Expansion

v3.x and later may expand IsoniaOS into a governance ecosystem:

- plugin marketplace;
- advanced identity and reputation modules;
- optional arbitration frameworks;
- enterprise deployments;
- civic pilots;
- institutional governance experiments.

Civic and public-governance use cases require legal, compliance, procurement, privacy, accessibility, institutional, and operational expertise. They should not be overclaimed before DAO-market validation.

## Readiness Gates and Public Claims

IsoniaOS public docs and messaging must avoid unsupported claims.

Do not claim:

- production readiness;
- audit readiness;
- public beta readiness;
- legal readiness;
- SaaS readiness;
- provider integration completeness;
- token launch readiness;
- external records as governance authority.

Make precise scoped statements instead. For example:

```text
This area is being normalized in the current workspace cycle.
```

or:

```text
This external record is linked evidence. It does not override contract state.
```

## Product-Support Tracks

Two support tracks may affect future roadmap decisions without replacing the product roadmap.

### Integration lab

Integration-lab work validates provider assumptions through local fixtures, pinned Sepolia forks, live Sepolia workflows, field notes, and issue logs. It must stay outside core product authority.

### ISO boundary

ISO-related funding or protocol self-governance work is separate from the product roadmap. It is not required for v0.8 and is not automatically required for public beta. Any token launch, if pursued, is a separate explicit decision with its own legal, security, communications, and governance gates.

## Summary

IsoniaOS should first prove one focused claim:

```text
DAOs can see what happened after a decision passed.
```

From there, the product can expand into more governance modules, more integrations, stronger accountability, optional advisory intelligence, and eventually broader digital-organization and institutional use cases.
