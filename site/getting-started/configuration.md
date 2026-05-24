# Configuration

IsoniaOS configuration is being normalized around explicit runtime boundaries.

This page describes the intended configuration categories without claiming a final public API.

## Configuration categories

A deployment should eventually configure:

- chain and network metadata;
- contract addresses and deployment manifests;
- Control Plane API base URL;
- indexer/projection settings;
- wallet connector settings;
- enabled integrations;
- external evidence provider settings;
- theme package;
- public organization context;
- diagnostics visibility.

## Authority-sensitive configuration

Configuration must not silently grant governance authority.

Authority-changing setup should be explicit, reviewable, and backed by contract state or governed handoff. Templates and config files may describe intended routes or permissions, but they are not authority by themselves.

## App Core posture

App Core should be self-hostable and multi-chain-oriented.

It should support runtime configuration without embedding demo target assumptions into the core product.

## Current status

This area is being normalized in the current workspace cycle.

Use repository-local docs for exact commands and environment variables until this public page is updated with a supported path.
