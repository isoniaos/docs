# SDK

The SDK provides typed access to IsoniaOS contracts, Control Plane APIs, and shared domain models.

## Responsibilities

- typed API clients;
- contract interaction helpers where appropriate;
- shared model helpers;
- validation and normalization helpers that belong at the interface layer;
- examples for application and script usage.

## Boundary

The SDK should not contain App Core UI behavior, provider-specific product policy, private operator workflows, or demo-only assumptions.

SDK behavior should follow shared types and public contract/API semantics.
