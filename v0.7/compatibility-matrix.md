# v0.7 Compatibility Matrix

## Purpose

This matrix tracks expected compatibility across repositories and protocol capabilities during v0.7.

Always verify current tags before release decisions.

## Latest known v0.6 baseline

```text
app-core        v0.6.0-alpha.18
docs            v0.6.0-alpha.8
evm-contracts   v0.6.0-alpha.4
types           v0.6.0-alpha.2
sdk             v0.6.0-alpha.4
control-plane   v0.6.0-alpha.2
theme-default   v0.6.0-alpha.3
demo-stack      final v0.6 demo release
```

## Capability matrix

| Capability | v0.6 status | v0.7 target | Notes |
| --- | --- | --- | --- |
| Serial activation | Reliable default | Remains fallback | Do not remove. |
| EIP-5792 activation | Gated prototype | Optional diagnostics/feature flag | Not primary path. |
| Typed admin batch activation | Not available | Protocol-supported optimization | Preferred v0.7 activation optimization. |
| Bootstrap finalization | Not available | Designed and implemented | Admin handoff must be explicit. |
| Organization lifecycle | Partial/implicit | Explicit read model | Created/Activating/Active/Finalized or equivalent. |
| Control Plane finalization indexing | Not available | Required | Must expose real state only. |
| App Core finalization UX | Not available | Required | Calm guidance, not alarmist. |
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
- design partner plan.

### evm-contracts

Expected after docs review:

- typed admin batch activation;
- bootstrap finalization;
- events;
- tests.

### types

Expected after protocol changes:

- lifecycle DTOs/enums;
- finalization DTOs;
- batch activation capability/types if needed.

### sdk

Expected after ABI/types updates:

- contract support detection;
- batch activation helpers;
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

- batch activation support;
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
