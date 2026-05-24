# Local Development

Local development currently happens inside the individual repositories that make up IsoniaOS.

This page gives the public orientation without inventing commands that may change during normalization.

## Repository-first workflow

Start with the repository you need:

- `evm-contracts`: contracts, tests, deployment scripts, ABI, and contract docs.
- `types`: shared DTOs, enums, constants, and cross-repository model definitions.
- `control-plane`: event ingestion, projections, diagnostics, and REST APIs.
- `sdk`: typed clients and helpers.
- `app-core`: self-hostable governance console.
- `theme-default`: default theme package.
- `integration-lab`: external provider validation and field notes.

Each repository should keep a short `README.md`, a focused `AGENTS.md`, and current detailed docs under `/docs`.

## Current development posture

The current workspace cycle is normalizing core boundaries.

Expected development direction:

- shared types before duplicated backend/frontend models;
- contracts for authoritative onchain state;
- Control Plane for indexing, projections, APIs, and diagnostics;
- App Core for public archive and accountability surfaces;
- integration-lab for provider experiments and Sepolia validation.

## What not to use as current guidance

Do not treat old active archive folders or old demo-stack docs as current local-development instructions.

Historical material remains in Git history and private migration records. Public docs will be updated when a supported local runtime path is stable enough to document accurately.
