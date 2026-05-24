# SDK

The SDK provides typed clients and helpers for applications that use IsoniaOS services.

## Role

The SDK should:

- consume shared domain types;
- expose typed Control Plane API clients;
- provide helper utilities where they reduce integration risk;
- avoid duplicating authority rules locally;
- avoid React, provider, demo, or customer-specific assumptions.

## Boundary

The SDK does not create governance authority.

It should preserve source labels, trust boundaries, authority claims, verification status, and stale/error states returned by the underlying APIs.

## Current status

SDK updates should follow shared type and Control Plane normalization. Public API details will be documented after those contracts are stable enough to publish accurately.
