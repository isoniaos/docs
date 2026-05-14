# Storage and Metadata

## Purpose

v0.7 should define metadata and storage schemas without building a full public IPFS upload service.

The goal is to establish safe, structured, and future-compatible metadata models for organizations, proposals, and actions.

## Hard rule

Never expose Kubo/IPFS write RPC publicly.

IsoniaOS must not become generic public file hosting.

## Future Isonia Storage Service principles

A future storage service should use:

- authenticated upload intents;
- purpose-limited uploads;
- quotas;
- CID registry;
- gateway allowlist/no-fetch posture;
- schema validation;
- abuse/takedown/unpin workflow;
- encryption for sensitive/private data.

## Metadata types

v0.7 should define schemas for:

- organization metadata;
- proposal metadata;
- action metadata.

It should also define the upload intent model, CID registry model, gateway policy, and privacy/encryption guidance. It should not ship or imply a production storage service.

## Organization metadata

Potential fields:

```json
{
  "schema": "isonia.org.metadata.v1",
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

Guidelines:

- keep public organization metadata non-sensitive;
- validate URL fields;
- validate CID fields;
- avoid storing private governance data in public metadata.

## Proposal metadata

Potential fields:

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

Guidelines:

- proposal metadata should be human-readable;
- external links should be explicit;
- attachments should be purpose-limited;
- unsupported content should not be silently accepted.

## Action metadata

Potential fields:

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

Guidelines:

- metadata should help users understand executable intent;
- metadata must not be treated as execution truth;
- on-chain target/value/calldata remain authoritative for execution;
- `calldataHash` identifies the encoded calldata, not the explanatory metadata;
- `metadataCid` or `actionMetadataHash` identifies explanatory metadata, not the executable payload;
- mismatch warnings should be displayed where possible.
- hidden late-bound execution values should be rejected in the first MVP.

## Upload intent model

A future upload should start with an authenticated intent.

Possible fields:

```json
{
  "purpose": "proposal-metadata",
  "contentType": "application/json",
  "schema": "isonia.proposal.metadata.v1",
  "maxBytes": 65536,
  "expiresAt": "2026-01-01T00:00:00.000Z"
}
```

The service should validate:

- user/workspace authorization;
- upload purpose;
- schema;
- file size;
- content type;
- abuse constraints.

## CID registry model

A future registry should track:

- CID;
- purpose;
- schema version;
- uploader/workspace reference;
- creation time;
- pin status;
- takedown/unpin status;
- linked organization/proposal/action when applicable.

## Gateway policy

Recommended posture:

- gateway allowlist;
- no arbitrary remote fetch by default;
- no generic file browsing;
- no public write RPC;
- strict content-type handling.

## Privacy and encryption guidance

Sensitive/private data should not be written to public IPFS as plaintext.

For private governance data, future design should consider:

- client-side encryption;
- organization-scoped keys;
- role-based decryption access;
- explicit retention policy;
- clear warning when data is public.

## v0.7 non-goal

v0.7 should not build a production storage service unless explicitly reprioritized.

The v0.7 deliverable is the schema and architecture direction.
