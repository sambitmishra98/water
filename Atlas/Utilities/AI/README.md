---
type: readme
up:
---

## Purpose

This directory holds reusable AI-collaboration material: skill definitions,
standing precedents (case law), and the living record of how a user and their
assistant actually work together, as distinct from Terminal-automations
(scripts) or Templates (note scaffolding).

Included by default in this template:

- `skills/` — the durable source for the `second-brain` retrieval skill and
  three chained daily-practice skills (`morning-descent`, `session`,
  `evening-reflect`). `.claude/skills/` at the vault root symlinks here;
  other tools' skill folders can do the same.
- `Session ledger.md` — the append-only observed → decided → applied record
  every working session banks to.
- `Fresh clone bootstrap.md` — the checklist for the first session on a new
  machine, cluster, or drive.
- `Vault triage case law.md` — a worked example of writing down triage
  precedents so a lint or dedup pass reproduces past judgment instead of
  re-deriving it each time. The cases are illustrative placeholders; replace
  them with your own as you accumulate real ones.
- `Combined working methodology.md` — a worked example of a living document
  that grows as real sessions teach a working pattern worth keeping.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

If a local rule appears to conflict with a parent rule, flag it for human review.
