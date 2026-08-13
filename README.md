# useful-agent-skills

[中文文档](README.zh-CN.md)

A practical catalog of Agent Skills for Codex, Claude Code, Cursor, and other coding agents. It combines original, installable Skills with curated third-party entries reviewed for source, purpose, compatibility, and licensing.

Third-party source code is not copied into this repository, and inclusion is not a security endorsement. Original Skills are published in standalone repositories when mature, or kept under `skills/` while they are still being developed.

## Repository contents

- `skills/`: original Skills that have not yet moved to standalone repositories.
- `catalog/`: human-readable collections organized by use case.
- `registry.json`: machine-readable source, license, compatibility, and verification metadata.

## Original Skills

- [UX Flow Audit](https://github.com/Cheerfay/ux-flow-audit): clarify information hierarchy, UX copy, control affordance, feedback states, and end-to-end task flow.
- [UI Consistency Audit](https://github.com/Cheerfay/ui-consistency-audit): find visual and interaction drift across pages after a redesign, with a deterministic scanner for common leftovers.

Recommended sequence for a redesign: use UX Flow Audit to make the page understandable and actionable, apply the visual direction, then use UI Consistency Audit to catch missed states and related pages.

## Why third-party source is not copied

- Different projects have different licenses and release schedules.
- Copies drift from upstream and make security or behavior changes harder to track.
- This repository records the exact repository, directory, purpose, compatibility, and review status.
- When customization is needed, a permitted derivative can be added to `skills/` with its source and modifications documented.

## Categories

| Category | Coverage |
| --- | --- |
| [Frontend design](catalog/frontend-design.md) | Visual direction, redesigning existing projects, design systems, and UI review |
| [Visual testing](catalog/visual-testing.md) | Browser regression, screenshots, and interaction verification |
| [Design tools](catalog/design-tools.md) | Figma generation, design implementation, and design-system workflows |

See [`registry.json`](registry.json) for the complete machine-readable registry.

## Recommended workflows

### Redesign an existing small website or browser extension

1. `redesign-existing-projects`: audit first, then make focused changes.
2. `frontend-design`: establish color, typography, layout, and a distinctive visual idea.
3. Browser control or Playwright: verify the real UI, responsive states, and interactions.

### Finish a redesign with a consistency pass

1. [`ux-flow-audit`](https://github.com/Cheerfay/ux-flow-audit): clarify information priority, copy, action hierarchy, feedback, and task continuity.
2. Apply the intended visual direction and component styling.
3. [`ui-consistency-audit`](https://github.com/Cheerfay/ui-consistency-audit): find legacy colors, duplicate direction cues, low-contrast text, and component drift.
4. Browser control or Playwright: cover desktop, mobile, translated layouts, and interaction states.
5. Project build and tests: confirm visual changes did not break behavior.

### Design a new page from scratch

1. `frontend-design`: define a clear visual direction.
2. `ui-ux-pro-max`: supplement color, typography, accessibility, and stack guidance.
3. Figma Skills: use when design-file collaboration is required.

## Inclusion criteria

Before adding a Skill, verify that it:

- Has a valid `SKILL.md` and a clear trigger description.
- Has a traceable source repository and directory.
- Does not require running an unexplained installation script.
- Clearly states the problem it solves and how it differs from existing entries.
- Records its license, external dependencies, and known compatibility limits.
- Uses an evidence-based status: `candidate`, `verified`, or `retired`.

## Status definitions

- `candidate`: discovered, but compatibility and real-task validation are incomplete.
- `verified`: source and license reviewed, and used in at least one real task.
- `retired`: no longer recommended; retained to document replacements or prior decisions.

## Security and licensing

- Inclusion is not a security certification. Review scripts, network calls, file writes, and external dependencies before installation.
- This repository's MIT License covers its original Skill source, scripts, catalog text, and structured data.
- Third-party Skills remain under their upstream licenses. Confirm terms before copying or modifying projects marked `not-detected`.
- Prefer pinned commits or releases so upstream behavior cannot change silently.

## Contributing

For a third-party entry, update the relevant catalog and `registry.json` with the source URL, exact path, license, compatibility, review date, and a short risk note.

When publishing an original Skill, check:

- `SKILL.md` and any required `agents/`, `scripts/`, `references/`, or `assets/` in the standalone repository root or `skills/<name>/`.
- Recommended workflows or release notes in the README.
- The relevant `catalog/*.md` page.
- Source, license, compatibility, status, and review date in `registry.json`.
- A top-level `LICENSE` in the source repository. A duplicate license or README is not required inside the Skill folder.

## Recent updates

- 2026-08-14: published the original `ux-flow-audit` Skill and documented the recommended UX-flow-to-consistency workflow.
- 2026-08-14: moved `ui-consistency-audit` to a standalone repository while keeping catalog and workflow links here.
- 2026-08-14: published the original `ui-consistency-audit` Skill for post-redesign visual and interaction audits.
- 2026-08-12: added licensing, publication status, security guidance, and upstream license details.
- 2026-07-28: created the catalog with frontend design, visual testing, and Figma workflow candidates.
