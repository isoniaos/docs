# Versioning Rules

IsoniaOS v0.5 Developer Preview uses SemVer package versions and Git tags with a leading `v`.

## Current Compatibility Set

```txt
@isonia/evm-contracts     0.5.0-alpha.3 -> v0.5.0-alpha.3
@isonia/types             0.5.0-alpha.5 -> v0.5.0-alpha.5
@isonia/control-plane     0.5.0-alpha.3 -> v0.5.0-alpha.3
@isonia/sdk               0.5.0-alpha.6 -> v0.5.0-alpha.6
@isonia/theme-default     0.5.0-alpha.2 -> v0.5.0-alpha.2
@isonia/app-core          0.5.0-alpha.7 -> v0.5.0-alpha.7
docs                      v0.5.0-alpha.4
```

## Rules

1. `package.json.version` values use SemVer without a leading `v`.
2. Git tags use the same version with a leading `v`.
3. GitHub dependency refs use tag names, for example `github:isoniaos/types#v0.5.0-alpha.5`.
4. Active docs live under `v0.5/`.
5. Historical v0.1 docs live under `archive/v0.1/` and should not be edited as active docs.
6. Do not create future-version documentation until that version is explicitly scoped.
7. Do not tag automatically during pre-tag hardening.
8. When a package depends on a tag from the same compatibility set, create the upstream tag first, then refresh the consumer lockfile before tagging the consumer package.
