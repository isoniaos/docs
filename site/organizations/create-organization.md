# Create Organization

An IsoniaOS organization is the governance workspace for one DAO, protocol, grants program, foundation, working group, or future digital organization.

## Conceptual creation flow

A future supported setup flow should make these steps explicit:

1. choose the chain and deployment context;
2. define organization metadata;
3. configure governance bodies, roles, and permissions;
4. choose proposal types and policy routes;
5. connect or configure decision modules;
6. review authority and admin assumptions;
7. create or bind the contract-backed organization state where supported;
8. wait for Control Plane indexing and projection;
9. open the organization workspace in App Core.

## Source of authority

If organization creation is contract-backed, contract state is authoritative for the modeled fields.

Metadata, display labels, external links, and manual notes are explanatory records unless explicitly modeled otherwise.

## Current status

Organization creation and activation flows are being normalized across contracts, Control Plane, and App Core.

Do not use stale demo-stack setup docs as current launch guidance.
