# Operator Overview

The current operator path is local or self-hosted development. These docs explain the moving parts and boundaries, while repository READMEs provide exact commands.

## Current Run Shape

An operator evaluating IsoniaOS locally usually coordinates:

- a local EVM chain and deployed contracts;
- PostgreSQL;
- Control Plane API, indexer, and projection workers;
- App Core runtime config;
- browser wallet connection to the configured chain;
- optional Integration Lab evidence for testnet or provider validation.

## Operator Responsibilities

- Keep contract addresses, chain ID, RPC URL, and Control Plane config aligned.
- Run database migrations before expecting projections.
- Monitor diagnostics before trusting read-model freshness.
- Treat external records as evidence or context unless explicitly modeled otherwise.
- Keep secrets, private keys, provider API keys, and production manifests out of public docs and lab fixtures.

## Current Posture

These docs do not claim production operations. Production hosting, managed operations, incident response, security review, and provider-complete integration require separate scoped work.
