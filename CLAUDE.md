# Claude Vault Router

Use this file when Claude is launched from this repository's root.

## First reads

Read these before making structural claims or editing files:

1. README.md
2. AGENTS.md
3. The README.md and AGENTS.md nearest the folder you are about to touch

On a fresh clone or a new machine, also read
Atlas/Utilities/AI/Fresh clone bootstrap.md and walk its checklist.

## Vault root

This repository's root directory (wherever it has been cloned; no fixed path is assumed).

## Operating model

This repository uses WATER:

- Worlds = Worlds/ = presentable, shareable, public-facing output
- Atlas = Atlas/ = stable knowledge, people anchors, concepts, tools, templates
- Timeline = Timeline/ = dated evidence, events, logs, meetings, plans, memories
- Efforts = Efforts/ = active projects, execution, blockers, next actions
- Research = Research/ = uncertain inquiry, literature exploration, speculative synthesis

Other conventions:

- +/ = inbox and raw capture, triaged into the five layers above
- Supplementary/ = heavy files, raw evidence, datasets, media, private archives (never scanned casually, see Safety)
- .llm-context/ = generated reports and temporary LLM context, safe to regenerate or delete
- Atlas/Utilities/AI/ = durable AI-collaboration material: reusable skills (skills/, symlinked from .claude/skills/), triage precedents (Vault triage case law.md), the working-methodology living doc, the append-only Session ledger.md, and Fresh clone bootstrap.md. Add your own retrieval tooling here as you build it.

## Mode gate

Classify requests as:

- Vault User: use the repository to answer, remember, synthesize, or write. Search first. Do not restructure.
- Vault Developer: improve structure, scripts, templates, or governance. Audit first. Dry-run before edits.
- Hybrid: use the repository and improve it. Separate answer phase from structure phase.

Ask a short clarification only if the mode changes the action.

## Search cascade

Retrieval reflex: before using Grep, Glob, or reading files to hunt for
which notes are relevant, search first. Blind grep/read across the whole
tree burns tokens and misses conceptually related notes.

Default order (works anywhere, including cluster login nodes with no extra
tooling installed):

1. Keyword search:
   rg -i --no-ignore-vcs "<keywords>" . --glob "*.md" --glob "!Supplementary/**" --glob "!.git/**" --glob "!.llm-context/**"

   Always pass --no-ignore-vcs. Personal notes are untracked by design
   (the root .gitignore ignores everything by default), and gitignore-aware
   tools can silently skip them; the flag makes search results independent
   of ignore rules across rg versions and future .gitignore edits.

2. Governance check:
   read the nearest README.md and AGENTS.md for any folder being discussed.

Optional upgrade: if you set up your own embedding/semantic-search tooling
under Atlas/Utilities/AI/, wire it in as the first step and keep the keyword
search above as the fallback for exact names and strings the embeddings miss.

## Safety

- Do not move, delete, rename, or overwrite notes without explicit approval.
- Do not scan Supplementary casually.
- Do not treat .llm-context, .obsidian, plugin folders, vendor folders, or software folders as governance.
- Preserve frontmatter and Obsidian links.
- Prefer reports and proposed changes over mutation.
- If making edits, show changed files and summarize exactly what changed.
- Before any session that will edit or delete notes, take a snapshot:
  Atlas/Utilities/Terminal-automations/vault-snapshot.sh
  (hard-linked rsync snapshots; personal note content is gitignored by design
  and has no other undo).
- After applying changes in a working session, append what was observed →
  decided → applied to Atlas/Utilities/AI/Session ledger.md (append-only).
- Before classifying lint/triage findings, read
  Atlas/Utilities/AI/Vault triage case law.md and follow its precedents.

## Adapting this template

- Atlas/Profession/ExampleProject/, Efforts/profession/ExampleProject/,
  Research/profession/ExampleProject/, Worlds/Presentable/Research/ExampleProject/,
  and Worlds/ResearchGroups/ExampleGroup/ show one worked example of a project
  threading through every layer. Rename or delete it once you understand the
  pattern; it is not load-bearing structure.
- The Templater templates under Atlas/Utilities/Templates/ are optional
  Obsidian conveniences, not required by the WATER model itself.
- The scripts under Atlas/Utilities/Terminal-automations/ are read-only audits
  (folder structure, governance coverage, symlinks, sensitive paths). None of
  them require anything beyond bash/coreutils, so they run unmodified on a
  cluster login node.
