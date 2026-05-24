# Execution

Execution is what happens after a governance decision authorizes an action.

## Execution records

An execution record should make clear:

- what was approved;
- which route or proposal authorized the action;
- who or what could execute;
- target address and chain where relevant;
- function selector or action identity where relevant;
- committed value and calldata hash where relevant;
- transaction hash or external proof;
- observed status;
- completion or failure reason.

## Proposal action identity

For contract execution, the planned identity is:

```text
targetAddress + value + actionSelector + dataHash
```

The selector is enforcement identity. Human-readable function names are display metadata.

## External execution proof

Safe links, block explorer links, GitHub merged PRs, reports, or attestations can be attached as proof or context.

They are evidence unless a reviewed model verifies them as authority for a specific field.

## Failed or delayed execution

Failures and delays should be visible.

A public record should explain:

- what failed or changed;
- who was responsible;
- what evidence exists;
- whether funds or permissions were affected;
- what remediation is proposed;
- whether escalation or review is needed.
