# Accountability And Evidence

Accountability records connect a governance decision to follow-through.

## Accountability Record

A record can describe:

- the decision or proposal it belongs to;
- the responsible party;
- due date or expected completion window;
- execution status;
- linked transaction hash;
- external evidence;
- manual updates;
- completion confirmation;
- failure or cancellation reason;
- source disclosure and data status.

Manual updates are annotations. They are useful for coordination, but they do not become protocol truth by being written into a UI.

## Evidence

Evidence can include:

- onchain transactions;
- block explorer links;
- Safe transaction links;
- Snapshot, Tally, Agora, GitHub, Discourse, or other public records;
- uploaded or linked milestone proof;
- manual completion notes.

Each source should show its label, trust boundary, import status, and verification method where available.

## Verification

Verification asks which source supports the claim.

| Claim | Stronger source |
| --- | --- |
| A modeled proposal executed | Contract event and execution receipt. |
| A transaction occurred | Chain transaction and block explorer record. |
| A grant milestone was reported | Linked external evidence and manual confirmation. |
| A provider record exists | Provider URL or imported provider metadata. |
| A UI view is current | Control Plane diagnostics and data status. |

External records are evidence or context unless the protocol or documented product model explicitly gives that source authority for a field.
