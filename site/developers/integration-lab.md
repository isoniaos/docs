# Integration Lab

Integration-lab validates external provider assumptions outside core product authority.

## Purpose

External integrations are core to the product, but provider experiments, demo targets, presentation fixtures, and field notes must stay isolated from contracts, Control Plane internals, SDK models, and App Core product logic until promoted through reviewed generic interfaces.

## Expected contents

Integration-lab may contain:

- Sepolia deployment manifests;
- Snapshot testnet workflow notes;
- Safe Sepolia transaction proof workflows;
- Tally/OpenZeppelin Governor compatibility experiments;
- Agora research and linking notes;
- GitHub, Discourse, and block explorer evidence fixtures;
- pinned Sepolia fork configs;
- presentation QA scenarios;
- field notes and issue logs.

## Validation lanes

- Local deterministic fixtures for fast regression coverage.
- Pinned Sepolia forks for repeatable checks against known public data.
- Live Sepolia workflows for smoke validation and provider discovery.

## Boundary

Integration-lab is not governance authority.

It should produce fixtures, field notes, and follow-up issues. It should not hardcode demo/customer target assumptions into core product repositories.
