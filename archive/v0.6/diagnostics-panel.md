# IsoniaOS v0.6 Diagnostics Panel

## Purpose

Diagnostics should be a first-class part of the product.

IsoniaOS depends on contracts, REST API, indexing, projections, wallet state, and runtime config. When something fails, users and developers need clear visibility.

## Diagnostics route

App Core route:
- /diagnostics

Control Plane endpoints may include:
- GET /v1/diagnostics
- GET /v1/diagnostics/indexer

The SDK should expose diagnostics through typed client helpers.

## Sections

### System

Show:
- API status;
- API version;
- package version;
- current time;
- configured chain id;
- latest block;
- safe block.

### Contracts

Show:
- GovCore address;
- GovProposals address;
- DemoTarget address;
- deployment block if available;
- mismatch warnings if frontend config differs from backend diagnostics.

### Indexer

Show:
- status;
- latest block;
- safe block;
- last indexed block;
- raw event count;
- failed event count;
- last indexed tx hash if available;
- last error if available;
- stale indicator.

### Projections

Show:
- status;
- last projected event;
- backlog;
- failed projections;
- last error;
- stale indicator.

### Frontend

Show:
- loaded runtime config source;
- configured API base URL;
- configured chain;
- connected wallet address;
- wallet chain;
- writeActions enabled;
- createProposal enabled;
- metadata resolution enabled.

### Troubleshooting

Show direct guidance for common failures:
- wallet connected to wrong chain;
- backend API unreachable;
- indexer stale;
- projection backlog;
- contract address mismatch;
- transaction mined but read model not updated;
- local Hardhat node restarted but old addresses are still configured.

## UX principle

Diagnostics messages should distinguish:
- chain transaction failure;
- indexing delay;
- projection delay;
- stale config;
- wallet mismatch;
- API unavailability.

Do not report every failure as a generic transaction error.

## Non-goals

- production observability platform;
- hosted metrics;
- alerting;
- SaaS monitoring;
- private admin dashboard.
