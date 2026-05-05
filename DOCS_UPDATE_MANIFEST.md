# IsoniaOS Documentation Update Manifest

**Prepared for:** `isoniaos/docs`  
**Prepared date:** 2026-05-05  
**Purpose:** DAO-first strategic documentation refresh, updated whitepaper and roadmap, and Codex-friendly development process docs.

## How to apply

Unzip this archive into the root of the `isoniaos/docs` repository.

Suggested local flow:

```bash
git checkout main
git pull
git checkout -b docs/dao-first-strategy-refresh
unzip isoniaos-docs-update.zip -d .
git status
git diff
```

Then review the diff and commit.

## Files included

Root:

- `README.md`
- `AGENTS.md`
- `WHITEPAPER.md`
- `ROADMAP.md`
- `VERSIONING.md`
- `CHANGELOG.md`
- `DEVELOPMENT-PROCESS.md`
- `DOCS_UPDATE_MANIFEST.md`

Strategy:

- `strategy/MARKET-ENTRY.md`
- `strategy/COMPETITIVE-LANDSCAPE.md`
- `strategy/INTEGRATION-STRATEGY.md`
- `strategy/ACCOUNTABILITY-MODEL.md`
- `strategy/TRUST-AND-SECURITY.md`
- `strategy/AI-POLICY.md`
- `strategy/SAAS-AND-OPEN-CORE.md`
- `strategy/NARRATIVE-AND-MESSAGING.md`

v0.6:

- `v0.6/README.md`
- `v0.6/design-partner-demo.md`
- `v0.6/review-checklist.md`
- `v0.6/codex-task-prompts.md`

## Review priorities

1. Confirm that the first market is DAO/Web3 governance, not civic/state governance.
2. Confirm that the long-term civic/public-governance direction remains present but sequenced later.
3. Confirm that v0.6 remains demo-readiness only: no SaaS, AI assistant, Safe integration, token voting, delegation, or production claims.
4. Confirm that `VERSIONING.md` now treats `v0.6/` as active and `archive/v0.5/` as historical.
5. Decide whether the strategy docs should stay public or whether selected sales/partner content should later move to a private repo.

## Main strategic shift

The refreshed docs keep the long-term vision but sharpen the launch wedge:

```text
IsoniaOS closes the loop between DAO decisions and execution.
```

The launch category is:

```text
DAO Governance Control Plane
```
