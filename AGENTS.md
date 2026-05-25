# IsoniaOS Docs Agent Instructions

## Scope

This repository owns the public IsoniaOS documentation site: whitepaper, public roadmap, product and protocol explanation, developer documentation, operator documentation, and the MkDocs plus hosted-build configuration.

It does not own private planning, internal work notes, detailed ISO token implementation or tokenomics material, SaaS or commercial planning, release archive folders, or coding-agent workflow beyond this repository-local file.

## Workspace Instruction Chain

When working inside the private IsoniaOS workspace, read:

1. `../AGENTS.md`
2. `../CURRENT_ROADMAP.md`
3. relevant `../private-docs/` index, governance, roadmap, and migration docs
4. this repository `AGENTS.md`
5. this repository `site/`, `mkdocs.yml`, and `README.md`
6. current source/config files before editing

If this repository is cloned standalone, use this file as the local agent entry point and avoid relying on private workspace-only paths.

## Stack and Commands

- Documentation source: `site/`
- Site generator: MkDocs with Material for MkDocs from `requirements.txt`
- Site config: `mkdocs.yml`
- Hosted-build config: `.readthedocs.yaml`

Useful commands:

```bash
pip install -r requirements.txt
mkdocs serve
mkdocs build
git diff --check
```

## Development Principles

- Keep public docs human-facing for users, developers, operators, and governance participants.
- Keep repository pages short where possible and route detailed local setup to the owning repository.
- Preserve the authority model: contracts model onchain authority, Control Plane indexes and explains, App Core presents and interacts, external records are evidence or context unless explicitly modeled otherwise.
- Do not make production, audit, public beta, legal, SaaS, provider-completeness, grant, ISO launch, token launch, or security-completeness claims without a scoped evidence gate.
- Do not revive `demo-stack` or old version/archive folders as active public guidance.

## Documentation Rules

Update the smallest relevant current page under `site/` for public user, developer, operator, configuration, behavior, or claim changes. Keep `mkdocs.yml` navigation synchronized with files. Remove obsolete duplicate wording instead of adding parallel pages for the same rule.

Do not publish private strategy, internal migration manifests, detailed token-launch material, tokenomics, treasury/legal planning, SaaS planning, customer notes, or internal Codex task templates.

## Testing and Validation

For documentation changes, run:

```bash
mkdocs build
git diff --check
```

If a change only touches repository-local instructions and MkDocs is unavailable, run `git diff --check` and record that the docs build was skipped.
