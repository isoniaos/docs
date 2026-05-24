# Documentation

This repository is the public documentation home for IsoniaOS.

## Structure

- Root `README.md` stays short.
- Detailed documentation lives under `site/`.
- `mkdocs.yml` defines navigation.
- `.readthedocs.yaml` points ReadTheDocs to the MkDocs configuration.

## Writing rules

- Write concrete public English.
- Keep authority and trust boundaries visible.
- Do not move private planning into public docs.
- Do not add token-specific implementation docs to this repository.
- Do not add internal commercial planning to this repository.
- Do not preserve outdated docs only for history.

## Maintenance

When behavior, rules, or public wording changes:

- update the smallest relevant current page;
- remove obsolete duplicate wording;
- keep navigation working;
- run the docs build;
- report intentionally removed pages and unresolved checks.
