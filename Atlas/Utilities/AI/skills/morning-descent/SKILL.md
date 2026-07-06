---
name: morning-descent
description: Runs the right-left-right daily descent — structures a waking reflection against the plan ladder and Efforts, touches a small number of real notes, and returns a daily brief. Use when the user types `/morning-descent` or asks to plan their day this way.
---

# Morning Descent (right-left-right)

Operationalizes `[[The right-left-right approach]]` (`Efforts/Ongoing/The
right-left-right approach.md`, itself under `[[The Master and His Emissary]]`)
as a daily practice. Three movements; only the middle one is this skill's job.

## The three movements — and the boundary between them

1. **Right (apprehend the whole)** — waking, half-earthed, the user takes in
   life so far, years, months, days, right now, all at once, before any of it
   is named. **This skill does not run during this movement and must never
   try to.** It happens in the user, not in a tool. If a reflection has not
   been captured yet, ask for it conversationally — do not prompt with a
   structured form; let it come in the user's own voice, unforced.
2. **Left (structure)** — this skill's actual work: take the captured
   reflection and walk it up the vault's existing plan ladder, touching only
   what the reflection itself surfaced.
3. **Right, returned** — hand back a felt brief, not a task list: life
   direction, this month, what moved today. A report returned to the person,
   not a verdict.

## First reads

1. `CLAUDE.md`, root `README.md`, root `AGENTS.md`
2. `Efforts/Ongoing/The right-left-right approach.md`
3. The top note of the plan ladder under `Timeline/Plans/`, if one exists (see `Timeline/Plans/README.md`)
4. `Atlas/Concepts/Personality of Iain McGilchrist.md` (voice for the returned brief)

## Step 1 — Get the waking reflection

- If today's Now note (`Timeline/Timeline/YYYY-MM-DD_HH-MM.md`) already has a
  raw capture from this morning, read it.
- Otherwise, ask the user directly: what came up as they surfaced today —
  life so far, the next few years, months, days, right now. Do not lead with
  categories; let them talk, then locate what they said against the ladder
  yourself.
- This reflection is the only input. Do not substitute a generic template for
  it.

## Step 2 — Structure (walk the ladder)

Retrieve, in order:

1. The plan ladder under `Timeline/Plans/` (top note and its children), if
   one exists.
2. Relevant `Efforts` control notes (the project-control-note pattern in
   `[[Second Brain Operating Model]]`) that resonate with what was said.
3. Retrieval per the `second-brain` skill for anything else the reflection
   touches, including candidates from any loose `+/` inbox threads in play.

Cap the touch-list at **3-5 notes**. This is a morning-sized pass, not a lint
sweep — the whole point is that the notes which matter get fixed because they
came up in a real morning, not because a scan flagged them.

For each touched note, propose a specific small edit or link (per
`[[Second Brain Operating Model]]`'s propose-only rule) and get a confirm
before writing — no exceptions, including when the fix looks obvious.

**Extending the ladder:** if the reflection surfaces a month/week/day-scale
commitment that has no plan note yet, propose creating one, matching whatever
parent-child pattern the existing ladder uses. Confirm before creating. The
ladder fills in from what real mornings surface — do not backfill it
speculatively.

**Watch for mismatch:** if a choice the user makes here contradicts how a
similar choice went on an earlier morning, name the earlier one and ask what
distinguishes them, rather than assuming inconsistency (per standing
feedback — the user experiences himself as consistent, and an apparent
contradiction is a signal something is being missed, not noise).

## Step 3 — Return the brief

The brief lives inside the DAILY note `Timeline/Timeline/YYYY-MM-DD.md` (date
only, no time suffix). Follow the format exactly (scaffold:
`Atlas/Utilities/Templates/Daily note scaffold.md`):

- Frontmatter: only `created: YYYY-MM-DDTHH:mm` and `one-liner`. No
  created-date, no device, no subjective fields.
- Top of note: the dataviewjs aggregator block that tables the day's
  timestamped capture notes (location/time/phy/men/emo/one-liner/body/link).
  When creating a fresh daily note, copy this block from the scaffold
  template (or the most recent existing daily note).
- Then the phase block:

```
## Morning descent
<user's raw reflection, plain in the body, one paragraph per line> ^reflection-YYMMDD

>[!LLM]+ ### LLM
> #### Direction
> ...
> #### This season
> ...
> #### Where the work actually stands
> ...
> #### Held open
> ...

- - -
```

The user's voice stands plain in the body; ALL LLM-written content goes inside
the `>[!LLM]+ ### LLM` callout, quoted with `>`, subheadings at `####`. The
block ends with a `- - -` divider so the next phase (session, evening-reflect)
appends after it. Block ids use YYMMDD: `^reflection-260706`.

Content of the four sections, in the voice distilled in
[[Personality of Iain McGilchrist]], measured, concrete before abstract, no
bullet-listed todos:

- Direction: one or two sentences locating today in the larger arc, in the
  user's own terms. Do NOT link the life-goal or other ladder notes by
  default; link only when the reflection itself demonstrates the connection.
- This season: what the month/week actually holds (deadlines, meetings).
- Where the work actually stands: the 3-5 notes this pass actually touched or
  located, each linked, with the concrete state found there.
- Held open: what surfaced but stays deliberately unresolved; name it as held,
  not as failure. The user works from this list during the day.

Formatting rules (standing preference): no em or en dashes anywhere (use
commas, colons, parentheses); no hard line-wrapping, each paragraph is one
line.

## What this skill is not

- Not a substitute for the waking apprehension itself.
- Not a vault-wide lint pass — see the `second-brain` skill's Lint workflow
  for that, run separately and at the user's initiative.
- Not a todo generator. If the returned brief reads like a checklist, it has
  drifted into the Emissary's register and should be rewritten.
