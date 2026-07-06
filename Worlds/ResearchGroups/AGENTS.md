---
created: 2026-06-18
type: agent-guide
up:
---

## Purpose

Guide LLM work inside `Worlds/ResearchGroups`, the research-group interface layer.

## Inheritance

This file inherits `[[Worlds/AGENTS]]`.
It also follows `[[Worlds/ResearchGroups/README]]`.

## Allowed actions

- Create self-contained summaries, source links, proposal maps, project dashboards, validation notes, and communication-ready notes.
- Suggest Drive manifests for large payloads.
- Preserve links back to the parent vault only when safe.

## Forbidden actions

- Do not include private parent-vault material unless explicitly curated.
- Do not imply a group has approved or adopted material without evidence.
- Do not copy heavy private payloads into `Worlds`.
- Do not assume GitHub is appropriate for heavy group data.

## Local rules

- Treat each research group folder as potentially shareable.
- Prefer clear audience, purpose, source, and review status.
- Flag unsafe parent-vault links before sharing.
