---
created: 2026-06-17
type: agent-guide
up:
---

## Purpose

Guide LLM work inside `Supplementary`, the heavy, private, raw, and archival layer.

## Inheritance

This file inherits the root agent guide in `[[AGENTS]]`.
It also follows the directory meaning in `[[Supplementary/README]]`.
Local rules below add Supplementary-specific behavior.

## Allowed actions

- Read `Supplementary/README.md` before acting in `Supplementary`.
- Produce size, path, symlink, checksum, and manifest audits.
- Suggest safer organization without moving files.
- Distinguish `Supplementary/in-sync` from `Supplementary/on-drive`.
- Use `Supplementary/on-drive/media/inbox` as the default Desktop destination for raw source imports from phones, Google Drive, OneDrive, old hard drives, old phones, camera cards, and laptop cleanup payloads when no narrower destination is named.
- Use `Supplementary/on-drive/media/inbox/phone` as the default Desktop destination when the user asks to move, copy, import, or archive phone/Android/iPhone files without naming a destination.
- For ExampleGroup or research-group payloads, suggest manifests and Drive or archive links.

## Forbidden actions

- Do not inspect heavy or private files casually.
- Do not delete files.
- Do not move, rename, overwrite, or deduplicate files without approval.
- Do not follow or delete symlink targets without explicit review.
- Do not treat vendor, software, or copied-repository README files as vault governance.
- Do not pull huge data into a child vault.

## Local rules

- Treat `Supplementary/on-drive` as private, heavy, and unsynced by default.
- Treat `Supplementary/in-sync` as the small synced bridge.
- Treat `Supplementary/in-sync` as intake, not permanent storage for heavy, private, or raw files.
- Treat `Supplementary/on-drive/media/inbox` as the raw intake hub for source snapshots before curation.
- Treat `Supplementary/on-drive/media/inbox/phone` as the default raw intake for phone-originated media/data on Desktop.
- Phone-originated media/data includes photos, videos, screenshots, audio recordings, downloaded media, and other raw phone export payloads.
- For phone imports, preserve source filenames and metadata when practical.
- For phone imports, copy first and verify counts/sizes or checksums when practical before proposing deletion.
- Do not delete anything from the phone unless the user explicitly approves deletion after verification.
- For any source cleanup, create a deletion manifest before deleting and an execution log after deleting. Record exact source paths, archive evidence, delete result, and post-delete source existence.
- Verify deletion candidates by same relative path and same byte size at minimum; prefer checksums for small high-value sets and whenever practical.
- Skip source files that are missing from the archive, size-mismatched, unreadable, newly-created after import, or part of app/account state unless the user explicitly approves a narrower exception.
- Preserve unrepresentable source filenames with sidecar recovery artifacts, such as tar archives plus sanitized copies, before source deletion.
- If a device, cloud API, or MTP mount begins returning repeated failures, stop, inspect the failure pattern, and resume with narrower scope.
- Prefer listing filenames, sizes, dates, checksums, and manifests before reading file contents.
- Ask before opening more than five Supplementary files in one pass unless the user explicitly requested a broader inspection.
- Prefer Markdown, plain text, and small CSV files when content inspection is needed.
- Avoid commands that dump PDFs, images, videos, audio, archives, notebooks, datasets, or large exports.
- On laptop, do not create `Supplementary/on-drive` unless explicitly requested.
- On Desktop, remind the user to demote heavy, private, or raw files from `in-sync` to `on-drive` or an external archive.
- On laptop, remind the user that heavy ExampleGroup files should be temporary intake only.
- For software folders, suggest scripts, manifests, URLs, and checksums before preserving full unpacked trees.
- Audit before any proposed move or cleanup.
- Report symlinks explicitly before backup, migration, or deletion work.

## Safe commands

- `find Supplementary -maxdepth 2 -type f`
- `du -h -d 1 Supplementary`
- `ls -lh Supplementary`
