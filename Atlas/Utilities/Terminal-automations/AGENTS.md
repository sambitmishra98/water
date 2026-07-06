---
created: 2026-06-17
type: agent-guide
up:
---

## Purpose

Guide LLM work inside `Atlas/Utilities/Terminal-automations`.
Scripts here should inspect, summarize, package, and validate the vault safely.

## Inheritance

This file inherits `[[AGENTS]]` and `[[Atlas/AGENTS]]`.
It also follows `[[Atlas/Utilities/Terminal-automations/README]]`.
Local rules below add script-specific behavior.

## Allowed actions

- Create or edit generic audit and reporting scripts.
- Prefer read-only scripts.
- Write reports to `.llm-context/`.
- Keep script output compact, tabular, and easy to paste into ChatGPT.
- Label scripts as Vault User support or Vault Developer support.

## Forbidden actions

- Do not make scripts destructive by default.
- Do not move notes directly.
- Do not delete files unless the user explicitly requests an apply mode.
- Do not hardcode personal assumptions when a parameter or detected path is safer.
- Do not inspect file contents unless the script purpose makes that clear.

## Local rules

- Scripts must be read-only or dry-run by default.
- Scripts must not modify vault content unless explicitly designed for that and run after approval.
- Scripts should work on any supplied folder, not only the whole vault.
- Scripts should be safe across Desktop and laptop.
- Preserve privacy boundaries around `Supplementary`.
- Treat symlinks as dangerous until audited.
