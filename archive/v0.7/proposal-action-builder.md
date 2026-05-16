# Proposal Action Builder

## Purpose

The Proposal Action Builder is the future authoring surface for executable governance actions.

IsoniaOS treats governance as a lifecycle, not a vote. The builder should help a DAO understand executable actions before those actions are approved or executed.

v0.7 defines the design baseline. It does not ship a full production implementation unless explicitly reprioritized.

## Problem

Governance proposals often require executable EVM calls. Raw calldata is dangerous and unreadable for most participants.

A governance operating system should help users understand:

- what chain the action targets;
- what contract will be called;
- which function will be called;
- which parameters will be passed;
- what native value will be sent;
- what risks or unknowns exist;
- whether simulation was available and current;
- how the final calldata or action hash was produced;
- whether explanatory metadata matches the executable payload.

## v0.7 design baseline

The first implementation after the v0.7 design phase should support one EVM write call per proposal action.

The first MVP should support:

- one target chain ID;
- one target contract address;
- one native value field;
- one ABI-selected write function;
- static literal parameter values;
- encoded calldata preview;
- calldata hash preview;
- action intent metadata;
- explicit warning states;
- optional simulation status.

The first MVP should not support:

- multi-call bundles;
- hidden dynamic or late-bound values;
- explorer import as a required dependency;
- Tenderly, Safe, or other provider integration as a required dependency;
- production storage service;
- production audit readiness claims.

## Why single-call first

Single-call is the recommended first MVP because it is:

- safer to review;
- easier to explain in App Core;
- easier to simulate;
- easier to hash and verify;
- easier to compare against metadata;
- easier for Control Plane to summarize;
- less exposed to dependency ordering and partial failure concerns.

Multi-call bundles remain a future design area. v0.7 should not force multi-call semantics into the first authoring model.

## ABI source priority

The MVP ABI source priority is:

1. manual ABI paste or JSON upload;
2. verified explorer import through chain-specific adapters later;
3. Sourcify or verified metadata import later;
4. NatSpec enrichment when available.

Manual ABI paste/upload comes first because it is chain-neutral and does not depend on explorer API coverage, API keys, rate limits, or verification status.

Explorer import should be adapter-based in the future. Do not hardcode one explorer as the builder's authority.

NatSpec should enrich human-readable context when available, but the MVP must not depend on NatSpec existing.

## Human-readable action representation

Raw calldata must not be the primary user interface.

### Default view

The default review view should show:

- chain ID;
- target contract address;
- optional target label;
- function name;
- function signature;
- ETH/native value;
- decoded parameters;
- human-readable parameter display where metadata exists;
- warnings for unknown labels;
- warnings for unverified or manually supplied ABI;
- warnings for non-zero payable value;
- future warnings for delegatecall-like or proxy-related risks where relevant;
- resulting calldata hash or action hash.

Example:

```text
Call Treasury.setSpendingLimit(
  token: USDC,
  monthlyLimit: 25,000 USDC,
  recipientGroup: Core Contributors
)
```

The exact display depends on ABI and metadata availability. Unknown labels must remain visible as unknown; the UI should not invent labels.

### Advanced view

The advanced technical disclosure should show:

- raw ABI fragment;
- encoded calldata;
- raw parameter values;
- target address;
- native value;
- chain ID;
- hash preimage or canonical encoding explanation;
- simulation result when available.

This view exists for advanced verification. It should not replace the plain-language review.

## Canonical action intent object

The builder should produce an action intent object for metadata and review.

Proposed shape:

```json
{
  "schema": "isonia.action.intent.v1",
  "chainId": 1,
  "target": "0x0000000000000000000000000000000000000000",
  "value": "0",
  "functionSignature": "transfer(address,uint256)",
  "args": [
    {
      "name": "recipient",
      "type": "address",
      "value": "0x0000000000000000000000000000000000000000",
      "display": "Core Contributors multisig"
    },
    {
      "name": "amount",
      "type": "uint256",
      "value": "25000000000",
      "display": "25,000 USDC"
    }
  ],
  "calldata": "0x...",
  "calldataHash": "0x...",
  "metadataCid": null
}
```

This object is an authoring and metadata model. It is not execution truth.

For on-chain execution, the authoritative payload remains the on-chain target, value, and calldata. Metadata can explain the payload, but it must not replace it.

The UI should warn if action intent metadata diverges from the executable payload.

## Hash and verification model

The builder should distinguish three concepts:

- `calldataHash`: hash of encoded calldata;
- `actionMetadataHash` or `metadataCid`: reference to explanatory metadata;
- `actionIntent`: human-readable and canonical authoring object used to explain the action.

If current contracts use a different term such as `dataHash`, documentation and UI copy should map that runtime term to the clearer design terminology without renaming deployed runtime concepts.

Hash rules:

- the calldata hash must be derived from encoded calldata or from a clearly defined canonical action encoding;
- the UI should show both a human-readable summary and expandable technical hash detail;
- advanced users must be able to reproduce the hash from the displayed preimage or canonical encoding;
- metadata hash and calldata hash must not be treated as the same thing;
- metadata changes must not silently imply execution payload changes;
- executable payload changes must be surfaced even if metadata still looks similar.

Suggested copy:

```text
This hash verifies the encoded calldata for the action. It does not verify every explanatory label or external metadata field.
```

## Simulation strategy

Simulation is recommended but not required for the first design baseline.

Simulation status values:

- `not_available`;
- `not_run`;
- `passed`;
- `failed`;
- `warning`;
- `stale`.

Simulation should remain optional in the first MVP because:

- simulation providers vary by chain;
- self-hosted deployments may not have provider credentials;
- local, testnet, and mainnet behavior can differ;
- requiring simulation may block valid governance in early deployments;
- some calls cannot be fully predicted without execution context.

The UI must clearly warn when simulation is unavailable, not run, failed, warning, or stale.

Future provider adapters may include:

- Tenderly-like simulation;
- local `eth_call` or static simulation where applicable;
- chain-specific simulation adapters;
- Safe transaction simulation later.

No provider integration is part of the v0.7 design baseline.

## Late-bound and dynamic values

The first MVP should reject hidden late-bound execution values.

Allowed:

- static literal values;
- explicitly displayed values;
- user-confirmed target, value, and calldata before proposal submission.

Disallowed in the first MVP:

- current treasury balance at execution time;
- current oracle price;
- current role holder;
- hidden dynamic substitutions;
- expressions that can change proposal meaning between approval and execution.

Future dynamic values may exist only if they are:

- explicitly modeled;
- visible in proposal review;
- constrained by policy;
- represented in metadata and read models;
- simulated with clear limitations.

The baseline rule is simple: if the value can change proposal meaning between approval and execution, it must not be hidden behind metadata or builder UI.

## Multi-call policy

Multi-call is future work.

Future design must address:

- ordered execution;
- dependency between calls;
- atomic versus partial execution;
- gas limits;
- simulation complexity;
- UX complexity;
- hash and metadata representation;
- proposal route compatibility;
- failure reporting;
- replay and indexing behavior.

v0.7 should avoid implying that multi-call bundles are ready.

## App Core UX surfaces

Future App Core surfaces should use progressive disclosure.

Expected surfaces:

- action builder form;
- ABI input area;
- function selector;
- parameter editor;
- plain-language preview;
- warning panel;
- advanced technical disclosure;
- hash preview;
- simulation status panel;
- final review step before proposal submission.

App Core should not become an engineering console. The default flow should be understandable to governance operators, while technical details remain available for reviewers who need them.

## Control Plane and metadata relationship

Control Plane may later:

- store action metadata references;
- validate metadata schema;
- expose action summaries;
- show mismatch warnings;
- cache ABI labels if supported;
- expose simulation status;
- index on-chain action payload references where available.

Control Plane must not become execution truth. Where execution is on-chain, contracts and on-chain payloads remain authoritative.

Control Plane read models can lag, fail, or be rebuilt. They should make the action easier to understand, not redefine what will execute.

## Storage relationship

See [`storage-and-metadata.md`](./storage-and-metadata.md) for metadata schema direction.

Action metadata may include the action intent object, labels, summaries, simulation status, and storage references. It must not be treated as a substitute for on-chain target, value, and calldata.

## v0.7 non-goals

Do not include in v0.7 unless explicitly reprioritized:

- runtime contract changes;
- App Core production implementation;
- explorer import implementation;
- Tenderly or other simulation provider integration;
- multi-call bundles;
- Safe integration;
- production storage service;
- audit readiness claims;
- backend-defined execution authority.

## Acceptance baseline

The v0.7 Proposal Action Builder design baseline is complete when future implementers can answer:

- the first MVP supports one EVM write call per proposal action;
- manual ABI paste/upload comes before explorer import;
- default users review human-readable intent before raw calldata;
- advanced users can inspect ABI, calldata, hashes, and simulation status;
- action intent metadata explains execution but does not define execution truth;
- calldata hash, metadata hash, and action intent are separate concepts;
- simulation is recommended but optional;
- hidden late-bound values are rejected in the first MVP;
- multi-call remains future work;
- App Core and Control Plane responsibilities are clearly bounded.
