# Architecture

IsoniaOS is organized as a set of focused repositories and layers.

## Contract layer

EVM contracts model onchain governance state where verifiability or direct execution authority is needed. Contract events are the source for indexed onchain governance records.

## Shared types

Shared TypeScript types define data contracts across repositories. They should describe governance state, evidence, authority claims, provider status, errors, and stale/unknown states without UI-specific coupling.

## Control Plane

Control Plane indexes contract events, builds projections, normalizes external evidence, exposes read APIs, and reports diagnostics. It is a read and operational layer unless an explicit protocol design gives it authority for a specific field or action.

## SDK

The SDK provides typed access to contracts, Control Plane APIs, and shared domain models.

## App Core

App Core is the self-hostable governance console. It displays proposals, routes, execution state, accountability, evidence, diagnostics, and public archive views.

## Theme layer

Theme packages provide replaceable visual presentation without governance authority or domain logic.

## Integration Lab

Integration Lab validates external providers, public testnet workflows, evidence fixtures, and field notes outside product core. Its outputs can inform adapters and docs, but it does not define protocol authority.

## Public docs

This repository is the public documentation surface for IsoniaOS. It should contain current public product, protocol, developer, operator, authority, trust-boundary, and deployment docs.
