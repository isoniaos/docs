# Documentation Maintenance

Public docs should stay useful to people trying to understand, run, configure, or integrate IsoniaOS.

## Update Rule

Feature additions, behavior changes, configuration changes, and operator-visible changes must update the smallest relevant public doc when they affect users, developers, operators, or public claims.

Use repository-local docs for exact implementation detail and this public site for public-safe guidance.

## When To Update Public Docs

Update this site when a change affects:

- setup or installation expectations;
- configuration fields or environment variables;
- runtime behavior visible to users or operators;
- public APIs, SDK usage, or repository boundaries;
- authority, trust, source disclosure, evidence, or diagnostics semantics;
- roadmap or maturity posture.

## What Not To Publish

Do not publish private planning, internal migration manifests, tokenomics, treasury mechanics, legal or launch plans, private hosted-service planning, customer notes, credentials, or internal agent task templates.

## Validation

For docs changes, run:

```bash
python -m mkdocs build
git diff --check
```

Use the repository-local virtual environment when present.
