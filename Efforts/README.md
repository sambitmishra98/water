---
created: 2026-06-15
type: readme
up:
---

## Purpose

`Efforts` is the active work, planning, project, execution, and personal development layer.

It holds work that is being planned, done, tracked, reviewed, or closed.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

- Active projects and execution notes.
- Active plans in `Efforts/Active-plans`.
- Project status, blockers, next actions, decisions, and reviews.
- Personal development efforts that need tracking or iteration.
- Links to heavy artifacts stored in `Supplementary`.
- Active computational work should keep setup notes, run logs, blockers, config decisions, delta-from-source notes, and Supplementary manifests together in the active effort.

## What does not belong here

- Stable knowledge: use [[Atlas/README]].
- Dated traces, meetings, logs, and timelines: use [[Timeline/README]].
- Uncertain research synthesis: use [[Research/README]].
- Heavy artifacts, datasets, binaries, media, and archives: use [[Supplementary/README]].
- Public-facing outputs and narratives: use [[Worlds/README]].

## Important entry points

- `Efforts/Active-plans`

## Relationship to nearby directories

| Directory | Relationship |
| --------- | ------------ |
| `Atlas` | Receives durable lessons distilled from completed efforts. |
| `Timeline` | Holds dated traces, meetings, logs, and evidence of effort activity. |
| `Research` | Holds uncertain research synthesis before it becomes executable work or stable knowledge. |
| `Supplementary` | Stores heavy artifacts linked from effort notes. |
| `Worlds` | Holds public-facing outputs created from completed efforts. |

## Task absorption rule

Active tasks should live inside the relevant effort note.
Multi-step tasks become efforts or active plans.
Deferred project work belongs in `Efforts/Active-plans` or a future deferred area.

Think of efforts as circles and tasks as rectangles inside them.
The effort preserves why the work matters; the task preserves the next movement.

## Current state

`Efforts` is the active execution layer and may contain unfinished or changing material.

Plans that are currently actionable should be placed in `Efforts/Active-plans`.

## Local conventions

- Prefer next actions, status, blockers, decisions, and review dates.
- Keep active work separate from stable knowledge.
- Deferred cleanup or migration work belongs in `Efforts/Active-plans` if it is a project.
- Atomic time-bound reminders belong in `Timeline`.
- Example: "Migrate software folders out of Supplementary into reproducible setup notes" is an Effort.
- Link to `Supplementary` instead of storing heavy files here.
- When an effort is complete, suggest durable lessons that may move to `Atlas`.
- Do not move project files automatically.

## Known issues

- Active work can become stale without review.
- Heavy artifacts can leak into the note layer.
- Completed efforts may need later distillation into `Atlas`.
