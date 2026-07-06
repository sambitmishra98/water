---
created: 2026-06-15T16:06:00
type: readme
up:
---

## Purpose

`Atlas` is the slow-changing knowledge layer of the vault.

It stores durable concepts, maps, references, definitions, templates, and reusable intellectual structure.

This roughly matches what Nick Milo means by Atlas in his ACE framework.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

- Stable concepts developed by others, tested over years.
- Evergreen reference notes: people, concepts, methods, tools.
- Durable maps and navigation notes.
- People anchors for all people the user knows of, stored under `Atlas/People`.
- Stable self-model anchors and consolidations under `Atlas/Me`.
- Reusable vault infrastructure, such as `Atlas/Utilities/Templates`.
- Evergreen technical lessons from active work after they become stable.
- Notes that may be refined, but are not active work-in-progress.

## What does not belong here

- Active projects: use [[Efforts/README]].
- Ongoing research, uncertain ideas, current literature synthesis: use [[Research/README]].
- Daily logs, captures, timelines, chronological traces: use [[Timeline/README]].
- Public-facing narratives: use [[Worlds/README]].
- Large files, PDFs, datasets, binaries, software dumps, raw evidence: use [[Supplementary/README]].

## Important entry points

Present in this template:

- [[Atlas/Maps]] — compact navigation maps (starts with the Second Brain Operating Model)
- [[Atlas/Concepts]] — durable concept notes
- [[Atlas/Me]] — stable self-model anchors
- [[Atlas/Profession]] — stable professional/project knowledge
- `Atlas/Utilities/AI` — skills, case law, ledger, bootstrap
- `Atlas/Utilities/Templates` — note scaffolds
- `Atlas/Utilities/Terminal-automations` — audit scripts

Create as your content needs them: `Atlas/People`, `Atlas/Things`,
`Atlas/Tools`.

## Relationship to nearby directories

| Directory | Relationship |
| --------- | ------------ |
| `Research` | Incubates uncertain research understanding before it becomes stable enough for Atlas. |
| `Efforts` | Holds active projects; durable lessons may later be distilled into Atlas. |
| `Timeline` | Holds time-based traces; Atlas can link to Timeline when stable ideas have personal history. |
| `Atlas/Me` | Holds self-model and personal meaning linked from people anchors when identity-level. |
| `Worlds` | Holds public-facing narratives; Atlas holds the reusable knowledge behind them. |
| `Supplementary` | Holds large evidence, files, PDFs, datasets, binaries, and archives. |

## Standing target

Target rule: no active work-in-progress notes should live here; when one is
found, propose relocation rather than moving it.
`Atlas/Maps` is the compact navigation layer for the vault.
Directory governance belongs in README and AGENTS files; maps should point to those files instead of replacing them.

## Local conventions

- Prefer concise conceptual definitions over personal reflection.
- A person note can be stable even when the relationship is emotionally complex.
- Emotional, dated, or active material about a person should link to `Timeline`, `Efforts`, or `Atlas/Me` rather than being erased.
- If a note seems unstable, suggest relocation to `Research/+` or `Efforts/+`; do not move it automatically.
- If notes overlap, suggest merge, split, or clearer naming.

## Known instability

`Supplementary` is typically excluded from any note-sync layer and may not be
present on every machine; do not assume it exists on a given clone.
Keep `Atlas` lightweight enough that it can be zipped and given to an LLM.
