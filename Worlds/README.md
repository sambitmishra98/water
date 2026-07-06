---
created: 2026-06-17
type: readme
up:
---

## Purpose

`Worlds` is the interface layer for connecting with others.

Website material is only one channel.
`Worlds` also covers public internet material, Google Drive shared packets, illustrated briefs, presentable notes, audience-specific briefings, child vaults, and curated output.
The vault should store the interface, manifest, story, access notes, and source links.
Large, raw, or private payloads should live in Google Drive, `Supplementary/in-sync`, or an external archive as appropriate.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

- Public internet material in `Worlds/Online-presence`.
- Conference material, private meeting decks, quick showable notes, slide sources, exports, showable PDFs, and presentation assets in `Worlds/Presentable`.
- Access-controlled Google Drive packet manifests in `Worlds/Shared-drive-packets`.
- Illustrations and diagrams.
- Audience-specific briefings.
- Research-group-facing child vaults in `Worlds/ResearchGroups`.
- Curated personal output that has passed privacy review.
- Showable versions of selected Timeline or project material.
- Curated shareable summaries and presentables, not raw daily logs or unreviewed technical clutter.
- Polished artifacts derived from `Atlas`, `Research`, `Efforts`, or `Timeline`.

## What does not belong here

- Stable knowledge: use [[Atlas/README]].
- Active work: use [[Efforts/README]].
- Raw private memories: use [[Timeline/README]] or [[Supplementary/README]].
- Raw media archives: use [[Supplementary/README]].
- Heavy software or datasets: use [[Supplementary/README]].
- Unstable private drafts unless they are explicitly in `Worlds/Staging`.
- Developing uncertain synthesis: use [[Research/README]].
- Personal self-model and private consolidation: use `Me`.

## Important entry points

- `Worlds/Briefings`
- `Worlds/Illustrations`
- `Worlds/Online-presence`
- `Worlds/Presentable`
- `Worlds/ResearchGroups`
- `Worlds/Shared-drive-packets`
- `Worlds/Staging`

## Interface channels

| Channel | Folder | Audience | Rule |
| ------- | ------ | -------- | ---- |
| Website | `Worlds/Online-presence` | public internet | highest privacy review |
| Presentable | `Worlds/Presentable` | conferences and private meetings | source plus export path |
| Briefing | `Worlds/Briefings` | specific audience | explain context, purpose, and intended use |
| Research group | `Worlds/ResearchGroups` | collaborators or team | child-vault review required |
| Shared packet | `Worlds/Shared-drive-packets` | manually granted access | manifest and link, not raw archive |
| Illustrations | `Worlds/Illustrations` | visual explanation | prefer editable source |
| Staging | `Worlds/Staging` | not yet shareable | review before showing |

## Staging rule

Material that may become shareable but is not yet reviewed belongs in `Worlds/Staging`.

## Shared packet rule

God or alternate-currency work may later belong here as an access-controlled Drive packet or manifest, not in the website layer.
Do not create topic folders before the first packet exists.

A shared packet note should include:

- audience
- purpose
- access method
- Google Drive link or placeholder
- source notes
- included files
- privacy status
- review status

## Relationship to nearby directories

| Directory | Relationship |
| --------- | ------------ |
| `Atlas` | Supplies stable concepts and reusable knowledge for public output. |
| `Efforts` | Produces active work that may later become presentable. |
| `Timeline` | Supplies dated traces only after privacy review and curation. |
| `Research` | Supplies mature synthesis after uncertainty is resolved. |
| `Supplementary` | Stores raw or heavy media linked from curated output when appropriate. |
| `Me` | Holds private self-model material that should not become public by default. |

## Current state

`Worlds` may contain mixed interface channels and mixed levels of polish and privacy review.

Material here should be treated as closer to public than private, but not automatically safe to publish.

Current structure has `Worlds/Presentable` as the main presentation-ready channel, including `Biodata`, `Research`, and `Sandbox`.
`Worlds/ResearchGroups/ExampleGroup` is a future child vault for curated lab-facing work.
`Worlds/Briefings`, `Worlds/Illustrations`, `Worlds/Shared-drive-packets`, and `Worlds/Staging` are governance-ready channels that should grow only when there is actual material.

## Local conventions

- Check privacy before polishing or preparing for publication.
- Preserve attribution and links to source notes.
- Keep raw private memories and raw media out of this layer.
- Use curated copies or links instead of heavy files.
- For presentables, keep editable source and export path together.
- Mark drafts that still need review before sharing.

## Known issues

- Private material can become too polished without consent or review.
- Public narratives can drift away from source notes.
- Showable media can mix with raw private archives.
