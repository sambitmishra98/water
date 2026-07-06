---
name: evening-reflect
description: Runs the evening counterpart to morning-descent — audits the day against the morning brief, percolates today's events into Timeline, carries or closes open loops, and releases the day. Use when the user types `/evening-reflect` or asks to close out the day.
---

# Evening Reflect (the returning arc)

The mirror of `/morning-descent`. The morning walks *down* — from life-whole
through plans into today. The evening walks *up* — from today's lived
particulars back into the record, so the day is banked and can be released.
Together they close the loop of `[[The right-left-right approach]]`: what the
morning promised, the evening audits against what actually happened.

Core discipline, borrowed deliberately from grounding progress claims: **audit
each claim against evidence.** The morning brief said certain things would
move; the evening checks the Now notes and the day's actual traces before
declaring anything moved. No aspirational reporting — a day is what it was,
not what it was supposed to be.

## First reads

1. Today's daily note `Timeline/Timeline/YYYY-MM-DD.md` (the morning brief
   lives there under `## Morning descent`; there is no separate briefs
   folder) plus any timestamped Now notes `YYYY-MM-DD_*.md`.
2. `Timeline/AGENTS.md` (percolation and open-loop rules — binding here)
3. `Atlas/Concepts/Personality of Iain McGilchrist.md` (voice for the closing reflection)

## Step 1 — Gather the day's evidence

- Read today's Now note(s) and anything else dated today (`find
  Timeline -name "*.md" -newermt today`, plus what the user mentions).
- Ask the user conversationally what else happened that never got captured —
  evenings catch what mornings can't: the unplanned meeting, the thought on
  the walk. If they narrate events, capture goes to today's Now note under the
  explicit-capture rule (they are explicitly closing the day; a narrated event
  in this ritual is a capture request).

## Step 2 — Audit against the morning brief

If a brief exists for today, walk its claims:

- **What moved as intended** — confirm against actual note traces, not memory.
- **What did not move** — name it plainly, without judgment. Carry it or
  release it, per the user's call.
- **What moved that was never planned** — often the day's real content; give
  it equal standing.

If no brief exists, skip to Step 3 without manufacturing a retrospective plan.

## Step 3 — Percolate and close loops (propose-only)

Per `Timeline/AGENTS.md`, all of this is proposed, confirmed, then applied:

- **Events**: if today's trace describes a bounded event worth its own record,
  propose it for `Timeline/Events` (or a Plans update if it changes a plan's
  status). The dated fact stays in the Now note either way.
- **Percolation candidates**: people facts to `Atlas/People`, durable lessons
  to `Atlas`, active-work updates to `Efforts`, uncertain inquiry to
  `Research` — flagged, not performed, unless confirmed.
- **Open loops**: scan `## Open loops` in notes touched today; propose closing
  only what later evidence actually supports closing; carry the rest forward
  once, per the monthly-review rule.
- Cap the touch-list at **3-5 notes**, same as the morning. The evening is a
  closing ritual, not a second workday.
- Watch for decision mismatches against earlier evenings and mornings; ask
  about the distinction rather than assuming inconsistency.

## Step 4 — Release

Append the closing block to the daily note `Timeline/Timeline/YYYY-MM-DD.md`,
after the last `- - -` divider, in the standard format (scaffold:
`Atlas/Utilities/Templates/Daily note scaffold.md`): a `## Evening reflect`
heading; the user's own closing words (if they
dictate any) stand plain in the body with a `^evening-YYMMDD` block id; ALL
LLM-written content goes inside a `>[!LLM]+ ### LLM` callout, quoted with `>`,
`####` subheadings (What the day was / Carried / Banked / Released), prose not
scorecard. This is the last block of the day, no trailing divider needed. No
em or en dashes, no hard line-wrapping. The daily note thereby reads whole:
aggregator table, morning descent, sessions, evening release.

- **What the day was** — two or three sentences, concrete, in the user's own
  terms. Not a scorecard.
- **Carried** — loops moved to tomorrow, named without anxiety; carrying is a
  decision, not a failure.
- **Banked** — what got percolated or closed, each linked.
- **Released** — explicit permission to stop: the record now holds the day, so
  the person doesn't have to. This is the point of the whole ritual. The
  evening's last word belongs to rest, not to tomorrow's tasks.

## What this skill is not

- Not a productivity audit. If the closing section reads like a performance
  review, it has drifted into the Emissary's register — rewrite it.
- Not a planning session. Tomorrow's shape belongs to tomorrow's descent;
  the evening only banks and releases.
- Not automatic percolation. Every write beyond the brief itself is
  propose-first, per standing rules.
