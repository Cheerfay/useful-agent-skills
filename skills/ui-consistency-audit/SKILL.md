---
name: ui-consistency-audit
description: Audit and fix visual or interaction drift after a frontend redesign. Use after rebranding, theme changes, landing-page redesigns, component restyling, or multi-page UI polish when old colors, typography, buttons, badges, alerts, icons, arrows, borders, spacing, focus states, responsive layouts, or translated variants may remain inconsistent. Also use when the user asks to sweep the UI for missed legacy details or make related pages visually consistent.
---

# UI Consistency Audit

Perform a systematic post-redesign pass. Preserve behavior and work with the existing design system.

## Workflow

1. Identify the intended visual system from the latest approved page, shared CSS tokens, and the user's explicit feedback. Do not infer the target from older components.
2. List the affected routes, shared components, dialogs, empty/error/loading states, and both locale variants. Include pages reachable from the changed surface, not only the first screen.
3. Run `scripts/scan-ui-drift.sh` from the repository root. Pass specific paths when the request is narrow. Treat its output as candidates requiring inspection, not automatic defects.
4. Inspect each affected surface using the checklist below. Search with `rg` before editing.
5. Fix confirmed inconsistencies with small, reviewable changes. Reuse established tokens and components.
6. Run `git diff --check` and the repository's required build or test command.
7. When browser control is available, inspect desktop and mobile in every supported locale. Exercise default, hover, focus, selected, disabled, loading, empty, error, success, and completed/incomplete states that the changed UI can reach. If browser inspection is unavailable or authentication blocks it, state that limitation.

## Audit Checklist

### Color and surfaces

- Find legacy color utilities, hard-coded colors, gradients, shadows, borders, and focus rings.
- Check nested and linked pages, dialogs, notices, toasts, loading indicators, empty states, and errors.
- Distinguish semantic colors from accidental remnants. Do not replace success/error colors blindly.
- Confirm text contrast, especially secondary copy, dates, metadata, placeholders, disabled controls, and history rows.

### Typography and spacing

- Match display, section, body, metadata, and numeric styles to their intended roles.
- Check line height, wrapping, orphaned words, CJK/Latin font fallback, and English/Chinese layout separately.
- Compare repeated page structures for consistent hero-to-content spacing, back-link spacing, card padding, and section rhythm.

### Controls and states

- Make buttons, links, tags, filters, status labels, and badges visibly distinct by role.
- Check hover, active, focus-visible, selected, disabled, loading, validation, error, success, empty, and incomplete states.
- Ensure status text is noticeable without accidentally looking clickable.
- Avoid a full bordered input nested inside another heavily framed form unless the hierarchy requires it.

### Icons and direction cues

- Check icon color, background, radius, size, stroke weight, and alignment.
- Ensure each action uses one directional cue. If translated copy already contains `→`, `←`, `↑`, or `↓`, do not render a second arrow icon beside it.
- Confirm back navigation is visible and has an adequate click target.
- Remove decorative icons that duplicate nearby text without improving scanning.

### Responsive and locale coverage

- Check all supported locales for wrapping, punctuation, label length, button width, and layout changes.
- Check mobile and desktop header organization, first-viewport height, fixed-format controls, and overlap.
- Verify that dynamic content cannot resize or shift stable controls unexpectedly.

## Scope Rules

- For a narrow user report, fix the reported surface and directly connected variants or states.
- For a rebrand or whole-page redesign, audit all routes and shared components touched by the same visual system.
- Do not turn a consistency pass into an unrelated redesign.
- Report remaining candidates separately when they are outside the authorized scope.

## Deliverable

Lead with confirmed fixes or findings. Mention the surfaces and states checked, verification commands, and any visual checks that could not be performed. Do not claim screenshot validation unless it was actually completed.

## Script

Run:

```bash
.claude/skills/ui-consistency-audit/scripts/scan-ui-drift.sh
```

Or limit the scan:

```bash
.claude/skills/ui-consistency-audit/scripts/scan-ui-drift.sh src/routes/settings src/components
```

The script reports legacy color tokens, hard-coded colors, direction cues, pill-like controls, low-contrast text candidates, and frontend files changed in Git. Review every result in context.
