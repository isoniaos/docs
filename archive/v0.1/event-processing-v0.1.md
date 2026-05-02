# IsoniaOS v0.1 — Event Processing Spec

## Goal

Provide reliable blockchain event processing under RPC failures, duplicates, reorgs, and worker restarts.

## Guarantees

- at-least-once ingestion
- idempotent processing
- replayable projections
- duplicate-safe event handling
- reorg-aware ingestion
- observed vs confirmed data states

## Event identity

Logical event identity:

- `chainId`
- `txHash`
- `logIndex`

Physical raw log identity:

- `chainId`
- `blockHash`
- `txHash`
- `logIndex`

## Processing flow

1. Fetch logs from RPC
2. Write the raw event to `raw_events`
3. Deduplicate by the logical event key
4. The projection worker claims an unprocessed row with `FOR UPDATE SKIP LOCKED`
5. The projection worker applies the event inside the same database read-model transaction
6. Mark the event as processed
7. Rebuild the affected range on reorg

## Required tables

- `raw_events`
- `event_processing_state`
- materialized read model tables

## Idempotency rule

Reprocessing the same event must not change the final state beyond the first successful application.
Org-scoped read models must include `orgId` in their write identity so duplicate IDs in different organizations remain isolated.

## Finality model for v0.1

- `observed`
- `confirmed`

## Replay requirement

Every projection must be rebuildable from raw blockchain events.

## Diagnostics

`GET /v1/diagnostics` reports operator-facing event processing state:

- raw event counts by `observed`, `confirmed`, `processed`, `failed`, and `orphaned`;
- projection backlog for confirmed, unprocessed raw events;
- failed projection count and latest projection error summary;
- latest safe block and per-contract scan cursors so indexer lag can be distinguished from expected confirmation delay.

Diagnostics are read-only and must not become a governance authority source.

## Anti-patterns

- do not treat websocket subscription as the only transport layer
- do not build projections without a raw event store
- do not store only the latest state without a replay source
