# IsoniaOS v0.1 — Event Processing Spec

## Goal
Обеспечить надёжную обработку blockchain events при сбоях RPC, дубликатах, reorg и рестартах воркеров.

## Guarantees
- at-least-once ingestion
- idempotent processing
- replayable projections
- duplicate-safe event handling
- reorg-aware ingestion
- observed vs confirmed data states

## Event identity
Каждое событие uniquely identified by:
- `chainId`
- `blockNumber`
- `txHash`
- `logIndex`

## Processing flow
1. Получить логи из RPC
2. Записать raw event в `raw_events`
3. Deduplicate по уникальному event key
4. Projection worker применяет event в read model транзакции БД
5. Пометить event processed
6. При reorg уметь rebuild affected range

## Required tables
- `raw_events`
- `event_processing_state`
- materialized read model tables

## Idempotency rule
Повторная обработка одного и того же события не должна менять конечный state сверх первого применения.

## Finality model for v0.1
- `observed`
- `confirmed`

## Replay requirement
Любая projection должна быть rebuildable из raw blockchain events.

## Anti-patterns
- не считать websocket subscription единственным transport layer
- не строить projections без raw event store
- не хранить только latest state без replay source

