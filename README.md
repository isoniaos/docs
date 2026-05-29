# IsoniaOS Docs

This repository owns the public product, user, developer, and reference documentation for IsoniaOS. The source pages live under [`site/`](site/), with the public entry point at [`site/index.md`](site/index.md) and the single developer overview at [`site/developers/index.md`](site/developers/index.md).

Private planning, business planning, and workspace migration notes do not belong in this repository.

## Installation

Use Python 3 with the dependencies declared in [`requirements.txt`](requirements.txt):

```bash
python -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
```

On Windows PowerShell:

```powershell
py -m venv .venv
.venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

## Configuration

[`mkdocs.yml`](mkdocs.yml) configures the site:

- `docs_dir: site`
- `site_dir: public`
- Material for MkDocs theme settings and navigation
- `site_url: https://docs.isonia.org/`

Hosted documentation build configuration is kept in [`.readthedocs.yaml`](.readthedocs.yaml). This repository does not require runtime environment variables for local documentation builds.

## Run / Usage

Preview locally:

```bash
mkdocs serve
```

Build the static site:

```bash
mkdocs build
```

Public strategic papers are maintained as MkDocs-compatible Markdown sources at [`site/litepaper.md`](site/litepaper.md) and [`site/whitepaper.md`](site/whitepaper.md). PDF-only build assets are kept outside this public docs repository.

## Troubleshooting

- If `mkdocs` is not found, activate the virtual environment and reinstall `requirements.txt`.
- If navigation fails, check that every path in `mkdocs.yml` exists under `site/`.
- Source pages belong under `site/`; generated output belongs under `public/`.
- PDF build scripts, Pandoc metadata, BibTeX references, and generated PDFs do not belong in this public repository.
- Do not restore old `archive/` or versioned public-docs folders as active navigation. Historical material belongs in Git history and private migration records.

## Contribution

Read [`AGENTS.md`](AGENTS.md) before editing this repository. When changing user, developer, operator, configuration, or public-claim behavior, update the smallest relevant current page under `site/` and keep `mkdocs.yml` navigation valid.

Do not copy private strategy, business planning, or workspace automation workflow into public docs.

## License

No repository-local license file is currently present.
