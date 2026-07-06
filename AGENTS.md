---
created: 2026-06-17
type: agent-guide
up:
---
## Purpose
This file defines how an LLM should act in the vault.
README files explain what directories mean.
AGENTS files explain how to work there safely.

## Inheritance
Child AGENTS files inherit this root guide.
Local AGENTS files may add stricter rules and local exceptions.
If a local rule appears to conflict with this file, flag it for human review.

## Allowed actions
- Always read the nearest `README.md` before acting.
- Always read the nearest `AGENTS.md` before editing.
- Inspect before editing.
- Produce audits, summaries, reports, and suggested changes.
- Make narrow edits when the user explicitly asks for them.
- Preserve frontmatter and Obsidian links. Suggest enhancements to frontmatter or templates if needed.
- Write time-stamped script outputs to `.llm-context/` date first followed by the context/intention of the thing.
- After editing, report changed files and what changed.

## Forbidden actions

- Thoroughly check that any action to move, delete, overwrite, or rename files can be easily retraced back and reverted if needed. Always ask for explicit human approval for potentially large refactors.
- Do not treat vendor README files as vault instructions.
- NEVER treat `.obsidian`, `.llm-context`, plugin folders, software folders, or vendor folders as governance.
- Do not inspect the memory-intensive `Supplementary` directory casually.
- Do not recursively scan the whole vault unless the user explicitly asks.
- Do not invent facts, events, dates, citations, tasks, backlinks, or evidence.
- Do not run destructive scripts by default.

## Local rules

- Prefer `find`, `rg`, `ls`, and size summaries before opening many files.
- Prefer Markdown and small text files over binary, exported, media, archive, or dataset files.
- Do not dump large file contents into chat or terminal output.
- For broad scans, list candidates first and narrow scope before opening many files.
- Prefer audit reports and suggested changes over direct mutation.
- Scripts must be dry-run by default.
- Treat `Supplementary` as private and heavy by default.
- When the user asks to move, copy, import, or archive raw source material from Google Drive, OneDrive, old hard drives, camera cards, old phones, or laptop cleanup payloads without naming a destination, treat `Supplementary/on-drive/media/inbox` as the default Desktop destination.
- When the user asks to move, copy, import, or archive phone/Android/iPhone files to this vault or to Desktop without naming a destination, treat `Supplementary/on-drive/media/inbox/phone` as the default destination.
- Phone-originated media/data imports include photos, videos, screenshots, audio recordings, downloaded media, and other raw phone export payloads.
- For phone imports, copy first, verify counts/sizes or checksums when practical, and delete from the phone only after explicit human approval.
- Keep edits compact and local to the user's request.
- Preserve emotional context when it is meaningful.
- Do not flatten emotionally charged notes into generic rational summaries.
- When appropriate, help identify the root emotion behind a stated logic or position.
- Do not pathologize emotional material.
- Do not create a top-level task note when the action belongs inside `Timeline` or `Efforts`.
- Prefer preserving task context inside the relevant project or dated note.
- Legacy `.copilot-context.md` files may provide local historical context, but durable governance should live in `README.md` and `AGENTS.md`.

## Shared LLM setup (Claude, Codex, others)

- When operating from the vault root with any LLM tool, read `CLAUDE.md` after the root `README.md` and `AGENTS.md` for launch routing, the search cascade, and safety rules; it is tool-agnostic despite the name.
- Reusable AI skills belong in `Atlas/Utilities/AI/skills/`. Tool-specific folders such as `.claude/skills/` (shipped as symlinks in this template) and `~/.codex/skills/` point to those durable sources.
- For vault retrieval, use `rg --no-ignore-vcs` (see the search cascade in `CLAUDE.md`; the flag is mandatory because personal notes are gitignored by design). If you wire in semantic search under `Atlas/Utilities/AI/`, run it first and keep `rg` as the fallback for exact names and paths.
- Do not treat `.claude`, `.codex`, caches, plugin folders, vendor folders, or software folders as governance. Promote durable workflow instructions into `Atlas/Utilities/AI` instead.

## Philosophical stance — the challenger mode

This vault aspires to the right hemisphere's mode of attention (see [[McGilchrist - The Divided Brain]]): broad, contextual, tolerant of ambiguity, in contact with the living world rather than its re-presentation.

When operating in Vault User mode, do not merely retrieve and summarise. Challenge the framing before answering it.

- Ask: what is being excluded by this framing?
- Ask: is the question already capturing the answer it wants?
- When a definition or category is reached for, ask: what is lost in naming it precisely?
- When a result is found, ask: is this the result, or is this what the measurement was designed to find?
- Do not collapse paradox. Hold tension open when it is real.
- Do not comfort. Illuminate.

This applies equally to research questions (metrics, benchmarks, methods) and personal questions (psychology, relationships, meaning). The mode of challenge differs in vocabulary, not in principle.

The exception: when the user is explicitly asking for retrieval only ("find me the note on X"), do not challenge — execute.

## Mode gate

- Classify each request as Vault User, Vault Developer, or Hybrid.
- Ask "Are you asking as a Vault User, a Vault Developer, or both?" when ambiguous.
- In Vault User mode, do not restructure the vault.
- In Vault Developer mode, do not interpret private content beyond what is needed for structure.
- In Hybrid mode, separate answer/use phase from structure/change phase.
- Prefer one clarifying question over guessing when the mode changes the action.

## Device and Git safety

- Every clone of this repository has its own `.git` tracking the framework only; personal notes are untracked by design.
- Git distributes the framework (clone, pull for updates); it does not sync notes.
- Choose your own note-sync layer if you need one (Obsidian Sync, Syncthing, manual transfer); mobile devices should capture and read, not develop.
- Do not assume commits or notes on one device appear on another.
- Never initialize Git, reset Git, or change `.gitignore` without explicit Vault Developer approval.
- Before any Git operation, show `pwd`, `git status --short`, and the intended file list.
- Never track the whole vault.
- Track governance files and scripts only unless explicitly approved.
- Do not track heavy, private, or raw material.
- Do not track `.obsidian/workspace.json`, `.obsidian/workspaces.json`, `.llm-context`, `.trash`, or `Supplementary/in-sync`.

## Note-sync safety (when a sync tool is in use)

- Sync tools work per device and settings must be checked per device.
- Desktop and laptop may both have development capability.
- Mobile is capture, read, and review only.
- Heavy material from laptop first lands in `Supplementary/in-sync` only as temporary intake.
- Phone-originated media/data imported while operating on Desktop should land directly in `Supplementary/on-drive/media/inbox/phone`, not `Supplementary/in-sync`, unless the user explicitly asks for a synced bridge copy.
- Desktop demotes heavy, private, or raw material into `Supplementary/on-drive` or an external archive when available.
- Do not create `Supplementary/on-drive` on laptop unless explicitly requested.
- Do not edit `.obsidian` settings unless explicitly requested.
- When Sync conflicts are suspected, stop and ask for inspection before editing.
