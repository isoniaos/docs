# Proposal Action Builder

## Purpose

The Proposal Action Builder is the future authoring surface for governance actions.

The current Action Anchor concept is not final. v0.7 should design the builder, not necessarily ship a full production implementation.

## Problem

Governance proposals often require executable actions. Raw calldata is dangerous and unreadable for most participants.

A governance operating system should help users understand:

- what contract will be called;
- which function will be called;
- which parameters will be passed;
- what value will be sent;
- what chain/execution context is involved;
- what risks or unknowns exist;
- how the final action hash was produced.

## v0.7 scope

Design only, unless explicitly reprioritized.

The v0.7 goal is to define:

- UX model;
- metadata model;
- ABI source model;
- human-readable action representation;
- simulation/dry-run strategy;
- future implementation boundaries.

## Candidate capabilities

### ABI import

Support future ABI sources:

- Etherscan-compatible explorer import;
- manual ABI paste;
- ABI JSON upload;
- verified contract metadata where available.

### NatSpec extraction

When ABI or verified metadata includes NatSpec, extract and display:

- function purpose;
- parameter descriptions;
- return values for read calls;
- warnings where available.

### Human-readable calldata

The builder should show a human-readable representation before proposal submission.

Example user-facing summary:

```text
Call Treasury.setSpendingLimit(
  token: USDC,
  monthlyLimit: 25,000 USDC,
  recipientGroup: Core Contributors
)
```

The exact representation depends on ABI and metadata availability.

### Human-readable `dataHash`

The builder should explain how `dataHash` is derived.

It should not force users to trust raw hashes without context.

Possible direction:

- show action summary;
- show canonical encoded calldata;
- show resulting hash;
- allow advanced users to expand technical detail.

### Multiple write calls

Future proposals may include multiple write calls.

Design should consider:

- ordered execution;
- dependency between calls;
- partial failure policy;
- transaction bundling limits;
- execution route compatibility.

### Read-call dependencies

Some actions may depend on values read at execution time.

Examples:

- use current treasury balance;
- use current token price from an oracle;
- use current role holder.

This creates late-bound execution concerns and must be designed carefully.

### Late-bound execution values

Late-bound values should be explicit and constrained.

Avoid hidden dynamic behavior that makes proposal meaning change unpredictably between approval and execution.

### Simulation and dry-run

Future builder should support:

- local/static validation;
- contract call simulation;
- Tenderly-like external simulation where integrated;
- chain-specific simulation adapters;
- warning when simulation is unavailable.

### Chain-specific explorer adapters

The builder should not hardcode one explorer.

Future adapter model:

- Etherscan;
- Basescan;
- Polygonscan;
- BscScan;
- Sourcify;
- other chain-specific metadata sources.

## UX principles

Default view:

- plain-language action summary;
- target contract identity;
- function name;
- important parameters;
- risk/unknown warnings.

Advanced view:

- ABI;
- encoded calldata;
- value;
- chain ID;
- target address;
- hash details;
- simulation trace if available.

Avoid:

- raw calldata as the primary interface;
- fake safety guarantees;
- unsupported production claims;
- hiding unknowns.

## Metadata relationship

The builder should produce or attach action metadata.

See [`storage-and-metadata.md`](./storage-and-metadata.md) for schema direction.

## Open questions

- Should the first implementation support a single write call first or multi-call first?
- Should manual ABI paste or explorer import come first?
- Which explorers should be supported first?
- Should simulation be required before submission or optional?
- Should unsupported dynamic or late-bound values be rejected or constrained initially?
- How should builder-generated metadata be stored and verified?
