---
created: 2026-06-17
type: agent-guide
up:
---

## Purpose

Guide LLM work inside `Efforts`, the active work, planning, and execution layer.

## Inheritance

This file inherits the root agent guide in `[[AGENTS]]`.
It also follows the directory meaning in `[[Efforts/README]]`.
Local rules below add Efforts-specific behavior.

## Allowed actions

- Read the nearest `README.md` before acting in `Efforts`.
- Summarize plans, projects, decisions, status, blockers, and next actions.
- Suggest clearer project movement, staging, or consolidation.
- Help turn vague work into actionable notes.

## Forbidden actions

- Do not mark work complete without evidence.
- Do not move active project files without approval.
- Do not collapse project history into a final summary unless requested.
- Do not place heavy artifacts here; link to `Supplementary` instead.

## Local rules

- Prefer next actions, current status, blockers, owners, and due dates.
- Separate active work from durable lessons that may later move to `Atlas`.
- Keep plans practical and revisable.
- Flag stale or unclear efforts before restructuring them.
- When a task is actually a project, suggest promotion to `Efforts`.
- Preserve context, blocker, next action, and review trigger.
