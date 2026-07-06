---
type: map
related:
  - "[[AI Start Here]]"
  - "[[README]]"
---

## Purpose

This map explains the vault as a second brain.

It combines Nick Milo-style layer thinking with AI-ready operating levels.

## Core model

The vault uses WATER:

| Layer | Folder | Function |
|---|---|---|
| Worlds | `Worlds/` | Interface with others |
| Atlas | `Atlas/` | Stable knowledge |
| Timeline | `Timeline/` | Time evidence |
| Efforts | `Efforts/` | Active execution |
| Research | `Research/` | Incubation and inquiry |

> [!tip] Working rule
> Folders answer where something lives; links answer what it touches; maps answer how to think through it.

## Five AI-readiness levels

| Level | Name | Vault implementation | Status |
|---|---|---|---|
| 1 | Router | README, AGENTS, AI Start Here | mostly present |
| 2 | LLM-readable wiki | Layer READMEs, maps, control notes | partly present |
| 3 | Semantic retrieval | An embedding-based search tool, a second-brain skill, context packs | partly present |
| 4 | Explicit entity graph | typed notes, frontmatter, people, events, decisions, efforts | emerging |
| 5 | Always-on system | automatic ingestion from email, calendar, messaging, voice, media | postpone |

## The LLM-wiki pattern (Karpathy), governed by McGilchrist

Level 2 above — the LLM-readable wiki — has a named precedent: Karpathy's
llm-wiki gist. Its claim is that rather than RAG rediscovering knowledge on
every query, the LLM maintains "a persistent, compounding artifact." His three
layers map onto WATER almost exactly:

| Karpathy layer | Vault equivalent |
|---|---|
| `raw/` — immutable sources, never modified | `Timeline` (and `Supplementary` raw evidence). The rule "keep the dated fact even after a destination note is made" is his "raw is never modified". |
| `wiki/` — concepts, entities, summaries | `Atlas` — `Atlas/Concepts` = concepts, `Atlas/People` = entities, `## Percolated by LLM` = per-source summaries in place. |
| schema — `CLAUDE.md` / `AGENTS.md` | the WATER governance: README + AGENTS + this map. |

His three workflows also already have homes, with one gap:

| Karpathy workflow | Vault form |
|---|---|
| ingest (one source updates 10–15 pages) | percolation — but confirm-first, not automatic |
| query | a `second-brain` skill + hybrid semantic/keyword search |
| **lint** (contradictions, stale claims, orphans, missing links) | **missing** — the note-health scanner still to build |

So four-fifths of the pattern is already standing. What Karpathy adds is an
*ethic of compounding maintenance* — the tireless LLM keeps the graph current —
and the **lint** workflow the vault lacks.

### The governing clause

Karpathy's pattern is, in this vault's own terms, an Emissary architecture: its
telos is a map that is complete, current, and consistent — the Emissary's
virtues (see [[Left hemisphere of the brain]]). The gist never asks whether the
compiled wiki should be allowed to declare itself the territory. That question
is McGilchrist's (see [[McGilchrist - The Divided Brain]]), and the vault
already answers it where it departs from Karpathy: raw/Timeline stays prior, and
percolation is confirm-first rather than automatic.

So the rule is: adopt his mechanism under the Master's leash.

- The Emissary (the LLM) may compound tirelessly; the raw lived source stays prior.
- Every synthesis is a report returned to the user, not a verdict entered into the record.
- Lint *proposes, never resolves*: a contradiction may be a real tension rightly held; an orphan may belong alone; two near-identical notes may deserve to stay apart because their lived contexts differ. Same scan, different hand (see [[Right hemisphere of the brain]]).

## Current target

Target Level 3 before Level 4.

Do not rush Level 5.

The useful path is:

1. Make the vault reliably readable.
2. Make context packs easy to generate.
3. Make project control notes consistent.
4. Make entities explicit only where payoff is high.
5. Automate only after source boundaries are stable.

## Project control note pattern

Every major active area should have one control note:

- purpose
- current status
- active files
- open loops
- decisions
- people
- next actions
- review trigger

Candidate control notes (illustrative — replace with your own):

- A major recurring deliverable (thesis, dissertation, book, product launch)
- A specific research or engineering thread
- A career or life-administration strategy
- The vault system itself
- Travel and life events
- Household or organizational admin
- A side project or experiment

## Layer diffusion

| From | To | When |
|---|---|---|
| `+/` | Any layer | After triage |
| `Research` | `Efforts` | When inquiry becomes executable work |
| `Research` | `Atlas` | When an idea becomes stable knowledge |
| `Efforts` | `Timeline/Logs` | When daily evidence is needed |
| `Efforts` | `Atlas` | When a durable lesson is extracted |
| `Efforts` | `Worlds` | When output becomes showable |
| `Timeline` | `Atlas` | When repeated life evidence becomes stable self-knowledge |
| `Timeline` | `Worlds` | Only after privacy review |

## Strong rule

Do not create a new top-level folder unless an existing layer fails by definition.
