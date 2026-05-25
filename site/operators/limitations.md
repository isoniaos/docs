# Current Limitations

IsoniaOS is in developer-preview local development. The following boundaries are intentional public claims discipline.

## Not Claimed

These docs do not claim:

- production operations;
- audit completion;
- public beta readiness;
- legal readiness;
- complete provider integrations;
- managed hosted operations;
- token launch readiness.

## Current Practical Limits

- Local development requires coordinating multiple repositories.
- Control Plane read models can lag contract state when indexing or projections are behind.
- App Core runtime config is JSON-file based with built-in local defaults; a broader runtime config distribution model is future work.
- Reown AppKit requires a project ID; otherwise App Core falls back to injected wallet mode.
- Integration Lab evidence is intentionally separate from product authority.
- Theme Default is a default theme package, not a separate product path.

## Where To Check Next

Use the [repository map](../developers/repository-map.md) to find the owning repository for exact commands, supported fields, and troubleshooting.
