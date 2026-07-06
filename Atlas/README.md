---
created: 2026-06-15T16:06:00
type: readme
up:
---

## Purpose

`Atlas` is the slow-changing knowledge layer of the vault.

It stores durable concepts, maps, references, definitions, templates, and reusable intellectual structure.

This roughly matches what [[Nick]] means by Atlas.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

- Stable concepts developed by others, tested over years.
- Evergreen reference notes, such as [[Jesus|Christ]] or [[Discontinuous spectral element methods|DSEM]].
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

- [[Atlas/Maps]]
- [[Atlas/Me]]
- [[Atlas/Concepts]]
- [[Atlas/People]]
- [[Atlas/Profession]]
- [[Atlas/Things]]
- [[Atlas/Tools]]
- [[Atlas/Utilities/Templates]]

## Relationship to nearby directories

| Directory | Relationship |
| --------- | ------------ |
| `Research` | Incubates uncertain research understanding before it becomes stable enough for Atlas. |
| `Efforts` | Holds active projects; durable lessons may later be distilled into Atlas. |
| `Timeline` | Holds time-based traces; Atlas can link to Timeline when stable ideas have personal history. |
| `Atlas/Me` | Holds self-model and personal meaning linked from people anchors when identity-level. |
| `Worlds` | Holds public-facing narratives; Atlas holds the reusable knowledge behind them. |
| `Supplementary` | Holds large evidence, files, PDFs, datasets, binaries, and archives. |

## Current state

`Atlas` is useful but not clean.
Target rule: no active work-in-progress notes should live here.
Current risk: some notes may still be developing ideas rather than durable references.
`Atlas/Notes` should be dismantled.
Its files should be moved into clearer locations.
`Atlas/Maps` is the compact navigation layer for the vault.
Directory governance belongs in README and AGENTS files; maps should point to those files instead of replacing them.

## Local conventions

- Prefer concise conceptual definitions over personal reflection.
- A person note can be stable even when the relationship is emotionally complex.
- Emotional, dated, or active material about a person should link to `Timeline`, `Efforts`, or `Atlas/Me` rather than being erased.
- If a note seems unstable, suggest relocation to `Research/+` or `Efforts/+`; do not move it automatically.
- If notes overlap, suggest merge, split, or clearer naming.

## Known instability

`Supplementary` is not synced with Obsidian Sync.
It may be unstable when accessed from the SSD pendrive.
Keep `Atlas` lightweight enough that it can be zipped and given to an LLM.
