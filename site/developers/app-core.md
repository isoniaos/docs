# App Core

App Core is the public self-hostable governance console.

## Expected surfaces

App Core should provide:

- organization dashboard;
- proposal list and detail pages;
- governance structure views;
- route explanation;
- action and execution status views;
- public governance archive;
- accountability dashboard;
- diagnostics;
- integration evidence views;
- theme adapter.

## Configuration posture

App Core should support self-hosted and managed deployments through configuration, not separate product cores.

It should avoid committed demo target assumptions and should be able to derive wallet mode and runtime behavior from explicit configuration.

## Boundary

App Core is not governance authority by itself.

It should show source labels and trust warnings near the data users rely on.

App Core should not contain SaaS-only billing, private tenant administration, commercial limits, or hidden platform operator workflows.

## Current status

This area is being normalized around public archive, accountability, runtime config, multi-chain-oriented configuration, and visible trust boundaries.
