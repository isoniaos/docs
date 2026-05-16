# Accountability and Integration Preview

## Purpose

v0.8 defines the accountability and integration preview baseline for IsoniaOS.

v0.7 is archived as the protocol foundation. v0.8 uses that foundation to make accountability the product center: not only whether a proposal passed, but what happened after it passed.

The v0.8 product wedge is:

```text
proposal -> approval/decision -> responsible party -> execution status -> proof/evidence -> historical record
```

This document is a design and architecture baseline only. It does not implement runtime App Core, Control Plane, contract, SDK, SaaS, or external integration behavior.

## Authority model

Contracts remain authoritative for onchain governance state.

Control Plane and App Core may index, explain, organize, cache, filter, and present governance state. They do not invent authority. Control Plane read models can lag, fail, or be rebuilt. App Core presentation can be incomplete or stale. Those limitations must be visible where they matter.

External records are useful for context, evidence, and accountability, but they are not automatically governance authority.

Required v0.8 rule:

```text
v0.8 treats external records as linked evidence/context unless the system explicitly models a source as authoritative for a specific field.
```

Manual accountability updates are annotations and records. They are not protocol truth.

## Why v0.8 follows v0.7

v0.7 makes the governance foundation clearer:

- activation can be completed through the typed contract batch path where supported;
- serial activation remains the reliable fallback;
- bootstrap finalization and admin handoff are visible where the deployed protocol supports them;
- organization lifecycle read models make governance state easier to explain;
- Proposal Action Builder design clarifies future executable action review;
- storage and metadata design clarifies the boundary between explanatory records and execution truth.

v0.8 should not reopen those foundations. It should use them to answer the next product question:

```text
After a decision is approved, what happened?
```

## v0.8 includes

v0.8 includes the planning baseline for:

- Public Governance Archive;
- Basic Accountability Dashboard;
- Integration Preview;
- external resource and source-label model;
- trust-boundary warnings;
- historical decision records;
- lightweight route and UX sketches.

## v0.8 excludes

v0.8 does not claim:

- production SaaS readiness;
- audit readiness;
- full Safe integration;
- full Snapshot integration;
- full Tally or Agora integration;
- AI governance;
- automatic external execution;
- token voting, delegation, or multi-chain production support;
- that external records are authoritative unless explicitly modeled as authority;
- that manual status updates are onchain governance state.

## Component responsibilities

| Component | v0.8 responsibility | Boundary |
| --- | --- | --- |
| Contracts | Source of truth for onchain organization, policy, proposal, approval, veto, queue, execution, cancellation, and lifecycle state. | Do not derive contract truth from external tools or manual updates. |
| Control Plane | Index events, build read models, expose archive/accountability DTOs later, store or reference external evidence later, and show lag/stale/missing states. | Do not become governance authority. |
| App Core | Present public archive, accountability records, source labels, trust warnings, and operator-facing status flows later. | Do not make external evidence look more authoritative than protocol state. |
| External tools | Provide context, evidence, imported previews, or observed state. | Not authoritative unless explicitly modeled for a field. |
| Manual updates | Provide accountability annotations, status notes, reasons, and completion confirmations. | Not protocol truth. |

## Public Governance Archive

### Purpose

The Public Governance Archive is the public organization record.

It should let members, contributors, delegates, grantees, auditors, journalists, and external observers understand:

- what the organization is;
- which decisions exist;
- how proposals moved through governance;
- what was approved, rejected, cancelled, queued, executed, or still pending;
- who is responsible for follow-through;
- what evidence or proof has been attached;
- which external resources provide context;
- what historical record remains after the proposal is no longer active.

The archive is not a replacement for contract state. It is a public explanatory layer built from authoritative state, read models, metadata, and clearly labeled annotations/evidence.

### Suggested information architecture

Public organization/archive experience:

- organization header;
- governance status summary;
- proposal list or table;
- status filters;
- proposal type filters;
- linked discussion filters where practical;
- proposal detail page;
- vote/approval summary;
- decision record section;
- execution/evidence section;
- linked external resources section;
- historical timestamps and source labels.

Suggested organization header fields:

- organization name from metadata or fallback indexed label;
- `orgId`;
- chain/network label;
- lifecycle/finalization status where supported;
- governance summary counts;
- warning if core read-model data is stale, unsupported, or unavailable.

Suggested governance status summary:

- active proposals;
- approved decisions awaiting execution;
- executed decisions;
- failed or cancelled follow-through records;
- proposals with missing evidence;
- proposals with manual-only status.

Suggested proposal list/table fields:

- proposal ID;
- title or fallback label;
- proposal type;
- contract or derived display status;
- decision result;
- execution status;
- responsible party;
- due date;
- evidence count;
- external source count;
- last update timestamp.

### Proposal/archive state taxonomy

Display-level archive states should preserve the source of each state.

| State | Meaning | Source category |
| --- | --- | --- |
| `draft` | A draft exists before submitted onchain proposal state. | External/manual/app metadata only unless future contracts model drafts. |
| `active` | Proposal is in an active decision window or awaiting required approvals. | Contract/read-model state. |
| `approved` | Required governance approvals were reached. | Contract/read-model state. |
| `rejected` | Proposal failed, was denied, or did not meet required governance conditions. | Contract/read-model state where available; otherwise external/manual with label. |
| `cancelled` | Proposal or follow-through was cancelled. | Contract/read-model state for proposal cancellation; manual/external for accountability cancellation. |
| `execution_pending` | Decision is approved but execution is not complete. | Derived display state from contract/read-model state plus accountability record. |
| `executed` | Onchain execution completed or linked execution proof is marked complete. | Contract/read-model for protocol execution; external/manual evidence only when labeled. |
| `execution_failed` | Execution failed or accountability follow-through failed. | Contract/read-model if protocol execution failed; otherwise manual/external annotation. |
| `archived` | Proposal is no longer active and has a durable historical record. | Derived display state. |
| `unknown_external_state` | Linked external state exists but cannot be resolved or trusted. | External/import preview state. |

The UI must not collapse these into a single truth source. A proposal can be `approved` by contract state while its accountability record is `not_started`, `blocked`, `completed`, or `unknown`.

### Proposal detail page

The proposal detail page should make the following sections visible:

- summary and metadata;
- proposal route and approval/decision summary;
- current contract/read-model state;
- decision record;
- accountability record;
- execution and evidence;
- linked external resources;
- technical details and source disclosures.

For active proposals, accountability content may be secondary. For approved or resolved proposals, accountability should become a primary page concern.

## Basic Accountability Dashboard

### Purpose

The Basic Accountability Dashboard is the public-facing and operator-facing record of decision follow-through.

It should answer:

1. What was approved?
2. Who is responsible?
3. What is due?
4. What is the current execution status?
5. What proof or evidence exists?
6. What failed, changed, or remains unresolved?

This dashboard should support manual records before deep integrations exist. Manual records are valuable, but they must be labeled as annotations rather than protocol truth.

### Required fields

An accountability record should cover:

- responsible party;
- due date;
- execution status;
- linked transaction hash;
- external proof;
- manual status updates;
- failure or cancellation reason;
- completion confirmation.

### Accountability statuses

Recommended status values:

```text
not_started
in_progress
blocked
completed
failed
cancelled
unknown
```

These statuses describe follow-through accountability. They do not replace proposal lifecycle status.

Examples:

- a proposal can be contract-approved and accountability `not_started`;
- a proposal can be contract-executed and accountability `completed`;
- a proposal can be contract-approved and accountability `blocked` because a Safe transaction has not been signed;
- a proposal can have manual accountability `completed` while the UI still shows that no onchain execution was observed.

### Conceptual accountability record model

This is a conceptual model, not a committed runtime DTO.

```ts
type ExternalResourceRef = {
  id: string;
  url: string;
  sourceLabel: string;
  provider?: string;
  relation?: string;
};

type AccountabilityRecord = {
  id: string;
  orgId: string;
  proposalId: string;
  decisionRecordId?: string;

  responsibleParty?: {
    label: string;
    walletAddress?: string;
    externalIdentityUrl?: string;
  };

  dueDate?: string;

  executionStatus:
    | "not_started"
    | "in_progress"
    | "blocked"
    | "completed"
    | "failed"
    | "cancelled"
    | "unknown";

  linkedTransaction?: {
    chainId: number;
    txHash: string;
    explorerUrl?: string;
    observedStatus?: "pending" | "confirmed" | "failed" | "unknown";
  };

  externalProofs: ExternalResourceRef[];

  manualUpdates: Array<{
    status: string;
    note?: string;
    reason?: string;
    updatedBy?: string;
    updatedAt: string;
    evidence?: ExternalResourceRef[];
  }>;

  completionConfirmation?: {
    confirmedBy?: string;
    confirmedAt: string;
    note?: string;
    evidence?: ExternalResourceRef[];
  };
};
```

Model guidance:

- `orgId` and `proposalId` link accountability to the governance record.
- `responsibleParty.walletAddress` is an identity reference, not proof that the wallet accepted responsibility unless a future mechanism models that acceptance.
- `dueDate` is an accountability expectation, not a protocol timelock unless explicitly linked to protocol state.
- `linkedTransaction.observedStatus` is an observation, not a governance authorization claim.
- `manualUpdates` must be append-only or history-preserving in future implementation.
- `completionConfirmation` is a confirmation record, not automatic proof of correctness.

## Integration Preview

### Purpose

The Integration Preview connects external governance tools to the IsoniaOS lifecycle without pretending those tools are automatically authoritative.

Initial integration preview scope:

- Snapshot proposal link/import preview;
- Safe transaction proof link;
- Tally/Agora proposal link;
- Discourse/GitHub context links;
- block explorer transaction proof links;
- source labels;
- trust-boundary warnings.

The preview should support link-first behavior and selected metadata import later. It should not require external integrations before the accountability model is useful.

### External resource relation types

Recommended relation values:

```text
discussion
proposal_context
offchain_vote
execution_proof
transaction_proof
implementation_artifact
manual_evidence
```

### Source labels

Suggested source labels:

```text
Contract state
Onchain transaction
External platform
Imported preview
Manual evidence
Discussion context
Implementation artifact
```

Source labels should be visible near imported or linked data, especially on public pages.

### Conceptual external resource model

This is a conceptual model, not a committed runtime DTO.

```ts
type ExternalResource = {
  id: string;
  orgId: string;
  proposalId?: string;
  decisionRecordId?: string;
  accountabilityRecordId?: string;

  provider:
    | "snapshot"
    | "safe"
    | "tally"
    | "agora"
    | "discourse"
    | "github"
    | "block_explorer"
    | "custom";

  relation:
    | "discussion"
    | "proposal_context"
    | "offchain_vote"
    | "execution_proof"
    | "transaction_proof"
    | "implementation_artifact"
    | "manual_evidence";

  url: string;
  canonicalRef?: string;
  title?: string;
  sourceLabel: string;

  trustBoundary:
    | "onchain_observation"
    | "external_platform_record"
    | "manual_context"
    | "import_preview"
    | "unverified_link";

  authorityClaim:
    | "none"
    | "context_only"
    | "evidence_only"
    | "source_authoritative_for_external_field"
    | "contract_authoritative";

  observedAt?: string;
  importedAt?: string;
  importedBy?: string;
  verificationMethod?: string;
  rawMetadataPreview?: Record<string, unknown>;
};
```

Model guidance:

- `provider` identifies the external tool or source family.
- `relation` explains why the resource is attached.
- `sourceLabel` is user-facing attribution.
- `trustBoundary` explains how the data should be read.
- `authorityClaim` must default to `none`, `context_only`, or `evidence_only`.
- `contract_authoritative` should be used only for records that directly represent contract state or verified onchain interpretation, not generic external links.
- `rawMetadataPreview` is for preview/import diagnostics. It must not be rendered as trusted user-facing truth without field-level review.

### Provider preview scope

Snapshot:

- link to Snapshot proposals;
- preview/import selected metadata later where safe;
- show Snapshot as offchain signal/context unless explicitly modeled otherwise;
- show source, import time, and stale/error state when imported.

Safe:

- link to Safe transaction or queue/execution records as execution evidence;
- show transaction hash, Safe transaction hash, status, and observed time where available later;
- do not treat a Safe transaction as automatic proof that IsoniaOS governance authorized it;
- compare to approved payload only when explicit verification exists.

Tally/Agora:

- link to external proposal pages;
- preview/import proposal status or metadata later;
- treat as governance UI/indexing context;
- authority depends on the underlying contracts and source modeling.

Discourse/GitHub:

- link discussions, issues, pull requests, commits, releases, or implementation artifacts;
- treat as discussion or implementation context;
- do not treat as governance authority.

Block explorers:

- link transaction, address, contract, and event views;
- use as transaction observation/proof links;
- authority depends on chain finality, contract interpretation, and confirmation/indexing policy.

Custom:

- allow clearly labeled custom links for manual evidence;
- default to unverified link or manual context.

## Trust-boundary guidance

| Source | Typical v0.8 use | Trust boundary | Required warning posture |
| --- | --- | --- | --- |
| Contract state | Proposal lifecycle, approvals, veto, queue, execution, cancellation, organization lifecycle. | Authoritative for modeled onchain governance state. | Show unsupported/stale read-model states where needed. |
| Snapshot | Offchain proposal or vote signal/context. | External platform record. | Offchain signal/context unless explicitly modeled otherwise. |
| Safe | Proposed, queued, signed, submitted, or executed transaction evidence. | External platform record plus onchain transaction observation where available. | Evidence of transaction workflow, not automatic proof of governance authorization. |
| Tally/Agora | External proposal UI/indexing context. | External platform record backed by underlying contracts where applicable. | Authority depends on underlying contracts and source modeling. |
| Discourse/GitHub | Discussion, implementation, review, issue, PR, commit, or release context. | Discussion or implementation context. | Not governance authority. |
| Block explorer | Transaction observation/proof link. | Onchain observation through explorer/indexer. | Authority depends on chain and contract interpretation. |
| Manual update | Operator note, status update, failure reason, completion confirmation, manual evidence. | Manual accountability annotation. | Useful for accountability, not protocol truth. |

Suggested warning copy:

```text
This record is linked evidence. It does not override contract state.
```

```text
This external status comes from an imported preview. Verify the source before treating it as complete.
```

```text
This manual update is an accountability annotation, not onchain governance state.
```

## Historical decision records

### Purpose

A decision record is the durable public narrative of a proposal outcome.

It should combine authoritative state, read-model summaries, metadata, accountability annotations, and evidence links into one historical record. It should make clear which fields are contract-derived, which are derived display summaries, which are imported, and which are manual annotations.

### Required content

A decision record should include:

- proposal reference;
- decision result;
- vote/approval summary;
- execution requirement;
- responsible party;
- due date if applicable;
- evidence/proof links;
- final outcome;
- failure or cancellation reason when applicable;
- historical timestamps.

### Conceptual decision record model

This is a conceptual model, not a committed runtime DTO.

```ts
type DecisionRecord = {
  id: string;
  orgId: string;
  proposalId: string;

  decisionResult:
    | "approved"
    | "rejected"
    | "cancelled"
    | "expired"
    | "executed"
    | "failed"
    | "unknown";

  approvalSummary?: {
    requiredApprovals?: string[];
    collectedApprovals?: string[];
    vetoState?: "none" | "vetoed" | "unknown";
    policyVersion?: string;
  };

  requiresExecution: boolean;
  accountabilityRecordId?: string;
  responsiblePartyLabel?: string;
  dueDate?: string;

  evidence: ExternalResourceRef[];

  finalOutcome?: {
    status: string;
    note?: string;
    reason?: string;
    recordedAt: string;
  };

  timestamps: {
    proposedAt?: string;
    decidedAt?: string;
    queuedAt?: string;
    executedAt?: string;
    archivedAt?: string;
  };
};
```

Decision record guidance:

- Decision records are presentation/accountability objects built from authoritative state plus annotations/evidence.
- They should preserve source labels and timestamps.
- They should not silently rewrite proposal history after later evidence appears.
- Corrections should be history-preserving.

## UX and route sketch

Routes below are sketches for future App Core and public archive work. They are not final runtime requirements.

Suggested public routes:

```text
/orgs/:orgSlug
/orgs/:orgSlug/archive
/orgs/:orgSlug/proposals/:proposalId
/orgs/:orgSlug/proposals/:proposalId/accountability
/orgs/:orgSlug/evidence/:externalResourceId
```

Suggested operator routes may mirror public routes with additional edit controls for accountability annotations:

```text
/orgs/:orgId/proposals/:proposalId/accountability/edit
/orgs/:orgId/evidence/new
```

UX rules:

- Source labels must be visible on imported or linked records.
- Trust warnings should be concise and near the relevant data.
- Contract state should be visually distinct from manual/external evidence.
- Missing, stale, unsupported, or unknown states should be explicit.
- Failure and cancellation reasons should not be hidden below unrelated metadata.
- Public pages should be shareable without implying production SaaS readiness.

## Relationship to storage and metadata

The archived v0.7 storage and metadata baseline remains the reference for schema versioning, user-facing metadata, CID registry direction, upload intents, and gateway policy.

v0.8 adds accountability and external-resource concepts that may later reference:

- proposal metadata;
- action metadata;
- attachment metadata;
- external evidence URLs;
- transaction proof links;
- manually attached proof.

These records should follow the same posture defined in [`../archive/v0.7/storage-and-metadata.md`](../archive/v0.7/storage-and-metadata.md): metadata and evidence help explain governance, but they do not redefine authority.

## Future implementation notes

When implementation starts in later tasks:

- shared DTOs should live in `@isonia/types` when they cross repositories;
- Control Plane APIs should return typed DTOs and preserve source/trust labels;
- App Core should not duplicate domain enums locally;
- manual updates should preserve history;
- imported external data should include provider, source label, import time, and stale/error states;
- external URL parsing should be adapter-based;
- runtime work should be tested separately from this docs baseline.

## Acceptance baseline

The v0.8 accountability and integration preview baseline is complete when future implementers can answer:

- why v0.8 follows v0.7 protocol hardening;
- how accountability becomes the product center;
- what the proposal-to-proof-of-execution wedge means;
- what Public Governance Archive includes and excludes;
- what Basic Accountability Dashboard includes and excludes;
- what Integration Preview includes and excludes;
- how Snapshot, Safe, Tally/Agora, Discourse/GitHub, block explorers, and manual records are labeled;
- which records are contract-derived, external, derived display state, or manual annotation;
- which fields a conceptual accountability record needs;
- which fields a conceptual external resource record needs;
- how historical decision records are built;
- why external records are evidence/context unless explicitly modeled as authority;
- which v0.8 claims are intentionally not made.
