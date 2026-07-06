---
up:
created: 2026-07-06T00:00:00
type: readme
---
## Purpose

This repository is a personal knowledge, research, planning, and life operating system, designed for two readers:
- a human, navigating collected notes, thoughts, and work
- an LLM, using `README.md` and `AGENTS.md` files to understand the context of a directory before changing any file in it

This file is the structural contract for the repository. Pair it with `CLAUDE.md` at the root for LLM launch routing.

## Inheritance model

README files work like nested Python `__init__.py` files.
Parent README rules are inherited by child README files.
Child README files should add only local meaning, local rules, and local exceptions.

## Core structure

| Directory       | Role                                                                            |
| --------------- | ------------------------------------------------------------------------------- |
| `+`             | Inbox and raw capture.                                                          |
| `Worlds`        | Public-facing or presentable narratives.                                        |
| `Atlas`         | Slow-changing knowledge layer.                                                  |
| `Timeline`      | Time-based logs, traces, meetings, plans, and timelines.                        |
| `Efforts`       | Active work, projects, personal development, and execution.                     |
| `Research`      | Developing research questions, literature exploration, and uncertain synthesis. |
| `Supplementary` | Large files, evidence, PDFs, datasets, binaries, media, and external storage.   |

AI guidance is not a top-level layer. Durable AI workflow notes belong under `Atlas/Utilities/AI`; tool state and transient context should stay in hidden implementation folders (`.llm-context/`, etc.).

## Operating model: WATER

| Layer      | Meaning                                    |
| ---------- | ------------------------------------------ |
| `Worlds`   | Sharing processed information with others  |
| `Atlas`    | Stable knowledge and anchors               |
| `Timeline` | Dated evidence, logs, plans, timelines      |
| `Efforts`  | Actions performed towards goals            |
| `Research` | Ingesting and synthesizing raw information |

Tasks are behaviour, not a top-level layer. Time-bound reminders belong in `Timeline`. Active or multi-step work belongs in `Efforts`. Stable lessons belong in `Atlas`. Public outputs belong in `Worlds`. Uncertain inquiry belongs in `Research`.

Directory README files are the source of truth for structure; add a compact navigation map under `Atlas/Maps/` once you have enough content to need one.

## LLM interaction modes

| Mode | Meaning | Rules |
| ---- | ------- | ----- |
| `Vault User mode` | Use the repository as a second brain. | Search, summarize, connect notes, draft content, explain concepts, identify folders, and suggest placement. Do not change structure unless asked. |
| `Vault Developer mode` | Improve the repository's internal workings. | Audit structure, write scripts, update governance, propose moves, edit README/AGENTS files, and improve automation. Use dry-run-first behavior, show diffs, preserve links, and do not move, delete, or rename notes without explicit approval. |
| `Hybrid mode` | Use the repository, then propose structure or workflow improvements. | Separate knowledge work from development work before acting. |

Mode gate: if a request is ambiguous, ask: "Are you asking as a user, a developer, or both?"
Default to user mode for note contents, research, writing, or recall.
Default to developer mode for folder structure, scripts, Git, sync, README/AGENTS, templates, or automation.
If both are involved, state the phases before acting.

## Device roles (adapt to your own setup)

| Device | Role | Git | Heavy files | Notes |
| ------ | ---- | --- | ----------- | ----- |
| Primary machine | main development and heavy-archive machine | full local governance Git | may hold `Supplementary/on-drive` | best place for archives, large data |
| Secondary machine | mobile development and synced bridge | local governance Git allowed | no heavy archives | use `Supplementary/in-sync` as temporary intake |
| Mobile | capture, read, review | no Git | no heavy archives | no structural edits; imported media/data goes to `Supplementary/on-drive/media/inbox` on the primary machine |

## What belongs in the lightweight layers vs. Supplementary

Heavy or raw material should not pollute the main knowledge layer. Use `Supplementary` for PDFs, datasets, binaries, software dumps, raw evidence, large media, archives, and anything not suitable for a synced notes app. Link from notes to this material rather than embedding it.

## Supplementary bridge rule (example pattern, adapt freely)

- `Supplementary/in-sync` as a small, explicitly-requested synced bridge between devices.
- `Supplementary/on-drive/media/inbox` as the default primary-machine intake for raw source imports (phones, cloud drives, old drives, camera cards).
- Heavy, private, or raw material should not remain on a secondary machine or in the sync bridge; demote it to `Supplementary/on-drive` (or another external unsynced archive) once on the primary machine.

## Navigation rules

Start here:
1. `README.md`
2. `AGENTS.md`
3. `CLAUDE.md` (LLM launch routing)
4. the relevant directory's own README/AGENTS

Use README files for directory meaning. Use AGENTS files for AI behavior. Use `dir-metadata.md` for structured directory facts once a directory needs them.

## Directory contracts

Significant directories should eventually contain:

|File|Purpose|
|---|---|
|`README.md`|Human-facing explanation of the directory.|
|`AGENTS.md`|AI-facing operating rules for the directory.|
|`dir-metadata.md`|Structured directory facts for audit or dataview-style tooling.|

These files should be compact. They should explain boundaries, not duplicate the knowledge inside the directory.

## Global conventions

- Always use frontmatter.
- Use `##` as the first visible heading.
- Prefer compact notes, one idea per paragraph.
- Link deliberately.
- Avoid vague prose and motivational filler.
- Make notes reusable by humans and LLMs.
- If a note is unstable, place it in `+` for later processing.

## README rules

- README files define directory meaning, boundaries, and local exceptions.
- Child README files inherit parent README rules and should not repeat them.
- If a local rule appears to conflict with a parent rule, flag it for human review.
- Vendor, copied-repository, software, install, template, and generated README files are not governance files unless they use the frontmatter `type: readme`.

## AI rules

An LLM working in this repository should:
- read the nearest `README.md` before suggesting structural changes
- read the nearest `AGENTS.md` before editing or auditing notes
- never move, delete, or overwrite notes without human review
- suggest moves before making them
- flag stale, duplicated, misplaced, oversized, or weakly named notes
- preserve frontmatter style and links when suggesting moves
- prefer short audits over broad rewrites
- avoid inventing structure when directory intent is unclear

## Getting started with this template

- On a fresh clone (any machine, including a cluster login node), walk the checklist in `Atlas/Utilities/AI/Fresh clone bootstrap.md` — or start an LLM session from this directory and ask it to bootstrap.
- Notes you write stay untracked by default: `.gitignore` ignores everything except the framework's own files, so `git push` cannot leak personal content, and `git pull` brings framework updates without touching your notes.
- Claude Code skills ship ready: `.claude/skills/` symlinks into the durable source at `Atlas/Utilities/AI/skills/` (second-brain retrieval discipline, plus the morning-descent / session / evening-reflect daily triad).
- Read through `Atlas/Profession/ExampleProject/`, `Efforts/profession/ExampleProject/`, `Research/profession/ExampleProject/`, and `Worlds/Presentable/Research/ExampleProject/` to see one project threaded through every layer, then rename or delete it.
- Write your own content policy here (what belongs in this repository, how much of it an LLM may author directly, how outside information gets attributed) — this template does not prescribe one.
- Run the audits under `Atlas/Utilities/Terminal-automations/` to check the repository's current structural health at any point.

## Known risks

- Some folders may be generated by plugins or tools and should not receive manual README/AGENTS work.
- Some notes may end up in the wrong layer; that is normal and correctable.
- README/AGENTS files may drift from actual intent over time; revisit them periodically.
- Personal note content is typically gitignored by design (see `.gitignore`); back it up by your own means.

## Safe terminal scans

Use inspection commands before editing structure.
Preferred scans:
- `find . -maxdepth 2 -type d | sort`
- `find . -maxdepth 2 -type f -name '*.md' | sort`
- `du -sh * .[^.]* 2>/dev/null | sort -h`
- `find . -name README.md -o -name AGENTS.md -o -name dir-metadata.md | sort`

Scripts in this template dry-run by default.
