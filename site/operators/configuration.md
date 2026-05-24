# Configuration

IsoniaOS configuration should be explicit and inspectable.

## Common configuration areas

- chain IDs and RPC endpoints;
- deployed contract addresses;
- Control Plane API endpoint;
- database connection for Control Plane;
- wallet connection mode;
- external provider credentials;
- feature availability;
- source labels and provider metadata.

## Rules

- Avoid hardcoded customer or demo targets in product code.
- Keep secrets out of public repositories.
- Prefer typed configuration schemas.
- Show configured chain and address context in operator and diagnostic views.
- Document unsupported or unknown provider states.

## Environment separation

Development, staging, and later production-like environments should use separate configuration. Public docs should not imply that one local configuration is suitable for every deployment.
