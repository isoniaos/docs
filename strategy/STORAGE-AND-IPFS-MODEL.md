# IsoniaOS Storage and IPFS Model

**Status:** Draft  
**Prepared date:** 2026-05-08

---

## 1. Purpose

This document records storage, IPFS, gateway, upload, CID registry, and abuse-prevention guidance for IsoniaOS.

It describes intended architecture and roadmap direction. It does not mean the full storage service, malware scanning, gateway allowlist, or encrypted attachment system is implemented today.

---

## 2. Core Rule: Never Expose IPFS/Kubo Write RPC Publicly

IsoniaOS should not expose Kubo/IPFS write RPC directly to browsers or the public internet.

Public users must not receive:

- a generic upload-any-file endpoint;
- a generic pin-any-CID endpoint;
- direct access to IPFS node admin APIs;
- direct access to IPFS node write RPC;
- unauthenticated write access to storage infrastructure.

All write paths should pass through an Isonia-controlled upload API that can authenticate, authorize, validate, limit, audit, and revoke local service access.

---

## 3. Isonia Storage Service

Isonia should use an `Isonia Storage Service` or equivalent upload service between App Core and underlying storage systems.

The storage service should:

- authenticate the requester;
- authorize the tenant, organization, and purpose;
- issue purpose-limited upload intents;
- enforce MIME type and size policies;
- validate structured JSON metadata;
- apply tenant and organization quotas;
- rate-limit upload attempts;
- record audit logs;
- register accepted CIDs;
- pin or store only accepted content;
- support unpin and takedown workflows for content under Isonia control.

Underlying storage may include IPFS, object storage, or both. The upload API is the governance boundary, not the raw storage backend.

---

## 4. Upload Intent Flow

Uploads should use an intent-based flow.

Recommended flow:

1. The client requests an upload intent with tenant, organization, purpose, expected MIME type, expected size, and optional schema type.
2. The storage service verifies the requester and checks policy.
3. The service returns a short-lived, purpose-limited upload target or token.
4. The client uploads the content through the approved path.
5. The service validates the received content.
6. Accepted content is stored or pinned.
7. The CID or storage reference is registered with purpose, owner, policy metadata, and audit information.
8. The application stores only registered references in governance records.

The service should reject uploads that do not match the declared intent.

---

## 5. Purpose-Based Upload Policies

Storage policies should be tied to explicit upload purposes.

Initial purposes may include:

- organization metadata;
- proposal metadata;
- proposal evidence;
- audit or report files;
- logos and images;
- future encrypted attachments.

Each purpose should define:

- allowed MIME types;
- maximum size;
- tenant or organization quota impact;
- whether JSON schema validation is required;
- whether binary scanning is required now or later;
- whether public gateway access is allowed;
- whether encryption is required;
- retention expectations;
- takedown and unpin behavior.

JSON metadata should be schema-validated before registration. SVG should be sanitized or restricted because it can carry active content. Binary malware scanning should be added before broad public binary uploads are allowed.

---

## 6. Quotas and Rate Limits

Upload paths should be quota-limited and rate-limited.

Recommended limits:

- per tenant;
- per organization;
- per user or wallet where applicable;
- per upload purpose;
- per time window;
- per file size;
- per aggregate storage use.

Quota and rate-limit failures should be explicit and auditable. Public users should not be able to use Isonia infrastructure as general-purpose file hosting.

---

## 7. Gateway Model

Gateways should be read-only for public users.

Preferred gateway behavior:

- serve registered or pinned CIDs only;
- avoid recursive public fetching where possible;
- use allowlist or no-fetch mode when supported;
- distinguish Isonia-served content from arbitrary IPFS network content;
- support abuse response for content served through Isonia-controlled gateways.

A public gateway should not imply that all IPFS content is endorsed, hosted, or controlled by Isonia.

---

## 8. CID Registry

Isonia should maintain a CID registry for content accepted through its storage service.

The registry should track:

- CID;
- tenant;
- organization;
- upload purpose;
- uploader identity or actor;
- MIME type;
- size;
- schema type or metadata type;
- creation time;
- source upload intent;
- pin or storage status;
- gateway serving status;
- related governance object;
- abuse or takedown status;
- audit log references.

Governance records should reference registered CIDs or storage references where possible, not arbitrary user-supplied CIDs.

---

## 9. Abuse Prevention

The storage model should prevent Isonia infrastructure from becoming anonymous file hosting or a public pinning service.

Controls should include:

- authentication;
- authorization;
- upload intent;
- purpose limits;
- MIME type restrictions;
- file size limits;
- quotas;
- rate limits;
- JSON schema validation;
- SVG sanitization or SVG restriction;
- malware scanning for binaries later;
- CID registry;
- audit logs;
- takedown review;
- unpin workflow for content under Isonia control;
- gateway allowlist or no-fetch behavior where possible.

Public users must not receive a generic "pin this CID" feature. Linking to an external CID may be allowed later with clear trust labeling, but Isonia-controlled pinning should remain policy-governed.

---

## 10. Privacy and Encryption

Sensitive or private documents should not be uploaded to public IPFS unencrypted.

Guidance:

- assume public IPFS content may be copied;
- avoid storing personal, confidential, privileged, or regulated data in public unencrypted content;
- support encrypted attachments as a future milestone;
- keep encryption keys outside public metadata;
- label public versus private storage behavior clearly;
- avoid implying that unpinning removes all copies from the network.

Self-hosted deployments may choose stricter private storage backends for sensitive workflows.

---

## 11. Retention and Deletion Reality

IPFS unpinning or gateway removal can stop Isonia-controlled infrastructure from serving content, but it cannot guarantee global deletion if the content was copied, cached, or pinned elsewhere.

Docs and UI should avoid claims such as:

```text
Delete from IPFS
```

Prefer precise language:

```text
Unpin from Isonia-controlled storage and remove from Isonia gateway serving.
```

Retention policies should distinguish:

- Isonia-controlled pins or object storage;
- Isonia-controlled gateways;
- third-party gateways;
- browser caches;
- other public IPFS nodes;
- external archives.

---

## 12. Future Milestones

### Storage API

Define authenticated upload, retrieval, registration, unpin, and takedown APIs.

### Upload Intent Service

Create short-lived purpose-limited upload intents with tenant, organization, MIME type, size, and schema constraints.

### CID Registry

Track accepted CIDs, purpose, ownership, policy metadata, pin state, gateway state, and abuse status.

### Gateway Allowlist/No-Fetch Mode

Configure gateways to serve registered content where possible and avoid becoming a public arbitrary IPFS fetcher.

### Metadata Schema Validation

Validate organization metadata, proposal metadata, evidence metadata, and audit/report JSON before registration.

### Encrypted Attachments

Support encrypted attachments for sensitive governance workflows without storing private content publicly in plaintext.

---

## 13. Non-Goals

This document does not define or claim:

- general-purpose file hosting;
- anonymous uploads;
- public pin-by-CID service;
- guaranteed global deletion from IPFS;
- storing sensitive data unencrypted;
- production malware-scanning coverage today;
- legal, compliance, or audit readiness.
