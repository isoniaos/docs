# Diagnostics

Diagnostics help separate failures across chain, indexer, projection, API, configuration, wallet, and UI layers.

## Control Plane Diagnostics

Control Plane currently exposes:

- `/v1/health`
- `/v1/version`
- `/v1/capabilities`
- `/v1/diagnostics`
- `/v1/diagnostics/indexer`

Use these before assuming a proposal, execution receipt, or accountability record is missing from contract state.

## Common Distinctions

| Problem | Meaning |
| --- | --- |
| Chain transaction exists but read model is stale | Indexer or projection lag may be the issue. |
| API is healthy but browser calls fail | App Core `apiBaseUrl` or Control Plane CORS may be wrong. |
| Contract addresses are missing | Control Plane can start without optional addresses, but protocol reads and capabilities may be incomplete. |
| Capability metadata disagrees with runtime behavior | Check `ISONIA_PROTOCOL_PROFILE`, `ISONIA_DEPLOYMENT_CAPABILITIES_JSON`, ABI compatibility, and deployed contracts. |
| Wallet write controls are disabled | Check App Core feature flags, chain ID, contract addresses, wallet mode, and connected account. |

## Operator Rule

Do not collapse stale, failed, unsupported, missing, or unknown state into success. The distinction is part of the public trust model.
