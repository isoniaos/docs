# IsoniaOS v0.6 Codex Implementation Rules

## Active target

The active development target is v0.6 alpha.

## General rules

- Follow AGENTS.md in each repository.
- Use docs/v0.6 as the active documentation context.
- Do not edit docs/archive/v0.5 except compatibility matrix or archive notices.
- Do not edit docs/archive/v0.1 unless explicitly instructed.
- Do not invent new versions.
- Do not create tags.
- Do not create release sections unless instructed.
- Put current work under CHANGELOG Unreleased.
- Keep package boundaries clean.
- Prefer small, reviewable changes.

## Public app-core rules

app-core is public and self-hostable.

Do not add:
- SaaS billing;
- subscriptions;
- tenant management;
- platform admin;
- commercial limits;
- usage metering;
- private SaaS workflows.

Allowed:
- runtime config;
- public feature gates;
- theme extension points;
- wallet adapters;
- self-hosted deployment support.

## UI implementation rules

- Create reusable components before replacing large screens.
- Do not duplicate address rendering logic.
- Do not hardcode colors if theme tokens exist.
- Keep address parsing and validation utilities testable.
- Separate generic UI primitives from governance-specific components.
- Do not turn the first UI foundation task into a full redesign.

## Address component rules

- Implement AddressAvatar, AddressDisplay, AddressInput, MultiAddressInput, and AddressChip before large setup wizard changes.
- MultiAddressInput should use chip/tag UX with raw paste support.
- Support newline, comma, semicolon, space, and tab separators.
- Deduplicate normalized addresses by default.
- Reject mixed-case invalid checksum addresses.
- Treat zero address as invalid for authority holder fields.
- ENS resolving is optional unless explicitly requested.

## Control Plane rules

- Keep diagnostics developer-friendly.
- Distinguish indexing delay from projection delay.
- Do not hide raw errors where local debugging needs them.
- Do not merge unrelated protocol changes into UI work.

## Docs rules

- Update docs/v0.6 when behavior changes.
- Keep README navigation current.
- Keep compatibility matrix accurate after tags.
- Move completed temporary planning content into changelog or stable docs.
- Do not leave active-looking obsolete docs in root navigation.

## Release rules

When the user says to cut a new alpha:
- update package version if required;
- update dependency refs;
- move CHANGELOG entries from Unreleased to the new version;
- update compatibility matrix after all tags exist;
- do not tag automatically unless explicitly instructed.
