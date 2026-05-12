# Control Plane v0.7 Roadmap

## Purpose

Control Plane should index and expose the new protocol states introduced by v0.7 while preserving deterministic read-model recovery.

v0.7 protocol work affects Control Plane because batch activation, lifecycle state, and bootstrap finalization must be visible to App Core and diagnostics.

## Current v0.6 role

Control Plane currently supports the demo-ready UX foundation through read models and diagnostics, including organization/proposal/state surfaces needed by App Core.

v0.7 should extend this without turning normal product pages into debug consoles.

## Current v0.7 status

Typed admin batch activation is the current v0.7 alpha baseline across the stack. Bootstrap finalization/admin handoff is still design-stage and must not be exposed as implemented until the protocol emits/indexes real lifecycle and finalization state.

## Required v0.7 read-model additions

### Organization lifecycle

Expose lifecycle state where supported:

```text
Created
Activating
Active
Finalized
Unknown/Unsupported
```

The exact enum should be aligned with `types`.

### Bootstrap finalization

Expose:

- whether bootstrap is finalized;
- finalization block/timestamp if available;
- finalizing actor if available;
- whether admin setup actions are still available.

Do not derive finalization from App Core wizard completion. Use the final protocol event, contract state, or both, depending on the implementation.

### Batch activation effects

Control Plane should reconstruct the same read model whether setup was done serially or through typed batches.

Requirements:

- per-item domain events remain source of truth where possible;
- batch summary events may enrich diagnostics;
- no implicit hidden state assumptions.

### Admin handoff status

Expose a user-understandable handoff status.

Possible states:

```text
not_started
activating
active_not_finalized
finalized
unsupported
```

Final naming should be defined in `types`.

For older contracts or pre-finalization releases, expose `unsupported` or `unknown`; do not fake finalized state.

### Policy/mandate change history

Where practical, enrich read models to support:

- policy rule history;
- mandate assignment history;
- post-finalization change visibility.

This may be partial in v0.7 depending on event availability.

## Diagnostics updates

Diagnostics should show:

- contract versions if available;
- lifecycle support;
- batch activation support;
- finalization support;
- last indexed finalization event;
- indexing status for new event families;
- unsupported ABI/state warnings.

Keep technical detail on diagnostics surfaces, not default product screens.

## API direction

Potential additions:

```text
GET /v1/orgs/:orgId/lifecycle
GET /v1/orgs/:orgId/bootstrap-status
GET /v1/orgs/:orgId/governance
GET /v1/diagnostics
```

The exact routes should match current Control Plane conventions.

## Compatibility

Control Plane should handle older contracts gracefully.

Expected behavior:

- expose `unsupported` or `unknown` where lifecycle/finalization is not available;
- do not fake finalized state;
- do not assume batch activation support;
- preserve v0.6 demo-stack behavior.

## Testing

Recommended checks:

- serial setup still indexes correctly;
- typed batch setup indexes equivalently;
- finalization event updates read model;
- post-finalization blocked actions do not create invalid read-model transitions;
- older contract ABI is handled gracefully.

## Sequencing

Control Plane implementation follows the `evm-contracts` and `types` finalization work.

Expected order:

```text
evm-contracts finalization event/state
  -> shared lifecycle/finalization types
  -> Control Plane indexing/read model
  -> App Core and demo-stack consumption
```

## Open questions

- Should lifecycle be derived from events, direct contract reads, or both?
- Should finalization status be cached per org or recomputed?
- Should batch summary events be stored for UX history?
- How much policy/mandate history is needed for v0.7?
