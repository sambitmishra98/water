---
up:
  - "[[README]]"
created: 2026-06-15T17:45:00
type: readme
---
## Purpose

`Timeline` is the time layer of the vault.
It stores dated notes, logs, meetings, plans, memories, and timelines.
Its job is to answer: what happened, when did it happen, and where is the evidence?
`Timeline` should help me build a bird's eye view of my life without depending on Google Photos, Facebook, WhatsApp, or other online systems.

## Inheritance

This README inherits the root vault contract in [[README]].
It carries over [[README#Global conventions]] and [[README#README rules]].
The sections below add local rules for this directory.
If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

- `Timeline/Timeline` is the active historical evidence layer. Any note whose name is a date stamp or date-time stamp belongs there, including former timestamp captures, daily consolidations, monthly reviews, and yearly reviews.
- `Timeline/Plans` stores uncertain future material whose timing, significance, or final form is not yet solidified.
- `Timeline/Events` stores bounded arcs with a start and end, or a planned start and end, such as a PhD, postdoc, trip, conference, or major project phase.
- `Timeline/Logs` stores externally explainable progress records, such as project status updates, work continuity reports, and records that may later be shown to other people.
- The old conceptual split between `Timeline/now`, `Timeline/today`, `Timeline/monthly`, and `Timeline/yearly` is deprecated. Their meaning is now merged into `Timeline/Timeline`.
- A windowed interaction with a person can be placed here, which has a significance that needs to be noted.
- Time-based logs.
- Plans placed in `Timeline/Plans` are future-facing notes. A Plan may later become an Event, the source for one or more Timeline notes, or a stale/abandoned direction mentioned from Timeline.
- `Timeline/Memories` stores notes on significant chunk of childhood memories that may have shaped me, for which a specific date cannot be placed. Each note in here is an attractor of other atomic memories, as it is a narrative I have created that fits a picture I saw in the past. This narrative needs to be revisited every few months/years to observe how I have changed as a person. 
- Pointers to dated media folders in `Supplementary`.
- Consolidations of the past, organised into periods.
- Daily technical progress logs belong in `Timeline/Logs/profession/<project>` and should link back to the active Effort.

## What does not belong here

- People and places involved in the photos are slow-changing anchors to photos. Store in `Atlas`.
- A planning of a trip or a stay is an effort, store in `Efforts`.
- A raw log of meeting MoM belongs in `Timeline`, the evolving concept that gets continually over-written is placed in `Efforts` or `Research`.
- Raw media is first brought to `Supplementary`. The directory setup and naming convention in `Supplementary` is compatible with `Timeline`, and selected curated photos from `Supplementary` are placed in `Timeline`.
- Public-facing stories: use [[Worlds/README]].
- Avoid creating new notes in old abstract streams such as `external`, `physical`, `mental`, `left`, or `right` unless the user explicitly asks. Diffuse their useful information into dated Timeline notes, stable Atlas notes, people notes, project notes, or profession logs.

## Important entry points

- `Timeline/Logs`
- `Timeline/Timeline`
- `Timeline/Plans`
- `Timeline/Events`
- `Timeline/Meetings`
- `Timeline/Memories`
- `Timeline/STALE-*` migration shelters, not active sources

## Layer naming semantics

| Layer | Folder | Meaning |
| ---- | ---- | ---- |
| Historical evidence | `Timeline/Timeline` | Dated and date-time notes recording what happened. |
| Uncertain future | `Timeline/Plans` | Future-oriented material whose timing or final form is not yet fixed. |
| Bounded arcs | `Timeline/Events` | Meaningful intervals such as PhD, postdoc, trips, conferences, or project phases. |
| External continuity | `Timeline/Logs` | Progress records that may need to be shown or summarized for other people. |
| Migration shelters | `Timeline/STALE-*` | Temporary holding areas. Do not treat as active workflow sources unless explicitly auditing or migrating. |

## Relationship to nearby directories

| Directory       | Relationship                                                                                         |
| --------------- | ---------------------------------------------------------------------------------------------------- |
| `Atlas`         | Stores stable knowledge distilled from time-based traces.                                            |
| `Efforts`       | Stores active work to potentially create new memories; Timeline records when work happened.          |
| `Research`      | Stores developing research; Timeline records meetings, reading periods, and dated research activity. |
| `Worlds`        | Stores public-facing narratives distilled from Timeline traces.                                      |
| `Supplementary` | Stores raw evidence, media, recordings, and large files linked from Timeline.                        |

## Review and reminder rule

Time-bound reminders, dated reviews, recurring reviews, and "remind me later" items belong in `Timeline`.

## Planning horizon vocabulary

Use these horizons as a mental model for planning and review, not as mandatory folders.

| Code | Horizon | Use |
| ---- | ------- | --- |
| `I` | Instant | Capture what is happening now. |
| `B` | Bout | One focused bout, often one ultradian cycle. |
| `D` | Day | Daily capture, consolidation, and review. |
| `W` | Week | Weekly rhythm and work/recovery balance. |
| `Q` | Quarter | Ten to sixteen week execution arc. |
| `Y` | Year | Seasonal and annual review. |
| `G` | Generation | Roughly decade-scale narrative. |
| `L` | Life | Long-horizon alignment. |

Create or update notes only when the horizon helps review, predict, remember, or act.

## Memory and media rule

`Timeline` should index memories, not store raw media.
Raw private media belongs in `Supplementary/on-drive/Calendar`.
Preferred folder pattern:
`Supplementary/on-drive/Calendar/YYYY/YYYY-MM/YYYY-MM-DD__event-slug/`
A Timeline memory note may link to that folder, summarize the event, and mark whether it is private or showable.

## Data boundaries

Not all information is synced. Not all synced information is easily show-able. 

| Level                             | Location                           | Rule                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| --------------------------------- | ---------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Un-synced timeline archive        | `Supplementary/on-drive/Calendar/` | This directory captures all the memories I have. This is a massive directory. A few of the information in here is copy-pasted to `Timeline`.<br>This directory is always in the SSD, never synced. <br>This information may be referenced within notes inside itself, care must be taken to not be linked to notes from outside. <br>A big chunk of information in here is my shadow I choose to not see too frequently, unless I have a strong safety net to be emotionally stable. |
| Synced timeline                   | `Timeline`                         | This directory is a well structured directory synced with `Obsidian-sync`. <br>Always synced, easily zip-able to feed into a GPT to obtain useful insights, create newer files for consolidation etc. <br>Any information that is potentially too private needs to be flagged by an LLM for placement in `Supplementary`.                                                                                                                                                            |
| Synced timeline show-able         | `Worlds/Presentable/Timeline`      | This is content I have curated for showing to others. All media references here are from `Timeline`.<br>The media in here are grouped and organised well for showcasing, one note for each presentable bunch of images.                                                                                                                                                                                                                                                              |
| Synced timeline show-able website | `Worlds/Online-presence/Calendar`  | My personal website that replaces any need for me to use `Instagram` or `Facebook`. <br>Pictures in here are visible to the whole world at all times.                                                                                                                                                                                                                                                                                                                                |

## Current state

- `Timeline/Timeline` is the active destination for date-stamped and date-time-stamped notes.
- Former `now`, `today`, `monthly`, and `yearly` notes should be treated as Timeline material during future migration.
- Some logs are dense and some are sparse.
- Setups need to be templated well enough. An automatic TODO task needs to be set up that pings me when a week/month/year passes by without me consolidating my life into it. 
- Raw media MUST remain outside Obsidian Sync, well organised into `Supplementary`.

## Local conventions

- Carry over parent conventions from `README#Global conventions`.
- When creating Timeline notes, template and frontmatter must be used consistently.
- Prefer date-first file names where time is central.
- Keep one event or one time period per note.
- Link dated notes to relevant people, places, efforts, research, and media folders.
- Do not embed large private media directly in synced notes.
- Mark privacy clearly when a note points to private media.

## Timeline-note goals

Timeline notes should optimize for faithful capture first and clean dispersion later.
Older migrated notes may still use deprecated capture/consolidation terminology; interpret that material as `Timeline/Timeline` evidence.

They should help answer:
- What happened, in chronological order?
- Who, where, and what was involved?
- What should become a stable anchor elsewhere?
- What is an action, reminder, open loop, or evidence pointer?
- What emotional signal should be preserved without over-interpreting it?

Preferred Timeline capture shape:
- Keep the user's original voice and meaningful emotional charge.
- Reorder into chronology when helpful, with minimal information loss.
- Use concise paragraphs or short bullets when speech transcription is messy.
- Add `[[double-square-bracket]]` links for people, places, projects, concepts, media, health patterns, and recurring objects when the target is likely useful.
- Do not force subsection-heavy structure when chronology is the primary meaning.
- Make each routeable raw snippet block self-sufficient and give it a stable block ID, such as `^raw-2026-06-22-0847-2026-06-19-01`.
- Use `###` route headings only when they improve capture or later routing. Date headings such as `### 2026-06-19` and destination headings such as `### ExampleProject` are helpful, but the block ID is the durable routing handle.
- One daily Timeline note may embed multiple raw snippet blocks from the same source Timeline note.
- For profession/project headings such as `### ExampleProject`, destination so-far notes should embed raw snippet block IDs from the source Timeline note rather than copying prose. Block embeds are preferred over heading embeds so the destination note can later be renamed without breaking the raw source trace.
- If a fact belongs in a stable note, keep the dated trace here and suggest or create the destination note only when explicitly asked.
- Do not directly overwrite manually written source material during refactors. Put LLM-generated restructuring, summaries, extracted links, and proposed percolations under clearly marked LLM-generated headings unless the user approves a direct rewrite.
- If a source Timeline note substantially describes previous days, create or update the correct `Timeline/Timeline/YYYY-MM-DD` note for each date when explicitly asked to apply the refactor.
- If a source Timeline note only captures the current instant or last few hours, a daily Timeline consolidation is optional.
- When a source Timeline note is percolated into daily Timeline notes and the source content is fully preserved through block embeds, the raw source prose may be placed in a collapsed `[!raw]- Raw notes` callout so any generated percolation is easier to read.
- When a source Timeline note is percolated into daily Timeline notes, make the routing auditable with source block IDs and, when useful, a compact `## LLM-generated percolation` or destination list. Prefer links or block IDs over recursive embeds when the daily Timeline note already embeds the source note.
- Put `## Open loops` in the note that owns the actual text. If a daily Timeline note only embeds raw blocks from a source Timeline note, keep open loops in the source Timeline note. Mention each open loop once, then carry or resolve it from review notes with source links.

Examples of dispersion:
- A birthday mentioned in a Timeline note can seed or update an `Atlas/People` note using [[Template, People]].
- A recurring health symptom can later seed a health-pattern note while this note remains the dated evidence.
- A concrete task can become a dated reminder in `Timeline` or active work in `Efforts`.
- A stable location, movie, tool, or concept can become an `Atlas` anchor.
- A raw snippet under a project-name or meeting-type heading (e.g. `### ExampleProject`, `### Advisor meeting`) can seed or update the relevant profession so-far note or specialized log.

## Daily Timeline-note goals

Daily Timeline notes are clean chronological accounts of one date.
Older migrated daily notes may still use deprecated consolidation terminology; interpret that material as `Timeline/Timeline/YYYY-MM-DD` guidance.

They should:
- Use [[Template, Timeline, Today]] as the reference template.
- Keep the template Dataview source table at the top of the note.
- Preserve important details with minimal loss.
- Include professional progress, health events, people interactions, travel, purchases, research, ideas, and emotional traces that happened that day.
- Use subheadings only when they improve clarity; chronology remains the main retrieval axis.
- Separate facts from interpretation when needed.
- Mark uncertain dates or uncertain claims clearly.
- Link back to source Timeline notes and make later backfilled capture visible.
- Put LLM-generated daily consolidation under `## Percolated by LLM`.
- Put source provenance in an Obsidian comment, not in the visible embedded heading.
- Prefer embedding raw snippet block IDs from the source Timeline note into the daily Timeline note, rather than duplicating raw prose. The daily Timeline note may still add light LLM-written connective text when needed.
- Give each `## Percolated by LLM` group a stable block ID, so a source Timeline note or review note can reference the daily consolidation.
- Do not add `## Open loops` to an embed-only daily Timeline note. Add it only when the daily Timeline note owns actual authored text; otherwise keep downstream candidates and unresolved checks in the source Timeline note.

If a source Timeline note needs a visible percolation index, use a compact link or block-reference list, for example:

```markdown
%%This source Timeline note backfills from YYYY-MM-DD to YYYY-MM-DD.%%

- [[Timeline/Timeline/YYYY-MM-DD#^percolated-YYYY-MM-DD-HHmm]]
```

## Percolation convention

Percolation means moving evidence upward without erasing the lower-level source.

Use these routes:
- Now notes `YYYY-MM-DD_HH-mm` percolate into daily notes `YYYY-MM-DD`.
- Daily notes `YYYY-MM-DD` percolate into monthly notes `YYYY-MM`.
- Monthly notes `YYYY-MM` percolate into yearly notes `YYYY`.

Destination notes may be created if missing.
Use `## Percolated by LLM` near the end of the destination note.
Use `### From now notes`, `### From daily notes`, or `### From monthly notes` under that section.
Use hidden source markers such as `%%percolated-source: [[Timeline/Timeline/YYYY-MM-DD_HH-mm]]%%` so repeated runs do not duplicate entries.
Keep source notes as the raw evidence.
For batch percolation, concise source-linked bullets are safer than recursive whole-note embeds.
Use `## Percolation review needed` when a source is too messy, too private, too long, code-heavy, ambiguous, or spans dates outside its own period.

## Review horizons

Monthly and yearly notes should support broad memory, current priorities, open loops, future planning, research continuity, and pattern detection.

- Monthly notes live in `Timeline/Timeline` as date-like review notes, such as `YYYY-MM`, and gather from Timeline notes.
- Monthly notes may use Monday-Sunday week subheadings.
- Create or update a monthly note only after at least one full Monday-Sunday week in that month has completed, unless the user explicitly asks for an earlier note.
- Monthly review should scan `## Open loops` in the notes that own the actual text: usually source Timeline notes for embed-only daily Timeline notes, and daily Timeline notes only when they contain authored daily text. If later notes resolve an open loop, mark it resolved with a source link or remove it from the carried-forward list; otherwise keep flagging it.
- Yearly notes live in `Timeline/Timeline` as `YYYY` review notes and gather from monthly notes.
- Yearly notes may use semester subheadings: Jan-Apr, May-Aug, and Sep-Dec.
- Create or update a yearly note only after at least one four-month semester has completed, unless the user explicitly asks for an earlier note.
- Use Dataview or DataviewJS when useful, but do not force a rigid template yet.

## Naming conventions

Use date-first names for time-bound notes.

Examples:
- `Timeline/Timeline/2026-06-15_11-56` for an instantaneous capture.
- `Timeline/Timeline/2026-06-15` for a daily consolidation.
- `Timeline/Timeline/2026-06` for a monthly review horizon.
- `Timeline/Timeline/2026` for a yearly review horizon.
- `Timeline/Meetings/2026-06-15_Meeting-PMG` created with [[Templater, Meeting notes]]
- `Timeline/Plans/P1231 Trip to Athens` created with [[Templater, Plan]]


### Raw media folders
We need a very strong convention: `YYYY-MM-DD_HH-mm-ss overarching-event-name instantaneous-snapshot-name instantaneous-snapshot-count`
- We only place `HH-mm-ss` if we have easy access to the hour-minute-second from either the metadata of the image file or from the name of the image file, else skip.
- `overarching-event-name` may be a theme spanning a few days, may be nested too, like `Italy-trip-2-Switzerland`
- `instantaneous-snapshot-name` can be a consolidation of a bunch of pictures taken in a burst, or taken within a few seconds towards a highly common related theme.
- `instantaneous-snapshot-count` is a counter number, starting from 1, only used if there are more than one picture in the `instantaneous-snapshot-name`. 

## Known risks

- Raw private media can become mixed with showable material. Although we currently are not `Obsidian-sync`ing  `Supplementary`, which is good, we have not yet moved all private media into it.
- All information in `Supplementary` needs to be backed-up well enough into a password-protected SSD.
- Timeline notes may become too sparse, or too hard to summarize unless templates are consistent. Imposing consistency after a while is difficult without careful use of AI.
