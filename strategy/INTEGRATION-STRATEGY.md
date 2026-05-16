# IsoniaOS Integration Strategy

**Status:** Draft  
**Prepared date:** 2026-05-05

---

## 1. Integration Thesis

IsoniaOS should not enter the DAO market as a replacement war.

DAOs already use Snapshot, Safe, Tally, Agora, Discourse, GitHub, block explorers, dashboards, grant tools, and many custom processes. Asking a DAO to abandon its stack is a high-friction adoption path.

The better wedge is:

```text
Keep your tools. Connect the lifecycle.
```

IsoniaOS should become the place where these tools are connected into one governance record:

```text
Proposal -> Discussion -> Vote / Approval -> Execution -> Evidence -> Accountability -> Memory
```

---

## 2. Integration Maturity Levels

Use explicit integration levels so users understand trust boundaries.

### Level 0 — Link

IsoniaOS stores a URL to an external resource.

Examples:

- Snapshot proposal URL;
- Safe transaction URL;
- Discourse thread URL;
- GitHub PR URL;
- block explorer transaction URL.

Trust model:

- user-provided;
- not automatically verified;
- useful for context.

### Level 1 — Import

IsoniaOS fetches selected metadata from an external tool.

Examples:

- title;
- status;
- proposal ID;
- vote result;
- transaction hash;
- external timestamps.

Trust model:

- external API or public data source;
- refresh may fail;
- display source and last sync time.

### Level 2 — Sync

IsoniaOS keeps external state synchronized on an ongoing basis.

Examples:

- proposal status updates;
- vote status changes;
- Safe transaction execution status;
- GitHub PR merge status.

Trust model:

- stronger dependency on API/indexing reliability;
- must show stale indicators;
- must support resync/backfill.

### Level 3 — Verify

IsoniaOS verifies that external records match expected data.

Examples:

- transaction hash matches approved execution target;
- proposal payload hash matches reviewed payload;
- attestation schema matches expected milestone evidence;
- linked Governor proposal matches organization and route.

Trust model:

- source-specific verification logic;
- warnings when mismatch occurs;
- no silent trust.

### Level 4 — Execute / Native

IsoniaOS participates directly in execution or native governance logic.

Examples:

- native onchain proposal execution;
- Safe transaction preparation;
- contract module execution;
- attestation creation.

Trust model:

- highest risk;
- requires security review;
- should come later and be narrow in scope.

---

## 3. Initial Integration Targets

### Snapshot

Initial use:

- link/import proposal;
- show result/status;
- associate Snapshot vote with IsoniaOS lifecycle record.

Later use:

- sync proposal status;
- import strategies/validation metadata;
- support Snapshot X where appropriate.

Relevant references:

- https://docs.snapshot.box/user-guides/spaces/create

### Safe

Initial use:

- attach Safe transaction proof;
- show tx hash/status if available;
- connect approved proposal to treasury execution.

Later use:

- Safe transaction builder integration;
- simulation status;
- signing status;
- execution readiness;
- scoped execution workflows.

Relevant references:

- https://safe.global/
- https://www.safe.global/wallet

### Tally / Governor systems

Initial use:

- link/import onchain proposal;
- show Governor proposal status;
- connect proposal to execution state.

Later use:

- payload verification;
- timelock status;
- Governor action parsing;
- execution proof.

Relevant reference:

- https://docs.tally.xyz/tally-features/tally/onchain-governance

### Agora

Initial use:

- link/import Agora proposal records;
- support design partners using Agora portals;
- display proposal lifecycle status.

Relevant references:

- https://docs.agora.xyz/governance-technical-overview
- https://docs.agora.xyz/quickstart

### Discourse / forums

Initial use:

- link discussion thread;
- show discussion as external context.

Later use:

- import comments;
- discussion summaries;
- unresolved question detection;
- argument mapping.

### GitHub

Initial use:

- link issue/PR/repository for protocol payload or implementation work;
- show merged/closed/open state manually or by API later.

Later use:

- pull request sync;
- payload/code hash comparison;
- implementation status;
- release tracking.

### Block explorers

Initial use:

- transaction proof links;
- address links;
- contract links.

Later use:

- automatic transaction verification;
- event parsing;
- execution effect display.

### ERC-4824-style DAO metadata

Initial use:

- evaluate compatibility with DAO metadata standards;
- avoid inventing unnecessary metadata formats.

Relevant reference:

- https://eips.ethereum.org/EIPS/eip-4824

### EAS / attestations

Initial use:

- evaluate milestone/evidence attestations;
- learn from Karma GAP style accountability.

Later use:

- milestone completion attestations;
- reviewer attestations;
- completion proofs;
- public audit exports.

Relevant reference:

- https://attest.org/

---

## 4. Data Model Concepts

### ExternalResource

Represents a linked external object.

Suggested fields:

- `id`
- `organizationId`
- `proposalId` optional
- `type`
- `provider`
- `url`
- `externalId` optional
- `title` optional
- `status` optional
- `lastSyncedAt` optional
- `verificationStatus`
- `createdAt`
- `updatedAt`

### ExternalProposal

Represents an imported proposal from Snapshot, Tally, Agora, or another tool.

Suggested fields:

- `provider`
- `externalProposalId`
- `externalUrl`
- `title`
- `bodyHash` optional
- `status`
- `startAt`
- `endAt`
- `result`
- `quorum` optional
- `threshold` optional
- `lastSyncedAt`

### ExternalExecutionProof

Represents evidence that an approved decision was executed.

Suggested fields:

- `provider`
- `chainId` optional
- `transactionHash` optional
- `safeTxHash` optional
- `explorerUrl` optional
- `executedAt` optional
- `executor` optional
- `verificationStatus`
- `notes`

### ExternalDiscussion

Represents linked or imported discussion context.

Suggested fields:

- `provider`
- `url`
- `title`
- `author` optional
- `commentCount` optional
- `lastActivityAt` optional
- `summary` optional when AI is enabled

---

## 5. UX Principles

- Always show the source of external data.
- Always show whether data is linked, imported, synced, or verified.
- Always show last sync time when data is fetched.
- Do not imply external records are authoritative unless the integration can verify that.
- Do not hide failed syncs.
- Prefer clear warnings over silent inconsistencies.
- Let users manually attach evidence before deep integrations exist.

---

## 6. v0.8 Integration Preview Work

v0.7 is archived as the protocol-hardening foundation. v0.8 is the active integration preview baseline and should keep integrations link-first unless explicit source modeling makes a field authoritative.

Recommended future integration deliverables:

- external resource model;
- proposal external links;
- execution proof links;
- Snapshot proposal link/import preview;
- Safe transaction proof link;
- Tally/Agora proposal link;
- Discourse/GitHub context links;
- source labels;
- trust-boundary warnings;
- no automatic execution.

---

## 7. v0.8 Integration Scope

v0.8 should connect integrations to accountability:

- execution status from external proof;
- responsible party and due date linked to external transaction/evidence;
- public governance archive displays external sources;
- failure state if execution proof is missing or inconsistent;
- manual evidence attachments where integrations are incomplete.

---

## 8. Security Rules

- Do not auto-execute external actions in early versions.
- Do not treat user-provided URLs as verified data.
- Do not hide the distinction between transaction submitted, mined, indexed, projected, and confirmed by the organization.
- Do not rely on one external API without stale/error indicators.
- Do not parse arbitrary calldata for production decisions without a security review.
- Do not make claims about external system finality beyond what the integration can verify.

---

## 9. Adapter Pattern

Each integration should eventually have an adapter with a clear boundary.

Suggested adapter responsibilities:

- provider name;
- supported resource types;
- URL parsing;
- external ID extraction;
- metadata fetch;
- status fetch;
- verification methods if supported;
- error normalization;
- rate-limit handling;
- last sync recording.

Adapters should not contain product-specific UI logic.

---

## 10. Integration Acceptance Checklist

Before adding an integration to a release:

- Is the integration level documented?
- Is source attribution visible in the UI?
- Is last sync time visible where relevant?
- Are failure states clear?
- Are stale states clear?
- Is the integration optional?
- Does it avoid out-of-scope execution authority?
- Are manual fallbacks available?
- Are tests added for URL parsing and data normalization?
- Is the trust boundary documented?
