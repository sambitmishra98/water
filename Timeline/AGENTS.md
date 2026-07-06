---
created: 2026-06-17
type: agent-guide
up:
---
## Purpose

Guide LLM work inside `Timeline`, the time, memory, evidence, and planning trace layer.

## Inheritance

This file inherits the root agent guide in `[[AGENTS]]`.
It also follows the directory meaning in `[[Timeline/README]]`.
Local rules below add Timeline-specific behavior.

## Allowed actions

- Read `Timeline/README.md` before acting in `Timeline`.
- Summarize dated notes, meetings, timelines, and logs.
- Suggest links to people, places, efforts, research, and media folders.
- Help identify status, chronology, privacy level, and missing evidence.
- For `Timeline/Timeline` notes, suggest chronological tightening, likely `[[links]]`, and downstream destination notes.
- When explicitly asked, create or update narrow downstream notes using the relevant template and preserve a backlink to the source Timeline note.
- When explicitly asked to apply a Timeline refactor, create or update the relevant `Timeline/Timeline/YYYY-MM-DD` notes for previous-day or multi-day material.
- Create or update monthly/yearly review notes only when requested, using `Timeline/Timeline/YYYY-MM` and `Timeline/Timeline/YYYY`.
- For monthly reviews, wait until at least one full Monday-Sunday week in the month has completed unless the user explicitly asks earlier.
- For yearly reviews, wait until at least one four-month semester has completed unless the user explicitly asks earlier.

## Forbidden actions

- Do not expose, normalize, or summarize private memories casually.
- Do not embed large private media in synced notes.
- Do not move raw media links or files without approval.
- Do not invent dates, events, people, or evidence.
- Do not silently disperse Timeline-note facts into other folders without user approval.
- Do not rename `Timeline/Logs` wholesale or mass-move legacy log files without explicit human approval and a migration plan.
- Do not directly overwrite a user's manually written Timeline-note prose during refactors unless explicitly approved.
- Do not create new notes in old abstract streams such as `external`, `physical`, `mental`, `left`, or `right` unless explicitly requested.
- Do not treat `Timeline/STALE-*` directories as active sources unless explicitly running a migration or audit.

## Local rules

- Treat dated evidence and memory notes as privacy-sensitive.
- Preserve all frontmatter and date/location/physical/mental/emotional fields unless explicitly asked to edit them.
- Do not fabricate events. Convert only genuinely actionable items into tasks.
- If a dated note is nearly empty, suggest structure rather than inventing content.
- For lightweight daily cleanup, prefer `## Log`, `## Tasks`, `## Research`, `## Reflection`, and `## Links` when that structure fits the note.
- Prefer date-first organization where time is central.
- Keep raw media references pointed toward `Supplementary/on-drive/Calendar`.
- Flag notes that look too private for synced storage.
- Suggest `Timeline` when timing, review cadence, or dated reminders matter.
- Treat `Timeline/Timeline` notes as source traces. Improve them toward concise chronology while preserving the user's voice and meaningful emotional charge.
- In Timeline notes, make each routeable raw snippet block self-sufficient and add a stable block ID. Split or join paragraphs when needed so each block can travel cleanly.
- Use `###` route headings only when they improve capture or later routing. Date headings can help daily percolation, and destination headings such as `### ExampleProject` can help project/profession percolation, but the block ID is the durable routing handle.
- For project/profession headings such as `### ExampleProject`, embed raw snippet block IDs into the relevant so-far note or specialized log rather than copying prose. Prefer block embeds over heading embeds so later destination-note renames do not break the source trace. `Timeline/Logs` should preserve externally explainable continuity and should not replace Timeline evidence.
- When processing voice-transcribed notes, infer obvious `[[double-square-bracket]]` links from existing vault anchors, but mark uncertain links as suggestions rather than facts.
- Extract candidates for dispersion explicitly: people facts to `Atlas/People`, stable concepts or objects to `Atlas`, active work to `Efforts`, uncertain inquiry to `Research`, public narrative to `Worlds`, and raw evidence/media to `Supplementary`.
- Keep the dated fact in the Timeline note even when a destination note is created, so the source chronology remains intact.
- Preserve the source trace under clearly marked headings when adding LLM-generated summaries, restructuring, or percolation notes.
- If a Timeline note substantially describes previous days, split the account by actual date into the relevant `Timeline/Timeline/YYYY-MM-DD` notes by embedding the source raw blocks. Add compact block references from the source note to destination sections only when useful.
- If a Timeline note only captures an instant or the last few hours, do not create a daily consolidation unless the user asks.
- Keep daily Timeline notes chronological. Use topical subheadings only when they improve clarity.
- Put LLM-written consolidation under `## Percolated by LLM`, with source provenance hidden in an Obsidian comment.
- Prefer embedding raw snippet block IDs from the source Timeline note into destination notes instead of duplicating raw prose.
- Give each `## Percolated by LLM` group in a daily Timeline note a stable block ID, so source notes or review notes can reference the daily consolidation.
- Put candidate downstream percolations and unresolved checks under `## Open loops` only in the note that owns the actual text. If a daily Timeline note merely embeds raw source blocks, keep the open loops in the source Timeline note.
- In source Timeline notes, make percolation auditable with source block IDs and, when useful, a compact `## LLM-generated percolation` or destination list. Prefer links or block IDs over recursive embeds when the destination already embeds the source.
- Once the raw source content is fully preserved in daily Timeline notes, it may be wrapped in a collapsed `[!raw]- Raw notes` callout for readability.
- Separate facts from interpretation when needed, and mark uncertain dates or claims clearly.
- Before creating or changing People, Atlas, Efforts, Research, profession-log, monthly, or yearly notes from a Timeline trace, present the proposed percolation unless the user explicitly asked to apply it.
- Profession logs remain useful specialized streams. They should summarize curated work continuity; Timeline notes remain the primary dated life trace.
- During monthly review, scan `## Open loops` in notes that own actual text, usually source Timeline notes for embed-only daily material. Close resolved loops only when later evidence supports closure, and carry unresolved loops forward once.
- For batch percolation, use `## Percolated by LLM` in the destination note and hidden `%%percolated-source: ...%%` markers for idempotence.
- Put sources that are too messy, too private, too long, code-heavy, ambiguous, or spanning dates outside their own period under `## Percolation review needed` instead of forcing a summary.
- Create missing daily, monthly, or yearly Timeline destination notes only with the current minimal frontmatter and append-only generated sections.

## Standard Timeline-note review output

When asked to review or refactor a Timeline note, report:
- What the note currently contains.
- Which dates are involved.
- Suggested `Timeline/Timeline` notes to create or update.
- Suggested `[[links]]` to insert.
- Suggested downstream notes for People, Atlas, projects, or profession logs.
- Exact proposed edits or a patch if the user asks for terminal-driven changes.
- Privacy risks or ambiguous dates.
