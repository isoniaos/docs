# App Core

App Core is the self-hostable governance console for IsoniaOS.

## Responsibilities

- organization dashboard;
- proposal list and detail views;
- route explanation;
- execution and accountability views;
- public governance archive;
- external evidence display;
- diagnostics;
- wallet-mediated writes where supported;
- theme integration.

## Boundary

App Core is not governance authority. It displays and helps users interact with contract state, Control Plane projections, external evidence, and manual annotations.

App Core should keep domain behavior separate from theme presentation and should avoid private operator workflows.

## Configuration

App Core should be configurable for chains, contract addresses, Control Plane endpoints, wallet mode, and feature availability without hardcoded customer or demo targets in product code.
