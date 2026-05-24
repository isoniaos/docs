# IsoniaOS Docs Agent Rules

This repository contains public IsoniaOS documentation.

When used inside the private workspace, read the workspace `AGENTS.md` first.

## Scope

This repository may contain:

- public whitepaper;
- public roadmap;
- public product/protocol documentation;
- developer/operator documentation;
- trust-boundary and authority-model documentation;
- ReadTheDocs site configuration.

This repository must not contain:

- private planning notes;
- sensitive partner/customer/fundraising notes;
- ISO token/tokenomics implementation docs;
- SaaS/internal commercial planning docs;
- archive/version clutter in the active tree.

## Documentation posture

Write clear public English.

Keep README short.

Keep detailed content under `site/`.

Old versions live in Git history and tags, not archive directories.

Do not create versioned active folders such as `v0.8/`.

## Claims

Do not claim production readiness, audit readiness, public beta readiness, legal readiness, SaaS readiness, provider-completeness, token launch readiness, grant readiness, or security completeness unless an explicit evidence gate and decision record approves it.

## Authority model

Contracts are authoritative for modeled onchain governance state.

Control Plane and App Core are explanatory and operational layers, not governance authority.

External records are linked evidence or context unless explicitly modeled as authority for a specific field.

Manual accountability updates are annotations, not protocol truth.

## Hygiene

After each task:

- update the smallest relevant current doc;
- remove obsolete duplicate wording;
- keep navigation working;
- run the docs build;
- report broken links or intentionally removed pages.

Do not preserve outdated docs only for history. Git history and tags are the archive.
