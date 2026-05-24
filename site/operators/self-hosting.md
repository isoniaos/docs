# Self-Hosting

IsoniaOS should remain self-hostable where public trust and operational control matter.

## Typical components

A self-hosted deployment may include:

- deployed contracts on a supported chain;
- Control Plane API and workers;
- database for read models;
- App Core frontend;
- configured RPC providers;
- optional external provider credentials;
- monitoring and logs.

## Operator responsibilities

Operators are responsible for chain configuration, contract addresses, RPC reliability, environment secrets, data retention, backups, upgrades, and incident response for their deployment.

## Trust posture

Self-hosting does not remove the need to distinguish contract state, projections, external evidence, and annotations. Operators should keep stale/error states and source labels visible.
