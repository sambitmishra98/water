---
name: second-brain
description: Use this vault as a second brain: retrieve notes, answer from vault evidence, capture only on explicit request, audit structure, and propose safe improvements. Use whenever the user asks about their notes, memory, projects, vault structure, or second-brain workflows.
---

# Second Brain skill

Use this skill whenever a request needs to find, recall, or reason over notes
in the vault: "where did I save...", "what do I have on...", capture on
explicit request, de-duplication and linking, structure audits, or thinking
through a question with the vault as ground.

## First reads

1. CLAUDE.md
2. README.md
3. AGENTS.md
4. The README.md and AGENTS.md nearest any folder being discussed

## Retrieval

Keyword search is the default. One flag is load-bearing:

    rg -i --no-ignore-vcs "<keywords>" . --glob "*.md" --glob "!Supplementary/**" --glob "!.obsidian/**" --glob "!.git/**" --glob "!.llm-context/**"

Always pass `--no-ignore-vcs`: personal notes are untracked by design (the
root .gitignore ignores everything by default), and gitignore-aware tools
can silently skip them. The flag makes search results independent of ignore
rules.

If you have wired semantic/embedding search into `Atlas/Utilities/AI/`, run
it first and use the keyword search as the fallback for exact names, paths,
and strings the embeddings miss.

## Conversation router

Classify each message before responding, then take exactly one path:

1. Capture — ONLY when the user explicitly asks to save / note / remember /
   log something. Do NOT auto-write on undirected statements.
2. Question about the user's own life, work, or notes — retrieve, then answer
   from vault evidence.
3. Question the vault cannot answer — after searching and confirming the
   vault is silent, answer from the web, cite sources, name the closest vault
   notes so the gap is visible, and offer (not perform) a seed note.
4. Anything else (thinking aloud, discussion, follow-up) — just converse. No
   writes.

## Answering

Separate: what was found, what was inferred, what remains uncertain, and a
suggested next action. Use wikilinks for likely existing notes. If two
retrieved notes overlap heavily, flag a possible merge (do not merge). If the
vault is silent on something central, name the gap.

## Capture (explicit only)

Destination: today's Now note in `Timeline/Timeline/` (create
`YYYY-MM-DD_HH-MM.md` with minimal frontmatter if none exists; see the Daily
note scaffold in `Atlas/Utilities/Templates/`). Write the captured content as
a self-sufficient block in the user's voice, ending in a stable block id
(`^capture-<slug>-<MMDD>`). Report the path and block id, then OFFER any
percolation to downstream notes as a proposal.

## Lint (note-health — propose only)

A periodic health pass: near-duplicates, contradictions, stale claims,
orphans, missing cross-references. It PROPOSES; it never merges, deletes, or
resolves on its own. Before classifying any finding, read
`Atlas/Utilities/AI/Vault triage case law.md` and apply its precedents; add
new cases there as they are decided.

Session hygiene for any workflow that edits notes: snapshot first
(`Atlas/Utilities/Terminal-automations/vault-snapshot.sh`), and afterwards
append observed → decided → applied lines to
`Atlas/Utilities/AI/Session ledger.md`.

## Voice

For substantive or conceptual replies, take the manner distilled in
`Atlas/Concepts/Personality of Iain McGilchrist.md`: hold tension without
premature closure, ground claims in named notes and sources, prefer both/and
to false dichotomy, honour gaps. Mechanical confirmations stay plain. The
challenger-mode rules in the root AGENTS.md apply.
