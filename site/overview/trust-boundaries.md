# Trust Boundaries

IsoniaOS separates authority, projections, evidence, annotations, and provider records.

## Onchain contract state

Onchain contract state is authoritative only for the fields and actions the contracts model.

Contract state may include organization state, roles, permissions, proposal state, approvals, vetoes, timelocks, and execution events depending on the deployed contract design.

## Indexed and read-model state

Indexed state and projections are read models.

They can lag, fail, need backfill, or be affected by reorg handling. UIs and APIs should expose stale, error, unknown, and last-synced states instead of hiding indexing uncertainty.

## External evidence

External evidence includes URLs, transactions, attestations, pull requests, forum threads, reports, and provider records.

Evidence should include source labels, timestamps when available, verification status, and links back to the source.

## Manual annotations

Manual annotations include status notes, responsibility updates, blocker notes, completion notes, and review comments.

They are useful for accountability, but they are not protocol truth unless a specific governance process models them as authoritative.

## Integration and provider records

Provider records may be linked, imported, synced, or verified.

IsoniaOS should distinguish:

- linked: a user supplied a reference;
- imported: metadata was fetched once or periodically;
- synced: external state is refreshed over time;
- verified: source-specific checks confirm expected relationships.

No provider-completeness claim is made by the existence of an adapter or link.

## Stale, error, and unknown states

Every integration and read model should be able to represent:

- stale data;
- failed fetch or projection;
- missing source data;
- unsupported provider behavior;
- unknown status;
- mismatch between expected and observed evidence.

These states are part of the trust model, not edge-case UI copy.
