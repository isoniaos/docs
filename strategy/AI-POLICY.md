# IsoniaOS AI Policy

**Status:** Draft  
**Prepared date:** 2026-05-05

---

## 1. Policy Statement

AI in IsoniaOS is an assistance layer by default.

AI helps governance become clearer, more understandable, and easier to navigate. It does not replace the authority of participants, delegates, councils, contracts, communities, or organizations unless a future organization explicitly opts into a narrowly defined module with transparent rules and safeguards.

Core principle:

```text
AI does not govern by default. AI helps governance become clearer.
```

---

## 2. Why AI Belongs in Governance

DAO governance creates information overload.

Participants often face:

- long proposals;
- fragmented discussions;
- complex technical payloads;
- budget details;
- legal or operational concerns;
- delegate rationales;
- previous governance history;
- execution records;
- status updates.

AI can reduce cognitive burden by summarizing, structuring, searching, and explaining governance context.

---

## 3. Approved Early AI Features

The following features are acceptable for early managed deployments or previews if clearly labeled as advisory:

### Proposal summaries

Summarize:

- what is being proposed;
- why it matters;
- what resources are requested;
- who is responsible;
- what decision is being asked.

### Proposal status explanation

Explain where the proposal is in the lifecycle and what happens next.

### Route explanation

Summarize:

- required approvals;
- veto bodies;
- executor body;
- timelock;
- execution route.

### Risk checklist

Generate a non-binding checklist covering:

- financial risk;
- execution risk;
- governance risk;
- security risk;
- operational risk;
- reputational risk.

### Discussion summaries

Summarize connected forum or discussion sources:

- main arguments for;
- main arguments against;
- unresolved questions;
- amendments;
- emerging consensus.

### Similar proposal search

Find previous proposals with related subject matter.

### Execution status summary

Explain:

- what has been executed;
- what remains pending;
- what proof exists;
- what is blocked or delayed.

### Dispute summaries later

For v2.x and beyond, AI may help summarize positions, evidence, and unresolved questions in disputes.

---

## 4. Disallowed Early AI Features

The following should not be added in early versions:

- AI voting on behalf of users;
- AI execution of governance actions;
- AI approval or rejection as final authority;
- AI invalidation of proposals as final authority;
- binding AI arbitration;
- AI-generated legal advice;
- hidden AI moderation that affects governance rights;
- AI impersonation of delegates, voters, or organization officials;
- AI summaries without clear labeling;
- AI outputs presented without source/context limitations.

---

## 5. Labeling Requirements

AI output should be visibly labeled.

Recommended label:

```text
AI-assisted summary. Advisory only. Final authority remains with the organization’s governance process.
```

If sources are incomplete, say so.

Example:

```text
This summary is based on the proposal text and linked discussion thread. It may not include Discord or off-platform conversations.
```

---

## 6. Data Policy

AI features should follow data minimization.

Recommendations:

- only send data needed for the feature;
- do not send private fields unless explicitly enabled;
- allow organizations to disable AI;
- support self-hosted deployments without AI;
- document whether managed AI uses external model providers;
- avoid storing prompts/responses longer than necessary unless needed for audit/debugging;
- never put private AI input/output onchain by default.

---

## 7. Source and Evidence Rules

AI should cite or link to source context where possible.

For example:

- proposal text;
- linked discussion thread;
- external vote record;
- execution proof;
- governance policy;
- previous proposal.

If source grounding is not available, output should avoid strong claims.

---

## 8. Human and Community Oversight

AI should support governance participants, not replace them.

Human/community oversight is required for:

- proposal approval;
- final risk acceptance;
- execution authorization;
- completion review;
- dispute resolution;
- policy interpretation as final authority;
- any high-impact decision.

---

## 9. Competitive Context

AI governance is already becoming a visible market theme.

### Aave Checkpoint

Aave Labs publicly introduced Aave Checkpoint as an AI-powered governance security system for structured proposal and payload review before onchain execution, combined with mandatory human sign-off.

Relevance to IsoniaOS:

- validates the need for structured governance review;
- suggests high-value protocols care about AI-assisted review;
- reinforces that AI output should be paired with human verification.

Source:

- https://governance.aave.com/t/introducing-aave-checkpoint/24457

### Kryon

Kryon publicly positions itself as AI-powered governance with proposal ingestion, AI analysis, delegation to AI/user agents, onchain execution, and feedback learning.

Relevance to IsoniaOS:

- indicates that “AI governance” narrative is already being claimed;
- IsoniaOS should differentiate by keeping AI advisory and lifecycle-oriented.

Source:

- https://kryon.fit/

### Event Horizon

Event Horizon describes agentic governance and AI consul agents for metagovernance participation.

Relevance to IsoniaOS:

- relevant for future delegation/participation modules;
- not the first IsoniaOS wedge.

Source:

- https://event-horizon.gitbook.io/event-horizon

---

## 10. Managed SaaS vs Self-Hosted AI

### Managed SaaS

Managed SaaS may provide:

- proposal summaries;
- discussion digests;
- risk checklists;
- governance memory search;
- status explanations;
- governance health reports.

### Self-hosted

Self-hosted deployments should be able to:

- disable AI entirely;
- connect their own AI provider later;
- use local/open-source models where feasible;
- control data exposure.

---

## 11. Future Optional AI Arbitration

Future optional AI arbitration should be treated as experimental and high-risk.

It should only be considered when:

- the organization explicitly enables it;
- participants consent to the relevant rules;
- scope is narrow and documented;
- outputs are explainable;
- appeal mechanisms exist;
- human/community oversight remains available where appropriate;
- audit logs are preserved;
- legal implications are reviewed.

Binding AI arbitration must never be the default.

---

## 12. AI Feature Release Checklist

Before releasing an AI feature:

- Is it optional?
- Is it labeled advisory?
- Are sources/context visible where possible?
- Are limitations disclosed?
- Can admins disable it?
- Does it avoid binding authority?
- Does it avoid private data exposure by default?
- Is prompt/output logging policy documented?
- Are hallucination and bias risks considered?
- Does the core governance workflow still work without AI?
