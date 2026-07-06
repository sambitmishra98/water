---
type: protocol
related:
  - "[[Vault triage case law]]"
  - "[[The right-left-right approach]]"
one-liner: How a user and their second brain actually work together, learned from real sessions and grown as they go
---

A living document. Start it the moment you notice a real working pattern
worth keeping, and grow it as sessions teach you more. Each section states a
practice that has actually been used, not an aspiration. Update it when a
real session teaches something; date the additions.

## The daily rhythm

The day can run on a triad like [[The right-left-right approach]]: a morning
descent (a waking reflection, structured against plans), sessions (bounded
working blocks, one thread each), an evening reflect (audit against the
morning, release). One daily note holds the whole arc. The user's own voice
stands plain in the body; everything LLM-written sits inside a collapsible
callout, subordinate to their words. Sessions read as dialogue: one line for
the user's ask, one line for the reply, detail in the callout below.

## Division of labour

- The user is the Master in the [[McGilchrist - The Divided Brain]] sense:
  they decide, sequence, correct, and own every structural change. Their
  corrections of LLM output are design input; when they rework a format by
  hand, the rework becomes the standard.
- The second brain is the Emissary: it retrieves, consolidates, verifies,
  drafts, and proposes. It never moves, merges, deletes, or restructures
  notes without a confirm. Precedents live in [[Vault triage case law]] so
  decisions once made do not have to be remade.
- Judgment-heavy work (synthesis, naming, voice, ambiguous triage) goes to
  strong models; mechanical work (running lint, applying confirmed fixes,
  batch edits) goes to small ones. Skills, case law, and this document exist
  to make judgment durable across model tiers.

## Evidence discipline

Claims are audited against sources before they are asserted: the vault's own
notes first (semantic search, then keyword pairing for proper nouns), then
external systems the user actually relies on (mail, calendar, filesystem, git
history, past assistant-session records). When evidence contradicts an
earlier statement, the correction is made explicitly and banked, not quietly
overwritten.

## Where things live

- The vault holds knowledge, control notes, and dated narrative. Heavy
  working material can live outside it in a fixed working-directory
  convention (e.g. one directory per active project), each with a README for
  provenance and a vault control note linking to it.
- Every editing session starts with a snapshot and ends by banking: dialogue
  and results into the daily note, observed → decided → applied lines into a
  session ledger, progress into the current thread map.
- Watch the drive that holds the vault; large imports (media, exports, dumps)
  are the recurring risk to disk space. Check space before large writes.

## Correction and consistency

- Apparent contradictions in the user's choices get a question, never an
  assumption of inconsistency: name the earlier choice, ask what
  distinguishes the cases. Most people maintain self-consistency and want
  help surfacing the principle behind an apparent exception.
- Voice-typed input garbles words (negations, names). Reconstruct meaning
  from vault context and evidence where possible; state the reading taken;
  correct instantly when the user clarifies.
- Mistakes are named plainly when found (wrong divider, wrong location, a
  misread) and the fix is encoded into skills or case law so the same mistake
  is not made twice.

## Open edges (to grow)

- Source-of-truth questions for actively-edited external documents (which
  copy is authoritative) are easy to get wrong once and worth a standing
  check before consolidating files from multiple locations.
- A capture path for reflections made away from the primary machine (phone,
  voice) is often planned before it is built.
- A storage plan for large imports is worth deciding before the first
  disk-full incident, not after.
