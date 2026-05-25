# Troubleshooting

Start by identifying which layer owns the failure.

| Symptom | Check first |
| --- | --- |
| Contract deployment or seeding fails | `evm-contracts` network, deployment addresses, and local node output. |
| Control Plane will not start | `DATABASE_URL` or `PG_*` values, RPC URL, contract address format, and API port. |
| Read models are stale | Indexer cursor, projection worker, runtime heartbeats, and whether projections need rebuilding. |
| Browser API calls fail | `CORS_ORIGINS`, App Core `apiBaseUrl`, and Control Plane `/v1/health`. |
| Wallet writes are unavailable | App Core feature flags, contract addresses, connected chain, wallet mode, and Reown/injected fallback diagnostics. |
| External evidence looks wrong | Source labels, trust boundary, import status, and Integration Lab notes. |

## Useful Public Endpoints

Control Plane currently exposes:

- `/v1/health`
- `/v1/version`
- `/v1/capabilities`
- `/v1/diagnostics`
- `/v1/diagnostics/indexer`

Use the [`control-plane` README](https://github.com/isoniaos/control-plane/blob/main/README.md) for exact commands and environment variables.

## Unknown Is A State

If a source is stale, missing, unsupported, unverified, or unknown, treat that as part of the record. Do not convert unknown state into success in docs, UI, scripts, or public claims.
