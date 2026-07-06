---
created: 2026-06-16T12:10:00  
type: readme
up:  
---

## Purpose

`Supplementary` is the heavy archive layer of the vault.
It stores raw evidence, media, datasets, binaries, software dumps, exports, recordings, documents, and large files. 
This is predominantly a non-markdown file.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## What belongs here

`Supplementary/on-drive` should contain the raw data
- Media files like Images, videos
- Installations. 
- Chat exports.
- Raw photos and videos.
- Audio recordings and meeting recordings.
- Research datasets, meshes, simulation outputs, postprocessed data, and large generated files.
- Software installers, external tools, binaries, archives, and reproducible material.
- Outdated documents, scans, certificates, travel files, tax files, and administrative evidence.

`Supplementary/in-sync` should contain smaller files that can be conveniently obtained from anywhere, media seen by anyone.
- latest documents, scans, certificates, travel files, tax files, and administrative evidence.
 
## What does not belong here

- Meaningful markdown files that one expects to be in other directories.
- The description of material in `Supplementary` can be placed in `Atlas`, see [[Atlas/README]].
- Active project large files should not enter a vault in any form. Any `Efforts` should be done locally and only a finished product of some form should be placed in Supplementary with its deocumentation in `Atlas`
- Research papers are small in size. Developing research synthesis: use [[Research/README]].
- Dated summaries and timelines: use [[Timeline/README]].
- Public-facing narratives and show-able collections: use [[Worlds/README]].
- Small reusable templates and vault conventions: use `Atlas/Utilities/Templates`.

## Main structure

|Directory|Role|
|---|---|
|`Supplementary/in-sync`|Minimal synced bridge for small portable files and note-bound attachments.|
|`Supplementary/on-drive`|Primary unsynced archive for heavy, private, raw, or archival files.|
|`Supplementary/on-drive/media/inbox`|Default Desktop intake for raw media/source imports from phones, cloud drives, old disks, and laptop cleanup payloads.|
|`Supplementary/on-drive/media/inbox/phone`|Phone-specific intake under the broader media inbox.|

## Intake and demotion rule

- New small files from laptop may first land in `Supplementary/in-sync`.
- `Supplementary/in-sync` is temporary intake and a small synced bridge.
- Raw source imports from phones, Google Drive, OneDrive, old hard drives, old phones, camera cards, and laptop cleanup should land under `Supplementary/on-drive/media/inbox` when working on Desktop.
- Phone-originated media/data imports should land directly in `Supplementary/on-drive/media/inbox/phone`.
- Phone-originated media/data includes photos, videos, screenshots, audio recordings, downloaded media, chat media, and other raw phone export payloads.
- When a phone is connected and the user asks to move, copy, import, or archive phone files without naming a destination, use `Supplementary/on-drive/media/inbox/phone`.
- Preserve source filenames and metadata when practical.
- Copy and verify before deleting anything from the source; deletion requires explicit human approval and a logged deletion set.
- Heavy, private, raw, or archival files should later be reviewed on Desktop.
- On Desktop, move long-term heavy, private, or raw material into `Supplementary/on-drive` or an external unsynced archive.
- Do not force-create `Supplementary/on-drive` on laptop.

## Raw source import rule

Large source imports should preserve evidence before interpretation.

Preferred import shape:

`Supplementary/on-drive/media/inbox/<source-kind>/imports/YYYY-MM-DD_HH-mm-ss__source-name/raw/...`

Each import should keep an import README, source manifest when practical,
destination manifest, transfer/export logs, error summaries, and recovery
sidecars for source filenames that cannot be represented on the destination
filesystem.

Use this model for current and future imports from phones, Google Drive,
OneDrive, old HDDs, old phones, camera cards, and laptop cleanup payloads.

Cleanup is a separate workflow. Before deleting source material, require at
least same-relative-path and same-size evidence in the raw import, skip
mismatches and unreadable paths, and log the deletion manifest and execution
results in `.llm-context/`.

## Relationship to nearby directories

|Directory|Relationship|
|---|---|
|`Timeline`|Stores dated summaries and links to raw time evidence in `Supplementary/on-drive/Calendar`.|
|`Research`|Stores research thinking and synthesis; Supplementary stores heavy research evidence.|
|`Efforts`|Stores active work; Supplementary stores large artifacts produced by that work.|
|`Atlas`|Stores stable knowledge distilled from raw material.|
|`Worlds`|Stores curated showable material copied from safer subsets.|

## Calendar archive rule

Long-term raw life media may later be organized under:

`Supplementary/on-drive/Calendar`

Phone-originated raw media should first enter:

`Supplementary/on-drive/media/inbox/phone`

Review and demote from the phone inbox into `Supplementary/on-drive/Calendar` or another archive path after import verification.

`Timeline` may contain a small synced subset copied from this archive.

`Worlds/Presentable/Timeline` may contain an even smaller showable subset.

The intended flow is:

`Supplementary/on-drive/Calendar` -> `Timeline` -> `Worlds/Presentable/Timeline` -> `Worlds/Online-presence/Calendar`

Each step must reduce privacy risk.

## Attachment rule

New note-bound attachments start in `Supplementary/in-sync/Attachments`.

Heavy, private, raw, or archival files move manually to `Supplementary/on-drive`.

## Professional archive rule

Heavy professional material belongs under:

`Supplementary/on-drive/profession`

This includes meshes, PyFR simulations, postprocessed files, software, recordings, conference material, and raw research evidence.

Research notes should link to this material.

Do not copy large professional artifacts into `Research`, `Atlas`, or `Efforts`.

## ExampleGroup data rule

- Laptop intake may land in `Supplementary/in-sync` first.
- Phone-originated media/data imports on Desktop land in `Supplementary/on-drive/media/inbox/phone` by default.
- Heavy ExampleGroup material should not remain on laptop.
- On Desktop, demote heavy ExampleGroup data into `Supplementary/on-drive` if available, or an external unsynced archive.
- The ExampleGroup child vault should store manifests and links to heavy material, not the heavy payload itself.

## ExampleProject archive rule

- Omar's received ExampleProject/ExampleProject archives and raw simulation outputs belong in Desktop `Supplementary/on-drive` or an external archive.
- Keep only manifests and links in `Research`, `Efforts`, `Atlas`, `Timeline`, and `Worlds`.
- Suggested archive roots are listed in [[Efforts/profession/ExampleProject/Supplementary-manifest]].

## Software archive rule

- Avoid storing unpacked software installs, vendor folders, virtual environments, and large software trees inside the vault.
- Prefer reproducible scripts, install notes, source URLs, versions, checksums, and environment manifests.
- Keep scripts or notes in the vault, not full software installations.
- Zip or archive full software trees only as a last-resort preservation method.
- When on Desktop, review existing software folders in `Supplementary/on-drive` for conversion into reproducible setup notes.

## Privacy rule

Private material belongs in `Supplementary/on-drive`.

Private material should not be embedded into synced notes.

Synced notes may link to private material only when the note is clearly private.

Showable notes must use curated copies, not raw private folders.

Chats involving other people must remain private by default.

## Backup rule

`Supplementary` is not safe unless it has independent backups.

Before deleting online originals, require:

- one primary local copy
    
- one second local copy
    
- one encrypted offsite copy
    
- checksum manifest
    
- tested restore
    
- clear private/showable separation
    
- waiting period after import
    

## Symlink rule

This directory contains many symlinks.

Before backup, migration, or deletion, scripts must report symlinks explicitly.

Never assume symlinked files are physically stored inside `Supplementary`.

Never delete symlink targets through a cleanup script without manual review.

## Local conventions

- Carry over parent conventions from [[README]].
    
- Use README files only at meaningful archive hubs.
    
- Do not put README files inside every data directory.
    
- Prefer manifests over prose for large archives.
    
- Prefer dry-run scripts.
    
- Scripts may audit, count, checksum, and suggest.
    
- Scripts must not move, rename, overwrite, or delete by default.
    

## Naming conventions

Use stable, deterministic names.

For time-based raw media:

`YYYY-MM-DD_HH-mm-ss overarching-event-name instantaneous-snapshot-name instantaneous-snapshot-count`

Use `HH-mm-ss` only when reliable.

For folder-level time archives:

`YYYY/YYYY-MM/YYYY-MM-DD__event-slug`

For uncertain dates:

`unknown-date/event-slug`

Do not invent dates.

## Current state

`Supplementary` is functional but not fully organized.

Most data is under `Supplementary/on-drive`.

The largest archive is professional PyFR and Pointwise data.

A raw Calendar archive already exists under `Supplementary/on-drive/Calendar`.

Some areas are legacy dumps and should not grow by accident.

## Known risks

- Unsynced data can be lost without backup.
    
- Private and showable media can mix.
    
- Symlinks can confuse backup and deletion.
    
- Large research artifacts can duplicate silently.
    
- Software folders can make audits noisy.
    
- Online originals should not be deleted before verification.
- Source APIs and mounts can expose partial views. Preserve logs and caveats
  rather than treating a best-effort snapshot as perfect completeness.
