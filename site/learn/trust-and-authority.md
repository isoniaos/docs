# Trust And Authority

IsoniaOS should show where a claim comes from and how much authority that source has.

## Core Rule

Different sources answer different questions.

| Source | Good for | Boundary |
| --- | --- | --- |
| Contract-backed state | Modeled onchain facts. | Only covers what the contracts model. |
| Control Plane | Indexing, read models, diagnostics, and APIs. | Can lag, fail, or show stale data. |
| App Core | Viewing state and starting configured wallet interactions. | It is an interface, not the final authority. |
| External record | Evidence or context from another tool. | Does not override IsoniaOS authority by default. |
| Manual note | Explanation, status, or review comment. | Is an annotation unless verified another way. |

## Why This Matters

If a page shows "complete," users need to know what supports that status. Was it a contract event, a transaction receipt, an external record, a reviewer note, or a manual update?

The answer changes how much confidence a participant should have.

## Data Status

IsoniaOS records should preserve status such as:

- current;
- stale;
- missing;
- failed;
- unknown;
- manually entered;
- externally linked;
- verified for a specific claim.

Unknown should remain visible as unknown.

## Example

Community Grants DAO sees a grant marked complete. The record should show whether completion is based on a transaction, a linked deliverable, a reviewer confirmation, or only a manual note.

That distinction keeps the governance memory honest.
