# Integration Lab

The [`integration-lab`](https://github.com/isoniaos/integration-lab/blob/main/README.md) repository isolates provider validation, Sepolia workflows, evidence templates, scenarios, and field notes from core product authority.

## What Belongs There

- Live Sepolia runbooks and manifests.
- Pinned Sepolia fork replay notes.
- Managed execution smoke manifests.
- External evidence fixture templates.
- Snapshot, Safe, Tally, Agora, GitHub, Discourse, and explorer research notes.
- QA and presentation scenarios.

## Validation

The current dependency-free validation script checks the managed execution smoke manifest example:

```bash
node scripts/validate-sepolia-managed-execution-manifest.mjs sepolia/managed-execution-manifest.example.json
```

Use the repository README and directory READMEs for scenario-specific guidance.

## Boundary

Integration Lab records are evidence, context, compatibility experiments, or field notes. They are not protocol authority, audited behavior, production configuration, or proof that an external provider integration is complete.
