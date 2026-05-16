# v0.8 Demo Organization and Governance Process

## Purpose

This document defines the expanded v0.8 demo organization baseline.

The current demo organization is enough for v0.7 bootstrap and finalization coverage. v0.8 needs to simulate accountable DAO follow-through: approved decisions, execution state, public evidence, manual annotations, and historical memory.

This is a docs baseline only. It does not implement runtime contracts, demo-stack seeds, Control Plane projections, App Core UI, or SDK/types.

## Demo Organization Goal

The v0.8 demo DAO should show how IsoniaOS closes the loop between a governance decision and visible follow-through.

The demo should make these questions easy to answer:

- what did the DAO approve;
- who or what was expected to act;
- whether execution happened;
- what transaction or evidence is linked;
- what remains pending, overdue, failed, or manually annotated;
- which data is contract/read-model state and which data is linked evidence or context.

## Canonical Scenarios

The demo organization should include these scenarios:

1. approved -> executed -> completed;
2. approved -> execution/accountability pending;
3. approved -> overdue;
4. approved -> failed or cancelled with reason;
5. offchain/external context linked to onchain execution;
6. manual completion confirmation clearly labeled as manual annotation.

Each scenario should preserve source labels and trust-boundary language. Manual completion must not be displayed as protocol truth.

## Token Voting Posture

The primary v0.8 demo path should use an ERC20Votes-style voting token.

The simulated DAO process should include:

- minting demo voting tokens to several actors;
- delegation or self-delegation before proposal voting;
- a visible distinction between token voting power and later accountability status;
- one executable action path that can produce a transaction hash and event trail.

NFT voting may be mentioned as future-compatible or docs-only context, but it should not be runtime scope for v0.8 unless explicitly reprioritized. v0.8 should not add a full multi-token or multi-chain governance runtime.

## Governance Process Flow

The local demo DAO process should follow this conceptual flow:

1. mint demo voting tokens to several actors;
2. delegate voting power;
3. create a proposal with an executable action;
4. vote or approve;
5. queue if timelock is modeled;
6. execute;
7. capture transaction hash or emitted event;
8. attach accountability record;
9. attach external resources;
10. render public archive and accountability dashboard.

The flow should work locally without requiring Snapshot, Safe, Tally, Agora, Discourse, GitHub, or a block explorer. External resources can be fixture-backed links or manual evidence records during local development.

## Demo Actors

Use a small, deterministic actor set:

- proposer;
- token holders/delegates;
- execution actor;
- accountability owner;
- observer.

The same wallet may play more than one role in local development if needed, but public demos should label the roles clearly enough that the governance process remains understandable.

## Conceptual Demo Targets

Runtime implementations should later emit clear events so Control Plane and App Core can display proposal, execution, obligation, status, and proof relationships.

Recommended conceptual targets:

```solidity
DemoConfigTarget.setFeatureEnabled(bytes32 feature, bool enabled)
DemoConfigTarget.setUintParam(bytes32 key, uint256 value)

DemoTreasuryTarget.releasePayment(
  bytes32 obligationId,
  address token,
  address recipient,
  uint256 amount
)

DemoAccountabilityTarget.markObligationAccepted(bytes32 obligationId)
DemoAccountabilityTarget.markObligationCancelled(bytes32 obligationId, string reason)
```

These targets are conceptual for v0.8 documentation. Do not implement them as part of this docs task.

## Scenario Guidance

### Approved -> Executed -> Completed

Use a proposal that executes a simple target method and emits an event. The archive should show contract/read-model approval state, execution state, transaction hash, and a completed accountability record.

### Approved -> Execution Pending

Use a proposal that reaches approval but has no observed execution yet. The archive should show that governance approved the decision while accountability remains pending.

### Approved -> Overdue

Use a proposal with a due date in the past and no completion evidence. The dashboard should show overdue follow-through without implying that governance approval failed.

### Failed or Cancelled With Reason

Use a failed execution or manual cancellation annotation with a reason. The UI should keep the reason visible and label whether it came from contract/read-model state or manual annotation.

### External Context Linked to Onchain Execution

Attach external resources such as a discussion, issue, Snapshot link, Safe link, or block explorer link. These resources should be labeled as context or evidence unless explicit source modeling makes a field authoritative.

### Manual Completion Confirmation

Attach a manual completion confirmation with source label and timestamp. The public archive must show it as a manual annotation, not protocol truth.

## Non-Goals

The v0.8 demo organization should not claim:

- production SaaS readiness;
- audit-ready governance;
- full Safe integration;
- full Snapshot, Tally, or Agora lifecycle support;
- NFT voting runtime;
- full multi-token governance;
- multi-chain production support;
- automatic external execution;
- external records as authority by default.

## Handoff Notes

Future runtime tasks should align contracts, types, demo-stack, Control Plane, SDK, and App Core around the same conceptual scenarios. Shared concepts such as `DecisionRecord`, `AccountabilityRecord`, `ExternalResource`, source labels, trust boundaries, and authority claims should be defined in shared types before UI or backend code duplicates them locally.
