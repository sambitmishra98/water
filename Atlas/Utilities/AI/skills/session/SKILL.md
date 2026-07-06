---
name: session
description: A bounded working block between morning-descent and evening-reflect — orient against today's brief and the thread map, work one thread with full vault discipline, bank the results to the ledger. Use when the user types `/session` or says they want to start working / start a session.
---

# Session (the day's working block)

The middle of the daily triad: `/morning-descent` opens the day, `/session`
does the day's work (can run more than once), `/evening-reflect` closes it.
The descent decides *from above* what matters; a session executes *one thread
of it* with craft; the reflect banks what actually happened.

## Step 0 — The nudge (always first)

Check that today's descent actually ran. It lives in the daily note under a
`## Morning descent` heading (user's format, 2026-07-06):

    grep -l "## Morning descent" Timeline/Timeline/$(date +%Y-%m-%d).md

- **Missing or empty** → nudge, don't proceed silently:
  "No daily brief for today — the morning descent hasn't run. Run it now
  (even a two-minute version), or explicitly skip it for today?"
  Offer both; respect the answer. A deliberately skipped morning is the
  user's call; a *forgotten* one is exactly what this nudge exists to catch.
- **Present** → read it. It is the session's orientation: direction, season,
  what the morning said would move.

Also read, briefly:
- `Efforts/Ongoing/Inbox thread map 2026-07.md` (or current month's map) — thread states
- The tail of `Atlas/Utilities/AI/Session ledger.md` — what recent sessions did,
  so this one continues rather than repeats

## Step 1 — Frame the block

Ask (or take from the user's opening words): which thread, and what would
"done for this sitting" look like? Default to the brief's stated focus, or the
thread map's confirmed next thread. One thread per session; a session that
tries to touch everything banks nothing.

If the session will edit or delete notes, snapshot first:

    Atlas/Utilities/Terminal-automations/vault-snapshot.sh

## Step 2 — Work

Normal second-brain discipline throughout (see the `second-brain` skill):

- retrieval reflex before hunting (semantic first, keyword pairing for names)
- propose → confirm → apply for every structural change; case law
  (`Atlas/Utilities/AI/Vault triage case law.md`) decides the defaults
- watch for decision mismatches against earlier sessions; ask, don't assume
- capture only on explicit ask; percolation stays confirm-first
- McGilchrist manner for substantive replies; plain speech for mechanics

Keep the block bounded: when the framed "done" is reached — or when the user
starts drifting to a second thread — say so and offer to close rather than
sprawling onward.

## Step 3 — Bank

Before ending:

1. Append to the session block in the daily note `Timeline/Timeline/YYYY-MM-DD.md`,
   in the user's dialogue format (reference: 2026-07-06 note): a `### Session`
   heading (h3) after the last `- - -` divider, holding a running dialogue:
   `- Me: <the user's ask, in their words>` then `- C: <one or two plain
   sentences answering it>`. Detail beyond those sentences goes in a
   `>[!LLM]+ ### LLM` callout below the dialogue, quoted with `>`, `####`
   subheadings; tables allowed for dated facts like deadlines. The user may
   pre-create the `### Session` heading and `- Me:` line themselves and leave
   `- C:` empty; in that case fill in the `- C:` line, do not restructure. A
   session section stays open for further exchanges; do not add a trailing
   divider after it until the day moves on. No em or en dashes, no hard
   line-wrapping.
2. Append to `Atlas/Utilities/AI/Session ledger.md`:
   `## [YYYY-MM-DD] session: <thread> | <model>` with observed → decided →
   applied lines (one per decision). The Now note holds the day's narrative;
   the ledger holds the technical record.
3. Update the thread map's Progress table for the thread touched.
4. One closing line to the user: what's banked, what's left open on this
   thread — so `/evening-reflect` finds an honest trail.

## What this skill is not

- Not the descent (it doesn't plan the day) and not the reflect (it doesn't
  close the day) — it will nudge toward whichever of those is missing.
- Not a multi-thread marathon. One thread, banked, beats three threads
  half-touched.
