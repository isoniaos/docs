# v0.7 Compatibility Matrix

## Purpose

This matrix tracks expected compatibility across repositories and protocol capabilities during v0.7.

Always verify current tags before release decisions.

## Current v0.7 release set

```text
docs            v0.7.0-alpha.1 plus Unreleased v0.7 docs alignment
evm-contracts   v0.7.0-alpha.6
types           v0.7.0-alpha.2
sdk             v0.7.0-alpha.2
control-plane   v0.7.0-alpha.2
app-core        v0.7.0-alpha.4
demo-stack      v0.7.0-alpha.4 / 1c3e17341a3a925c4e0e9df4d45d68c3fa5d8dec
```

## Capability matrix

| Capability | v0.6 status | v0.7 target | Notes |
| --- | --- | --- | --- |
| Serial activation | Reliable default | Remains fallback | Do not remove. |
| EIP-5792 activation | Gated prototype | Optional diagnostics/feature flag | Not primary path. |
| Typed admin batch activation | Not available | Implemented in current v0.7 alpha stack | Preferred activation optimization. |
| Bootstrap finalization | Not available | Implemented where deployed contracts support it | Older contracts must expose `unsupported` or `unknown`; do not fake finalized state. |
| Bootstrap finalization status | Not available | Supported through shared types/read models where compatible | Must be derived from real contract state/events. |
| Organization lifecycle | Partial/implicit | Explicit lifecycle/finalization state supported where compatible | Created/Activating/Active/Finalized or equivalent. |
| Control Plane finalization indexing | Not available | Implemented in current alpha stack where event/state is available | Must expose real state only. |
| App Core finalization UX | Not available | Implemented where compatible | Includes finalization transaction UX and post-finalization restrictions. |
| Proposal Action Builder | Backlog | Design only | Full production release is non-goal. |
| Metadata schemas | Informal | Defined | Storage service implementation is non-goal. |
| Full IPFS upload service | Not available | Non-goal | Never expose Kubo write RPC publicly. |
| Safe integration | Not available | Non-goal | Later. |
| Multi-chain execution | Not available | Non-goal | Later. |
| Token-weighted voting | Not available | Non-goal | Later. |
| Delegation | Not available | Non-goal | Later. |
| AI arbitration | Not available | Non-goal | Later. |

## Repository impact

### docs

Current status:

- v0.7 documentation pack;
- roadmap alignment;
- non-goals;
- compatibility matrix;
- design partner plan;
- bootstrap finalization/admin handoff documentation aligned to the current alpha stack.

### evm-contracts

Current compatible release:

- bootstrap finalization;
- lifecycle state or equivalent;
- events;
- tests.

Older pre-finalization contract releases should not be treated as supporting finalization.

### types

Current compatible release:

- lifecycle DTOs/enums;
- finalization DTOs;
- finalization event/read-model types if needed.

### sdk

Current compatible release:

- contract support detection;
- finalization helper;
- compatibility-safe methods.

### control-plane

Current compatible release:

- new event indexing;
- lifecycle read models;
- finalization status;
- diagnostics enrichment.

### app-core

Current compatible release:

- finalization UX;
- post-finalization restrictions;
- Governance Structure lifecycle/finalization state.

### theme-default

Expected:

- probably minimal impact;
- only update if new App Core components require theme tokens.

### demo-stack

Current compatible release:

- aligned to the compatible alpha stack above;
- use clean demo verification before beta readiness claims;
- do not update demo-stack in the same task as feature implementation unless explicitly requested.

## Compatibility rules

- Do not fake unsupported capabilities.
- Do not imply EIP-5792 reliability.
- Keep serial activation fallback.
- Handle older contracts gracefully.
- Separate feature changes from release bookkeeping.
- Do not claim production audit readiness.
