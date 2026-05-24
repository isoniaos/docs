# Authority Model

IsoniaOS must make authority visible.

## Contracts

Contracts are authoritative for modeled onchain governance state.

Examples include contract-backed organization state, roles, permissions, proposal lifecycle events, approvals, vetoes, timelocks, and execution state when those concepts are implemented in contracts.

## Control Plane

Control Plane is an indexer, projector, explainer, diagnostics layer, and read API.

It reads chain events, builds replayable projections, normalizes external evidence, and serves application-facing data. It is not governance authority unless a specific protocol design explicitly gives it authority for a specific field or action.

## App Core

App Core is a local and self-hostable governance console.

It can read IsoniaOS data, help users prepare actions, submit transactions through wallets, display evidence, and explain status. It is not governance authority. The UI must not silently convert display state into protocol truth.

## SDK and types

The SDK and shared types are interface layers.

They define how applications, services, and scripts interact with contracts, Control Plane APIs, and shared data models. They do not create authority by themselves.

## External records

External records are evidence or context unless explicitly modeled as authority for a specific field.

Examples:

- Snapshot records are source records for Snapshot proposals and votes.
- Safe records are source records for Safe transaction state.
- GitHub records are source records for issues, commits, and pull requests.
- Block explorers are views into chain data.
- Forums are source records for discussion context.

Provider records must keep source labels, sync status, and trust boundaries visible.

## Manual accountability updates

Manual accountability updates are annotations, not protocol truth.

They are useful for public accountability, progress reporting, blockers, completion notes, and evidence links. They must not override contract state or verified external records without explicit modeling and review.
