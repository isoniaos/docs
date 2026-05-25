# Control Plane

The [`control-plane`](https://github.com/isoniaos/control-plane/blob/main/README.md) repository owns indexing, projections, diagnostics, and REST read APIs.

## Responsibilities

- Connect to an EVM JSON-RPC endpoint.
- Ingest configured governance contract events.
- Store raw events before projection.
- Build replayable read models in PostgreSQL.
- Expose organization, proposal, route, archive, accountability, external resource, capability, and diagnostics APIs.
- Distinguish stale, failed, unknown, and current states.

Control Plane is not governance authority. If a read model disagrees with modeled contract state, modeled contract state wins.

## API And Diagnostics

System endpoints currently include:

- `/v1/health`
- `/v1/version`
- `/v1/capabilities`
- `/v1/diagnostics`
- `/v1/diagnostics/indexer`

Diagnostics should separate RPC failure, indexing delay, projection delay, stale configuration, contract mismatch, capability mismatch, and database failure.

## Configuration

Use the [`control-plane` README](https://github.com/isoniaos/control-plane/blob/main/README.md) and `.env.example` for exact variables. Important categories are API port/CORS, chain/RPC/indexing settings, contract addresses, capability metadata, and PostgreSQL connection settings.

`DATABASE_URL` overrides individual `PG_*` values. `RPC_URL` wins over `RPC_HTTP_URL`. `API_PORT` wins over `PORT`. Contract addresses must be valid non-zero EVM addresses.

## Developer Boundary

Control Plane should use shared `@isonia/types` DTOs and preserve source disclosure. It should not hardcode demo targets, customer ABIs, provider assumptions, lab manifests, or package-version capability assumptions into core services.
