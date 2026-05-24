# Self-Hosted Overview

IsoniaOS is intended to remain self-hostable where trust matters.

The current runtime path is being normalized because the old demo-stack flow is archived and the contracts, shared types, Control Plane, SDK, and App Core boundaries are being updated.

## Current guidance

Use the current repository-local README and `/docs` for the component you are working with:

- `evm-contracts` for contract development and deployment details;
- `types` for shared domain model details;
- `control-plane` for indexing, projection, API, and diagnostics;
- `sdk` for typed clients;
- `app-core` for the governance console;
- `theme-default` for theme package work.

This public page intentionally does not publish stale demo-stack commands as the current self-hosting path.

## Expected self-hosted shape

A self-hosted IsoniaOS deployment is expected to include:

- configured contracts on a supported chain;
- Control Plane indexing and projection services;
- a database for indexed/read-model state;
- App Core configured for the target chain and Control Plane API;
- wallet connection settings;
- visible diagnostics for chain, indexer, projection, API, config, and wallet state.

## Operator responsibility

Self-hosted operators are responsible for:

- securing private keys and deployment credentials;
- configuring chain and contract addresses correctly;
- running infrastructure with appropriate monitoring and backups;
- understanding that linked external evidence does not override contract state;
- updating to reviewed versions as they are released.

More specific setup commands will be documented after the current normalization cycle establishes the supported path.
