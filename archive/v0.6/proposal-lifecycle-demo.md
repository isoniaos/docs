# IsoniaOS v0.6 Proposal Lifecycle Demo

## Purpose

Create a complete local demo of a proposal moving through the governance route.

The user should be able to understand:
- who can create the proposal;
- which bodies approve;
- which bodies can veto;
- when timelock applies;
- who can execute;
- what action is executed.

## Demo flow

1. Create a Simple DAO+ organization.
2. Create a proposal using the configured DemoTarget action.
3. Show proposal route explanation.
4. Approve from required body or bodies.
5. Optionally veto where the route allows it.
6. Queue proposal when approved and timelock applies.
7. Advance local Hardhat time if running on chainId 31337.
8. Execute proposal.
9. Show final proposal state and DemoTarget result.

## Proposal screen requirements

The proposal detail screen should show:
- proposal id;
- organization id;
- proposal type;
- status;
- creator;
- target;
- value;
- data hash;
- metadata fallback label;
- route explanation;
- required approvals;
- veto bodies;
- executor body;
- timelock;
- available actions.

## Action buttons

Available actions should be contextual:
- approve;
- veto;
- queue;
- execute;
- cancel.

Buttons are UI hints only. Contracts remain the final authority.

## Local Hardhat time controls

For chainId 31337 only, app-core may expose:
- mine block;
- advance time by 5 minutes;
- advance time by 1 hour;
- advance time by custom seconds.

These controls must not appear for non-local chains.

## Non-goals

- arbitrary calldata builder;
- multi-target proposal builder;
- token voting;
- delegation;
- Safe module integration;
- production execution automation.
