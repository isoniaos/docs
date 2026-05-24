# Security Posture

IsoniaOS documentation should be conservative about security and readiness claims.

## Current posture

This public site does not claim:

- production readiness;
- audit readiness;
- public beta readiness;
- provider-completeness;
- token launch readiness;
- legal readiness;
- security completeness.

## Boundaries

Contracts are authoritative for modeled onchain governance state. Control Plane projections can lag or fail. App Core is an interaction and explanation layer. External records are evidence or context unless explicitly modeled as authority. Manual accountability updates are annotations.

## Planned evidence gates

Relevant gates include:

- contract threat model;
- access-control review;
- event and projection review;
- integration trust-boundary review;
- provider stale/error behavior checks;
- self-hosting and configuration review;
- incident response plan;
- backup and restore plan where managed infrastructure exists;
- security review or audit scoped to the exact components being claimed.

Claims should name what was reviewed, who reviewed it, which version was reviewed, what was excluded, and what residual risks remain.
