# Authority Model

IsoniaOS must make authority visible and scoped.

The core rule is:

```text
Contracts are authoritative for modeled onchain governance state.
```

Everything else must be labeled by source and trust boundary.

## Contract authority

Contracts can be authoritative for:

- organization creation and activation when contract-backed;
- role assignment when contract-backed;
- proposal submission;
- approvals and vetoes;
- voting outcomes;
- queueing and timelocks;
- execution;
- cancellation;
- lifecycle state.

If a field is not modeled by contracts, the UI should not present it as contract truth.

## Control Plane authority

Control Plane indexes, projects, diagnoses, and exposes data.

It can lag, fail, be rebuilt, or become stale. It is not the source of governance authority unless a specific contract or integration explicitly gives it authority for a scoped action.

## App Core authority

App Core helps users inspect and interact with governance.

It is not final authority over governance state. It should show where data came from and whether it is contract-derived, imported, linked, manual, stale, unsupported, or unknown.

## External records

External records are useful but scoped:

- Snapshot is authoritative for its own offchain vote records.
- Safe is authoritative for Safe transaction state.
- Tally, Agora, and Governor systems are authoritative within their own source models.
- GitHub is authoritative for repository and pull request state.
- Discourse or forums are authoritative for their own discussion records.
- Block explorers show chain observations, not governance authority by themselves.

External records do not override IsoniaOS contract state unless a reviewed model explicitly says so for a specific field.

## Manual accountability

Manual accountability updates are annotations.

They can record responsible parties, status, reasons, completion notes, and evidence, but they are not protocol truth.

## Client contract authority

When IsoniaOS governs client contracts, authority must be organization-scoped and explicit.

IsoniaOS should not create a global operator or protocol superadmin that can operate all customer contracts.

For governed execution, the public record should explain:

- which organization authorized the action;
- which proposal or policy route authorized it;
- which executor or authority called the target;
- which target and selector were called;
- what value and calldata hash were committed;
- what transaction executed the call;
- what evidence is linked.
