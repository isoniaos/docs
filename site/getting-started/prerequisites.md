# Prerequisites

Install the prerequisites required by the repositories you plan to run.

## Common Tools

- Git.
- Node.js 22 or newer.
- Corepack with pnpm.
- Python 3 for this MkDocs repository.

## Runtime Dependencies

- PostgreSQL for Control Plane.
- A local EVM JSON-RPC node for local contract and app flows. The `evm-contracts` repository provides the current Hardhat local path.
- A browser wallet that can connect to the configured local or test network when using App Core write flows.

## Optional Tools

- Foundry for optional Solidity tests in `evm-contracts`.
- Sepolia RPC access only when working in `integration-lab` or explicit testnet validation tasks.

## Exact Setup

Use the repository READMEs for commands:

- [`evm-contracts`](https://github.com/isoniaos/evm-contracts/blob/main/README.md)
- [`control-plane`](https://github.com/isoniaos/control-plane/blob/main/README.md)
- [`app-core`](https://github.com/isoniaos/app-core/blob/main/README.md)
- [`sdk`](https://github.com/isoniaos/sdk/blob/main/README.md)
- [`types`](https://github.com/isoniaos/types/blob/main/README.md)
- [`theme-default`](https://github.com/isoniaos/theme-default/blob/main/README.md)
- [`integration-lab`](https://github.com/isoniaos/integration-lab/blob/main/README.md)
