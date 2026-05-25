# Developer Overview

IsoniaOS development is repository-first. Public docs explain the system shape and boundaries; exact commands and implementation details live in the owning repository.

## How Public Docs Relate To Repository Docs

- Use this site to understand product concepts, architecture, configuration categories, and public-safe boundaries.
- Use repository `README.md` files for installation, exact commands, local configuration, troubleshooting, and package-specific notes.
- Use repository `/docs` directories for implementation-adjacent details owned by that repository.
- Update public docs when a feature addition, behavior change, configuration change, or operator-visible change affects users, developers, operators, or public claims.

## Main Development Surfaces

| Surface | Repository | Start here |
| --- | --- | --- |
| Protocol contracts | `evm-contracts` | [Contracts](contracts.md) |
| Shared DTOs and enums | `types` | [Repository map](repository-map.md) |
| Indexing and read APIs | `control-plane` | [Control Plane](control-plane.md) |
| Typed clients and helpers | `sdk` | [SDK](sdk.md) |
| Governance console | `app-core` | [App Core](app-core.md) |
| Default theme | `theme-default` | [Repository map](repository-map.md) |
| Lab validation | `integration-lab` | [Integration Lab](integration-lab.md) |

## Public-Safe Development Rules

- Keep demo helpers, lab fixtures, and provider experiments out of core authority.
- Preserve source labels, authority claims, trust boundaries, and stale/error/unknown states.
- Do not infer capability from package version strings.
- Do not publish private token, legal, hosted-service, or internal planning material in public docs.
