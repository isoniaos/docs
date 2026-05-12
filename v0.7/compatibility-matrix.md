# v0.7 Compatibility Matrix

## Purpose

This matrix tracks expected compatibility across repositories and protocol capabilities during v0.7.

Always verify current tags before release decisions.

## Current v0.7 release set

```text
docs            v0.7.0-alpha.1
evm-contracts   v0.7.0-alpha.1
types           v0.7.0-alpha.1
sdk             v0.7.0-alpha.1
control-plane   v0.7.0-alpha.1
app-core        v0.7.0-alpha.1
demo-stack      ed050f6bc33dfde0c1fa8ef974a23adfbe0e441d
```

## Capability matrix

| Capability | v0.6 status | v0.7 target | Notes |
| --- | --- | --- | --- |
| Serial activation | Reliable default | Remains fallback | Do not remove. |
| EIP-5792 activation | Gated prototype | Optional diagnostics/feature flag | Not primary path. |
| Typed admin batch activation | Not available | Implemented in current v0.7 alpha stack | Preferred activation optimization. |
| Bootstrap finalization | Not available | Planned/design-stage | Do not imply `evm-contracts@v0.7.0-alpha.1` supports finalization. |
| Bootstrap finalization status | Not available | Planned/design-stage | Should become explicit lifecycle/finalization state after protocol implementation. |
| Organization lifecycle | Partial/implicit | Planned explicit read model | Created/Activating/Active/Finalized or equivalent. |
| Control Plane finalization indexing | Not available | Planned after protocol event/state | Must expose real state only. |
| App Core finalization UX | Not available | Planned after read-model support | Calm guidance, not alarmist. |
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

v0.7 starts here.

Expected:

- v0.7 documentation pack;
- roadmap alignment;
- non-goals;
- compatibility matrix;
- design partner plan;
- bootstrap finalization/admin handoff design baseline.

### evm-contracts

Expected after bootstrap finalization docs review:

- bootstrap finalization;
- lifecycle state or equivalent;
- events;
- tests.

Current `evm-contracts@v0.7.0-alpha.1` should not be treated as supporting finalization.

### types

Expected after protocol changes:

- lifecycle DTOs/enums;
- finalization DTOs;
- finalization event/read-model types if needed.

### sdk

Expected after ABI/types updates:

- contract support detection;
- finalization helper;
- compatibility-safe methods.

### control-plane

Expected after protocol changes:

- new event indexing;
- lifecycle read models;
- finalization status;
- diagnostics enrichment.

### app-core

Expected after Control Plane/types/sdk updates:

- finalization UX;
- post-finalization restrictions;
- Governance Structure lifecycle/finalization state.

### theme-default

Expected:

- probably minimal impact;
- only update if new App Core components require theme tokens.

### demo-stack

Expected:

- align after contracts/control-plane/app-core are compatible;
- do not update demo-stack in the same task as feature implementation unless explicitly requested.

## Compatibility rules

- Do not fake unsupported capabilities.
- Do not imply EIP-5792 reliability.
- Keep serial activation fallback.
- Handle older contracts gracefully.
- Separate feature changes from release bookkeeping.
