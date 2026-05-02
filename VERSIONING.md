# Versioning Rules

Current active version: 0.5.0

## Source of truth

The current version is defined in:

- root package.json, if monorepo exists
- package.json of each package
- docs/CHANGELOG.md
- docs/v0.5/*

## Codex rules

1. Do not invent new versions.
2. Do not update v0.1 docs unless asked.
3. Do not create new version sections in CHANGELOG unless explicitly instructed.
4. All current work goes into:

   ## [0.5.0] - Unreleased

5. When the user says "cut release 0.5.0":
   - replace "Unreleased" with the release date
   - create a new top section:

     ## [0.6.0] - Unreleased

6. Package versions must match the active release version.
7. Documentation version references must match the active version.