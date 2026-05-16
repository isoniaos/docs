# Storage and Metadata

## Purpose

v0.7 defines the storage and metadata schema baseline for future IsoniaOS metadata workflows.

This document is a design baseline only. It does not implement or imply a production storage service, upload API, IPFS pinning service, gateway service, encryption/key management system, or malware scanning pipeline.

The baseline exists so future App Core, Control Plane, Proposal Action Builder, storage, gateway, and public governance archive work can share the same object taxonomy, trust boundaries, validation posture, and non-goals.

## Hard rules

- Never expose Kubo/IPFS write RPC publicly.
- Do not turn IsoniaOS into generic public file hosting.
- Do not treat metadata as governance authority.
- Do not rely on CID obscurity for privacy or access control.
- Do not upload plaintext secrets, sensitive personal data, or confidential governance material to public IPFS.

## Metadata object taxonomy

v0.7 defines the following object types:

| Object | Purpose | Trust boundary |
| --- | --- | --- |
| Organization metadata | Public explanatory profile for an organization. | User-facing metadata only. Protocol state remains authoritative for organization existence and governance authority. |
| Proposal metadata | Public explanatory record for a proposal's title, summary, body, references, and attachments. | Proposal lifecycle, approval, queue, cancellation, veto, and execution state come from protocol/read models. |
| Action metadata | Public explanatory record for one executable proposal action. | Explains intent, risk, simulation, and attachments. It does not define what executes. |
| Action intent | Canonical authoring object produced by the Proposal Action Builder for one EVM write call. | Used for review and verification. On-chain target, value, and calldata remain authoritative. |
| Attachment metadata | Purpose-limited metadata for files linked from organization, proposal, or action metadata. | Attachments may be unavailable, malicious, stale, or censored and must be rendered defensively. |
| Upload intent | Limited authorization for a future upload attempt. | Grants constrained upload permission only, not generic storage access. |
| CID registry entry | Operational record for known CIDs, pin state, takedown state, linkage, and encryption posture. | Registry records do not prove governance truth. |
| Gateway policy entry | Operational policy for serving known content through an IsoniaOS managed gateway. | Controls only IsoniaOS managed serving behavior, not public IPFS availability. |

Organization, proposal, and action metadata are user-facing explanatory records. They can be wrong, stale, unavailable, or censored.

Action intent explains executable intent. It must be compared against the authoritative execution payload. For on-chain execution, the authoritative values are the on-chain target, native value, and calldata.

UIs must warn when metadata is missing, unsupported, stale, unavailable, or mismatched against indexed execution data.

## Schema versioning

Schema identifiers use stable string names:

```text
isonia.organization.metadata.v1
isonia.proposal.metadata.v1
isonia.action.metadata.v1
isonia.action.intent.v1
isonia.attachment.metadata.v1
isonia.upload.intent.v1
isonia.cid.registry-entry.v1
isonia.gateway.policy-entry.v1
```

Rules:

- Breaking schema changes require a new version suffix.
- Additive optional fields may stay in the same major schema version.
- Writers should emit the latest supported schema for the object type.
- Readers must ignore unknown fields by default unless a field is security-sensitive or changes execution interpretation.
- Control Plane and App Core should expose unsupported schema states explicitly instead of silently accepting every object.
- Schema validation should reject objects with missing required fields, invalid required field types, invalid CID/URL/address/hash formats, or disallowed purpose/schema combinations.

## Common validation conventions

- `schema` is always required on user-facing metadata objects and must match the expected schema identifier for the object type.
- Operational objects that must also track uploaded content schema may use `intentSchema`, `entrySchema`, or `policySchema` for their own object version while preserving `schema` for the content schema being authorized or tracked.
- User-facing text must be bounded in length.
- User-facing text must be treated as untrusted input.
- Plain text is preferred. Markdown, where allowed, must be constrained and sanitized before rendering.
- URLs must be parsed and validated. HTTPS is preferred for external links.
- CID references must use `ipfs://...` format unless a future schema explicitly allows another URI scheme.
- Hex strings must be `0x` prefixed and length-checked for their field type.
- Timestamps should be ISO 8601 strings.
- Readers must preserve unknown states instead of inventing labels.

## Organization metadata

Schema:

```text
isonia.organization.metadata.v1
```

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `schema` | string | Must equal `isonia.organization.metadata.v1`. |
| `name` | string | Bounded length, plain text, no HTML requirement. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `description` | string | Bounded length. Plain text in v0.7; constrained markdown may be allowed later. |
| `avatarCid` | string or null | Must be an `ipfs://...` CID reference or null. |
| `website` | string | Valid URL. HTTPS preferred. |
| `links` | array | Bounded array of `{ "label": string, "url": string }`; labels and URLs must be bounded and validated. |
| `jurisdictionHint` | string or null | Nullable string. It is not a legal classification or verified legal claim. |
| `tags` | array | Bounded array of lowercase slugs. |

Example:

```json
{
  "schema": "isonia.organization.metadata.v1",
  "name": "Example DAO",
  "description": "A short public description.",
  "avatarCid": "ipfs://...",
  "website": "https://example.org",
  "links": [
    {
      "label": "Forum",
      "url": "https://forum.example.org"
    }
  ],
  "jurisdictionHint": null,
  "tags": ["dao", "protocol"]
}
```

Privacy guidance:

- Do not include private member data.
- Do not include secrets.
- Do not include internal governance negotiations.
- Do not include legal claims beyond a non-authoritative hint unless verified elsewhere.

## Proposal metadata

Schema:

```text
isonia.proposal.metadata.v1
```

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `schema` | string | Must equal `isonia.proposal.metadata.v1`. |
| `title` | string | Bounded length. Plain text. |
| `summary` | string | Short bounded summary. Plain text. |
| `body` | string | Bounded proposal body. Markdown may be allowed, but must be sanitized when rendered. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `rationale` | string | Bounded text explaining why the proposal exists. |
| `links` | array | Explicit labeled links with validated URLs. |
| `attachments` | array | Array of attachment metadata objects. |
| `externalDiscussionUrl` | string | Valid URL to external discussion. HTTPS preferred. |
| `authors` | array | Bounded display references. These are not necessarily identity truth. |
| `createdAt` | string | ISO 8601 timestamp. Explanatory only. |
| `updatedAt` | string | ISO 8601 timestamp. Explanatory only. |
| `language` | string | BCP 47-style language tag where practical. |

Example:

```json
{
  "schema": "isonia.proposal.metadata.v1",
  "title": "Increase contributor budget",
  "summary": "Short plain-language summary.",
  "rationale": "Why this proposal exists.",
  "body": "Full proposal text.",
  "links": [
    {
      "label": "Discussion",
      "url": "https://forum.example.org/t/..."
    }
  ],
  "attachments": []
}
```

Trust guidance:

- Proposal metadata is explanatory.
- Proposal lifecycle state comes from protocol events, contract reads, and deterministic read models.
- Proposal metadata must not be treated as proposal approval, veto, queue, execution, or cancellation truth.
- Missing or unsupported metadata must be visible to users.

## Action metadata

Schema:

```text
isonia.action.metadata.v1
```

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `schema` | string | Must equal `isonia.action.metadata.v1`. |
| `summary` | string | Bounded human-readable explanation of the action. |
| `actionIntent` | object | Must be a valid `isonia.action.intent.v1` object. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `riskNotes` | array | Bounded list of plain-language risk notes. |
| `simulation` | object | Simulation status object. |
| `links` | array | Explicit labeled links with validated URLs. |
| `attachments` | array | Array of attachment metadata objects. |
| `createdAt` | string | ISO 8601 timestamp. Explanatory only. |
| `updatedAt` | string | ISO 8601 timestamp. Explanatory only. |

Simulation status values:

```text
not_available
not_run
passed
failed
warning
stale
```

Example:

```json
{
  "schema": "isonia.action.metadata.v1",
  "summary": "Transfer 25,000 USDC to Core Contributors multisig.",
  "actionIntent": {
    "schema": "isonia.action.intent.v1",
    "chainId": 1,
    "target": "0x0000000000000000000000000000000000000000",
    "value": "0",
    "functionSignature": "transfer(address,uint256)",
    "args": [
      {
        "name": "recipient",
        "type": "address",
        "value": "0x0000000000000000000000000000000000000000",
        "display": "Core Contributors multisig"
      },
      {
        "name": "amount",
        "type": "uint256",
        "value": "25000000000",
        "display": "25,000 USDC"
      }
    ],
    "calldata": "0x...",
    "calldataHash": "0x...",
    "metadataCid": null
  },
  "simulation": {
    "status": "not_available",
    "provider": null,
    "checkedAt": null
  }
}
```

Clarifications:

- `actionIntent.calldataHash` identifies the encoded calldata or a clearly defined canonical calldata encoding.
- `metadataCid` or `actionMetadataHash` identifies explanatory metadata, not the executable payload.
- Metadata mismatch must be visible in App Core and Control Plane responses when detectable.
- Hidden late-bound execution values are not allowed in the first Proposal Action Builder MVP.

## Action intent

Schema:

```text
isonia.action.intent.v1
```

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `schema` | string | Must equal `isonia.action.intent.v1`. |
| `chainId` | number | Positive integer. |
| `target` | string | Valid EVM address. |
| `value` | string | Decimal string integer in wei. |
| `functionSignature` | string | Should match the ABI-selected write function. |
| `args` | array | Ordered ABI argument records preserving name, type, value, and optional display. |
| `calldata` | string | `0x` prefixed hex calldata. |
| `calldataHash` | string | `0x` prefixed reproducible hash derived from calldata or canonical action encoding. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `targetLabel` | string | Explanatory display label only. |
| `functionLabel` | string | Explanatory display label only. |
| `metadataCid` | string or null | Optional `ipfs://...` CID reference to explanatory metadata. |

Argument records should preserve:

| Field | Type | Validation |
| --- | --- | --- |
| `name` | string | ABI argument name when available. Empty or generated names must be shown as unknown/generated, not hidden. |
| `type` | string | ABI type. |
| `value` | unknown | Canonical literal value used for encoding. Hidden dynamic values are not allowed in the first MVP. |
| `display` | string | Optional explanatory display value. It is not execution truth. |

Trust guidance:

- Action intent is an authoring and review object.
- On-chain target, value, and calldata remain authoritative for execution.
- `display`, `targetLabel`, and `functionLabel` fields are explanatory only.
- Future readers must expose mismatch, unsupported schema, unsupported ABI, stale simulation, and missing metadata states.

## Attachment metadata

Schema:

```text
isonia.attachment.metadata.v1
```

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `schema` | string | Must equal `isonia.attachment.metadata.v1`. |
| `label` | string | Bounded plain-text label. |
| `cid` | string | `ipfs://...` CID reference. |
| `contentType` | string | Must be an allowed content type for the attachment purpose. |
| `sizeBytes` | number | Positive integer within the configured size limit. |
| `sha256` | string | `0x` prefixed SHA-256 hash of the attachment bytes. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `description` | string | Bounded public description. |

Example:

```json
{
  "schema": "isonia.attachment.metadata.v1",
  "label": "Budget spreadsheet",
  "cid": "ipfs://...",
  "contentType": "text/csv",
  "sizeBytes": 12345,
  "sha256": "0x...",
  "description": "Optional public description"
}
```

Guidance:

- Attachments are purpose-limited.
- Content type must be validated and enforced at render/serve time.
- Size must be bounded.
- Malware and abuse scanning may be future work.
- Private attachments must not be uploaded plaintext to public IPFS.

## Upload intent model

Intent object schema:

```text
isonia.upload.intent.v1
```

A future upload flow should start with an authenticated upload intent.

Required fields:

| Field | Type | Validation |
| --- | --- | --- |
| `intentSchema` | string | Must equal `isonia.upload.intent.v1`. |
| `purpose` | string | Must be one of the allowed purposes. |
| `contentType` | string | Must be allowed for the purpose and schema. |
| `schema` | string | Uploaded content schema. Must match the purpose. |
| `maxBytes` | number | Positive integer size limit. |
| `expiresAt` | string | ISO 8601 timestamp. Expired intents must be rejected. |

Optional fields:

| Field | Type | Validation |
| --- | --- | --- |
| `organizationId` | string | Linked organization where applicable. |
| `proposalId` | string | Linked proposal where applicable. |
| `actionId` | string | Linked action where applicable. |
| `allowedCidVersion` | number | CID version constraint, if needed. |
| `encryptionRequired` | boolean | Whether upload must be encrypted before acceptance. |

Allowed purposes:

```text
organization-metadata
proposal-metadata
action-metadata
attachment
avatar
```

Purpose/schema mapping:

| Purpose | Expected schema |
| --- | --- |
| `organization-metadata` | `isonia.organization.metadata.v1` |
| `proposal-metadata` | `isonia.proposal.metadata.v1` |
| `action-metadata` | `isonia.action.metadata.v1` |
| `attachment` | `isonia.attachment.metadata.v1` or purpose-specific binary policy |
| `avatar` | purpose-specific image policy |

Example:

```json
{
  "intentSchema": "isonia.upload.intent.v1",
  "purpose": "proposal-metadata",
  "schema": "isonia.proposal.metadata.v1",
  "contentType": "application/json",
  "maxBytes": 65536,
  "expiresAt": "2026-01-01T00:00:00.000Z",
  "organizationId": "1",
  "proposalId": "42",
  "encryptionRequired": false
}
```

Validation responsibilities:

- authenticate user/workspace;
- verify the purpose is allowed;
- verify schema matches purpose;
- verify file size is within limit;
- verify content type is allowed;
- verify expiration;
- enforce abuse constraints and quotas;
- enforce encryption requirement when needed.

Upload intent grants a limited upload for a specific purpose. It does not grant generic storage access, generic pinning access, arbitrary remote fetch, or Kubo/IPFS write RPC access.

## CID registry entry

Registry entry object schema:

```text
isonia.cid.registry-entry.v1
```

Fields:

| Field | Type | Validation |
| --- | --- | --- |
| `entrySchema` | string | Must equal `isonia.cid.registry-entry.v1`. |
| `cid` | string | `ipfs://...` CID reference or normalized CID value with explicit storage convention. |
| `purpose` | string | Upload purpose. |
| `schema` | string | Uploaded content schema, if applicable. |
| `contentType` | string | Validated content type. |
| `sizeBytes` | number | Positive integer. |
| `sha256` | string | `0x` prefixed SHA-256 hash. |
| `workspaceId` | string | Workspace reference where applicable. |
| `organizationRef` | string | Organization/workspace reference where applicable. |
| `linkedOrganizationId` | string or null | Linked organization ID where applicable. |
| `linkedProposalId` | string or null | Linked proposal ID where applicable. |
| `linkedActionId` | string or null | Linked action ID where applicable. |
| `uploadedBy` | string | Authenticated uploader reference. |
| `createdAt` | string | ISO 8601 timestamp. |
| `pinStatus` | string | One of the allowed pin status values. |
| `takedownStatus` | string | One of the allowed takedown status values. |
| `encryption` | string | One of the allowed encryption values. |

Pin status values:

```text
queued
pinned
failed
unpinned
```

Takedown status values:

```text
active
under_review
disabled
removed
```

Encryption values:

```text
public
client_encrypted
managed_encrypted
unknown
```

Clarifications:

- The registry is operational metadata.
- The registry does not prove governance truth.
- On-chain references, proposal records, and protocol state remain separate trust domains.
- A registry entry may help a managed gateway decide whether to serve content.
- A disabled or removed registry entry does not erase public IPFS content from the network.

## Gateway policy

Policy entry object schema:

```text
isonia.gateway.policy-entry.v1
```

Recommended managed gateway posture:

- no public write RPC;
- no arbitrary remote fetch by default;
- registry-backed serving or explicit allowlist;
- strict content-type validation;
- no generic file browser;
- documented cache controls;
- disabled, removed, or under-review CIDs are not served by the managed gateway unless an explicit internal review mode permits it;
- external gateways may still serve public IPFS content outside IsoniaOS control.

Example policy fields:

| Field | Type | Validation |
| --- | --- | --- |
| `policySchema` | string | Must equal `isonia.gateway.policy-entry.v1`. |
| `cid` | string | CID governed by the policy. |
| `serveStatus` | string | `allowed`, `disabled`, `under_review`, or `removed`. |
| `allowedContentType` | string | Content type expected for serving. |
| `cacheControl` | string | Explicit cache policy for the managed gateway. |
| `reason` | string | Optional operational reason. |
| `updatedAt` | string | ISO 8601 timestamp. |

Trust boundary:

IsoniaOS managed gateways can control IsoniaOS serving behavior. They cannot erase public IPFS content from the network or guarantee that external gateways will follow IsoniaOS policy.

## Privacy and encryption

### Public metadata

Public metadata is intended for public display.

Do not include:

- secrets;
- sensitive personal data;
- private negotiation material;
- confidential governance strategy;
- private legal or financial documents unless the organization has explicitly decided they are public.

Suggested warning copy:

```text
This metadata may be publicly accessible. Do not include secrets, private personal data, or confidential governance material.
```

### Private or sensitive data

For private or sensitive data:

- do not write plaintext to public IPFS;
- use client-side encryption or future managed encryption;
- treat key management as future work;
- do not rely on CID obscurity for access control;
- explain retention and deletion limitations before upload;
- make it clear that public networks and third-party gateways may retain already published plaintext content.

v0.7 does not define production encryption or key management. Any future encryption design must define key ownership, rotation, recovery, revocation, sharing, auditability, and failure modes before claiming sensitive-data readiness.

## Relationship to on-chain truth

Metadata is explanatory and operational. It must not redefine governance authority.

Authoritative sources:

- organization existence and lifecycle: protocol state and indexed protocol events;
- bodies, roles, mandates, and policy routes: protocol state and indexed protocol events;
- proposal lifecycle: protocol state and deterministic read models;
- executable payload: on-chain target, native value, and calldata;
- approvals, vetoes, queue, cancellation, and execution: protocol state and indexed protocol events.

Metadata can help users understand these sources, but it can be wrong or unavailable. App Core and Control Plane should expose this uncertainty directly.

## Future Control Plane responsibilities

Control Plane may later:

- validate metadata schemas;
- store CID registry entries;
- expose metadata status;
- expose mismatch warnings;
- enforce upload intent constraints;
- apply gateway and takedown policy for a managed gateway;
- expose unsupported, stale, unavailable, disabled, or removed metadata states;
- index on-chain metadata references where the protocol emits or stores them.

Control Plane must never treat metadata as execution truth.

## Future App Core responsibilities

App Core may later:

- render sanitized metadata;
- show missing, unsupported, stale, disabled, or unavailable metadata states;
- show public/private warnings before upload;
- show metadata/execution mismatch warnings;
- avoid fake labels;
- avoid hiding unknowns;
- expose raw target, value, calldata, calldata hash, and metadata reference details through technical disclosure.

App Core must not make explanatory metadata look more authoritative than protocol state or executable payloads.

## v0.7 non-goals

Do not include in v0.7 unless explicitly reprioritized:

- production storage service;
- upload API implementation;
- IPFS pinning implementation;
- public Kubo/IPFS write RPC;
- encryption/key management implementation;
- malware scanning implementation;
- managed gateway implementation;
- generic public file hosting;
- contract changes;
- SDK runtime changes;
- Control Plane runtime changes;
- App Core runtime changes;
- production readiness claims.

## Acceptance baseline

The v0.7 storage and metadata schema baseline is complete when future implementers can answer:

- which metadata object types exist;
- which organization metadata fields are required and optional;
- which proposal metadata fields are required and optional;
- which action metadata fields are required and optional;
- which action intent fields are required and optional;
- how attachments are modeled;
- how schemas are versioned;
- how metadata relates to on-chain/protocol truth;
- what upload intent allows and does not allow;
- what the CID registry tracks;
- how managed gateway policy behaves;
- what privacy and encryption warnings apply;
- what Control Plane and App Core may do later;
- what remains out of scope for v0.7.
