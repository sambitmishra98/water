---
type: protocol
related:
  - "[[Second Brain Operating Model]]"
one-liner: Precedents from real triage sessions, generalized so any model applies demonstrated judgment instead of re-deriving it
---

## Purpose

Precedents from real triage sessions, so any model — especially smaller ones —
applies the user's demonstrated judgment instead of re-deriving it. Each entry
is a *case*: the pattern, the ruling, and why. Add new cases as they are
decided; never generalize a case beyond its why. Names and specifics below are
illustrative placeholders — replace them with your own vault's real cases as
you accumulate them.

Standing meta-rules that govern every case below:

1. **Propose, don't apply.** Every finding gets options and a confirm before
   any file changes — no exception for "obviously stale" cases.
2. **Surface mismatches.** If the user's choice today seems to contradict an
   earlier choice, name the earlier case and ask what distinguishes them. Most
   people experience themselves as consistent; an apparent contradiction more
   often means a distinction is being missed than that the person is being
   inconsistent.
3. **High similarity is a candidate, not a verdict.** Two notes at 0.99 can be
   different things wearing the same template.

## Case 1 — Inbox stub superseded by promoted note

**Pattern:** near-identical note in an inbox layer and in a stable layer (e.g.
`Atlas/People`); the promoted copy is more complete.
**Ruling:** fold any unique fragments (a URL, a line) into the promoted note,
then delete the inbox stub.
**Why:** the inbox is pre-triage staging; once promotion happened, the stub is
a leftover, not a source.

## Case 2 — Template artifact, not duplicate

**Pattern:** several notes cluster at ~1.0 similarity but are near-empty
templates about *different* subjects (e.g. four person-stubs all created from
the same blank frontmatter schema).
**Ruling:** do NOT merge. Fill each with concise real content (matching the
existing frontmatter schema exactly), then move to the proper layer.
**Why:** the similarity is the shared emptiness of the template, not shared
subject. Merging would destroy distinct entities.

## Case 3 — Byte-identical copies across Timeline substreams

**Pattern:** the same meeting note duplicated verbatim across two Timeline
substreams (e.g. a raw meetings folder and a curated project-log folder).
**Ruling:** the raw-trace layer is canonical; delete the verbatim copies
elsewhere. A curated-summary layer earns its place only as *summary* — a
verbatim copy adds nothing.
**Why:** per the layer's own AGENTS.md, curated logs summarize continuity;
Timeline notes remain the primary dated trace. Verify byte-identity (`diff`)
before deleting; if the copies differ at all, escalate to a proposal instead.

## Case 4 — Misfiled by folder, correct by name

**Pattern:** a file whose name says X sitting in a folder that says Y.
**Ruling:** move to the folder matching the filename, after confirming.
**Why:** filename metadata was chosen at capture time and is the stronger
signal; the folder was a filing slip.

## Case 5 — Repeated boilerplate across live creative files

**Pattern:** identical large code/script blocks copied into every chapter of a
book or every index of a project.
**Ruling:** centralize into one shared source (a single view/script the
others invoke), reduce each caller to a one-line invocation — but back up all
originals first (no git safety net for untracked notes), and hand visual
verification to the user.
**Why:** true repetition with a single source of truth available; but live
creative structure warrants backups and human render-verification.

## Case 6 — Old workflow's leftovers vs deliberate redundancy

**Pattern:** repetition that *might* be intentional (per-file scripts kept so
a plugin's Run button works from any file).
**Ruling:** ask before centralizing; state the workflow cost of each option.
Let the user choose between one source of truth and per-file convenience —
the choice is theirs, not a default.
**Why:** some duplication is load-bearing for a workflow; only the user knows.

## Case 7 — Sparse-stub piles in clustering

**Pattern:** embedding clusters dominated by near-empty notes across unrelated
topics, anchoring implausibly high to template-shaped notes.
**Ruling:** treat as a *triage category*, not a topic thread. Batch-process in
short passes: each stub gets a real paragraph, merges into its true thread, or
is named an archive candidate. Never bulk-delete stubs — some are seeds.
**Why:** emptiness clusters with emptiness; the cluster is diagnostic of
missing content, not of relatedness.

## Case 8 — Ghost entries in the embeddings cache

**Pattern:** search/lint/threads return paths that no longer exist after
notes are moved or deleted.
**Ruling:** the indexer should prune cache entries whose files are gone on
every rebuild; if ghost paths appear in any analysis, re-run the index build
once and re-run the analysis.
**Why:** an incremental indexer that only ever adds will accumulate ghosts
indefinitely; pruning has to be an explicit, permanent step in the build.
