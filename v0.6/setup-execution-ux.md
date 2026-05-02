# IsoniaOS v0.6 Setup Execution UX

## Purpose

Make setup execution transparent and recoverable.

The user should understand the difference between:
- signing a transaction;
- transaction submitted;
- transaction mined;
- event indexed;
- projection applied;
- read model visible.

## Action states

Recommended setup action states:
- draft;
- ready;
- blocked;
- signing;
- submitted;
- mined;
- indexing;
- indexed;
- projected;
- completed;
- failed;
- timed_out;
- skipped.

## Action card

Each action should show:
- sequence number;
- action kind;
- human-readable description;
- dependency status;
- transaction hash if submitted;
- mined block if available;
- indexed entity id if available;
- current state;
- retry or recovery guidance.

## Setup progress summary

Show:
- total actions;
- completed actions;
- failed actions;
- blocked actions;
- current action;
- last transaction hash;
- indexer/projection status if available.

## Timeout handling

If a transaction is mined but read model does not update within timeout, show:
- tx hash;
- receipt block number if available;
- Control Plane latest block;
- Control Plane safe block;
- indexer last processed block;
- projection backlog;
- link to diagnostics.

The message should not imply that the transaction failed if it was mined successfully.

## Retry behavior

For v0.6, retry can be conservative:
- if not submitted, allow signing again;
- if submitted but unknown, recheck receipt;
- if mined but not indexed, recommend diagnostics/reindex;
- if action failed on chain, show failure and do not auto-retry.

## Local development helper

For chainId 31337 only, app-core may show development helpers if supported:
- refresh diagnostics;
- recheck transaction;
- link to local troubleshooting;
- optional local time/block controls in proposal lifecycle, not necessarily setup.

## Non-goals

- automatic recovery from every possible failure;
- production-grade job orchestration;
- background transaction relayer;
- SaaS transaction queue;
- Safe transaction batching.
