# SDK

The [`sdk`](https://github.com/isoniaos/sdk/blob/main/README.md) repository owns the dependency-light TypeScript client and helper layer for IsoniaOS consumers.

## Role

The SDK currently provides:

- typed Control Plane REST clients;
- Control Plane path helpers;
- proposal and execution helpers;
- finalization helpers;
- admin batch activation helpers;
- error handling for non-OK API responses.

It builds on `@isonia/types` and does not require runtime environment variables. Consumers pass a Control Plane base URL when creating a client.

## Example

```ts
import { createIsoniaControlPlaneClient } from "@isonia/sdk";

const client = createIsoniaControlPlaneClient({
  baseUrl: "http://localhost:3000",
});

const health = await client.getHealth();
const archive = await client.archive.get("1");
```

## Boundary

The SDK should stay generic and UI-free. It should not import App Core, Control Plane internals, provider UI packages, lab fixtures, or private hosted-service behavior. It should preserve source labels, trust boundaries, authority claims, verification status, and stale/error states returned by APIs.
