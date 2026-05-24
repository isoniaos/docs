# Trust Boundaries

IsoniaOS is governance infrastructure. It must be clear about what is authoritative, what is explanatory, what is evidence, and what is unknown.

## Source labels

Public pages should make source labels visible near relevant data:

- Contract state
- Onchain transaction
- External platform
- Imported preview
- Manual evidence
- Discussion context
- Implementation artifact

## External evidence posture

The initial integration posture is link-first.

Examples:

- Snapshot proposal link;
- Safe transaction link;
- Tally or Agora proposal link;
- Discourse discussion link;
- GitHub pull request link;
- block explorer transaction link;
- custom evidence link.

Linked evidence is useful. It does not override contract state.

## Import and sync posture

When external metadata is imported or synced, the docs and UI should show:

- provider;
- relation to the governance record;
- last sync or import time;
- stale, failed, missing, unsupported, or unknown state;
- verification status where available.

If an integration cannot verify a field, it must not silently present that field as authority.

## Manual updates

Manual updates should be clearly labeled as accountability annotations.

Suggested wording:

```text
This manual update is an accountability annotation, not onchain governance state.
```

## AI outputs

AI output should be labeled advisory and source-limited.

AI must not vote, execute, approve or reject proposals, invalidate proposals as final authority, perform binding arbitration, or mark obligations complete without human/community confirmation.

## Security posture

Security and audit claims require scoped evidence.

Public docs should avoid broad statements like "IsoniaOS is secure." Prefer precise claims about the current scope, limitations, and reviewed components.

## Current normalization

The current workspace cycle is normalizing source boundaries, external evidence models, and diagnostics. Public docs should not imply full provider automation or production control over high-value workflows.
