# IsoniaOS v0.6 Repository Preparation

## Purpose

Prepare all working repositories for v0.6 development after the v0.5 Developer Preview tags.

## Repositories

Working repositories:
- evm-contracts;
- types;
- control-plane;
- docs;
- sdk;
- theme-default;
- app-core.

## Required preparation

### All repositories

- Ensure AGENTS.md exists.
- Confirm the active target is v0.6.
- Add or update CHANGELOG Unreleased section for v0.6 work.
- Do not create tags automatically.
- Do not create future version sections unless explicitly instructed.
- Do not edit archived v0.5 docs except compatibility matrix or archive notices.
- Confirm README does not present obsolete v0.1/v0.5 flows as active unless explicitly archival.
- Confirm package versions remain unchanged until the user asks to cut a new alpha tag.

### docs

- Active docs should be under docs/v0.6.
- v0.5 docs should be archived under docs/archive/v0.5.
- v0.5 compatibility matrix must exist.
- README should state that v0.6 is the active development target.
- VERSIONING.md should define version and changelog rules.

### app-core

- Prepare for UI foundation work.
- Confirm public app-core does not include SaaS-only code.
- Confirm workspace-source aliases are opt-in, not default, if such aliases exist.
- Identify current setup form components to replace with reusable address inputs.

### theme-default

- Prepare base styling for shared UI components.
- Add address component styles if needed.
- Avoid final visual design at this stage.

### types

- Add shared DTOs only when cross-repository needs are clear.
- Do not add UI-only types if they belong inside app-core.
- Keep package dependency-light.

### sdk

- Add or update typed endpoints only when Control Plane endpoints exist or are part of the accepted v0.6 scope.
- Keep SDK free of React, NestJS, and governance authority logic.

### control-plane

- Keep API, indexer, and projections observable.
- Add diagnostics fields only when app-core needs them.
- Preserve local dev reliability.

### evm-contracts

- Avoid protocol expansion during early v0.6.
- Only add helper scripts or docs needed for local demo.
- Do not claim audit readiness.

## Preparation acceptance criteria

- A new contributor can identify v0.6 as the active target.
- Codex has a clear docs/v0.6 context.
- v0.5 remains accessible as an archive.
- CHANGELOGs are ready for new work under Unreleased.
- No repository claims production readiness.
