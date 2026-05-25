# Contracts

The [`evm-contracts`](https://github.com/isoniaos/evm-contracts/blob/main/README.md) repository owns the Solidity contracts for modeled IsoniaOS governance authority.

## Current Surface

- `GovCore` models organizations, bodies, roles, mandates, policy rules, bootstrap setup, batch activation, and organization finalization.
- `GovProposals` models proposal lifecycle, route checks, approvals, vetoes, timelocks, execution permission checks, and canonical execution receipts.
- `GovTypes` and `GovErrors` hold shared protocol types and errors.
- `IsoOrgExecutor` is an optional organization-scoped caller for managed execution handoff.
- `DemoTarget` and demo token contracts are local/lab helpers, not product authority.

## Execution Identity

Proposal action identity is modeled as target, value, action selector, and calldata hash. Execution must validate configured target, selector, value, calldata selector, calldata hash, proposal status, approval/veto/timelock state, and executor authority before a call is made.

`ProposalExecuted` is the canonical protocol execution receipt. Executor-local events can support evidence, but they do not replace the protocol receipt.

## Local Development

Use the [`evm-contracts` README](https://github.com/isoniaos/evm-contracts/blob/main/README.md) for current commands:

- install dependencies;
- run tests;
- start a local Hardhat node;
- deploy locally;
- seed local organizations and lab actions.

Sepolia variables and deployment notes are repository-local and should not be copied into public docs unless a testnet validation task explicitly requires it.

## Boundary

Contracts are authoritative only for state they model. They do not prove offchain work was completed, and local/lab helper contracts do not establish production behavior.
