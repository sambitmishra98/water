---
type: protocol
related:
  - "[[Combined working methodology]]"
  - "[[Session ledger]]"
one-liner: First steps after cloning this vault onto a new machine, cluster, or drive
---

## Purpose

This vault is designed to be cloned onto any machine — workstation, laptop,
pendrive, or an HPC cluster login node — and used as the base directory for
LLM working sessions there. This note is the checklist for the first session
on a fresh clone. An LLM asked to "bootstrap" or "set up" a fresh clone
should walk these steps and report what it found.

## 1. Verify the skill symlinks

`.claude/skills/` contains relative symlinks into the durable skill source at
`Atlas/Utilities/AI/skills/`. On Linux and macOS these survive `git clone`
unchanged. Verify:

    ls -lL .claude/skills/*/SKILL.md

If the targets do not resolve (typical on Windows without developer mode),
replace each symlink with a copy of its target directory.

## 2. Know how retrieval works here

The root `.gitignore` ignores everything by default; only the framework's own
governance files are tracked. Two consequences:

- Notes you write on this machine stay untracked. `git add -A` will not sweep
  them up, and `git push` cannot leak them. This is by design.
- Always search with `rg --no-ignore-vcs` so results never depend on ignore
  rules (see the search cascade in `CLAUDE.md`).

## 3. Decide what happens to notes written here

Three workable patterns, in increasing order of effort:

- **Scratch instance**: notes live and die on this machine; carry back
  anything durable by hand (scp, copy-paste into the primary vault).
- **Ledger-first instance**: keep the narrative in the daily notes here, and
  treat `Atlas/Utilities/AI/Session ledger.md` as the thing worth carrying
  back; it is small and append-only.
- **Private instance repo**: keep this template as an upstream remote and add
  your own private origin, then widen `.gitignore` locally to track your
  notes. Framework updates still arrive via `git pull <template-remote>`.

## 4. Set the snapshot destination

Before any session that edits notes, take a snapshot:

    Atlas/Utilities/Terminal-automations/vault-snapshot.sh [dest-root]

Default destination is `$HOME/vault-snapshots/<vault-name>` (override with
the first argument or `$VAULT_SNAPSHOT_DIR`). On clusters, point it at scratch
space rather than a small home quota.

## 5. Anchor the first project

Heavy work never lives inside the vault. Give the project a working directory
outside it (the pattern this template's author uses: `/scratch/EFFORTS/<Project>/`)
and a control note inside it at `Efforts/profession/<Project>.md` (or
`Efforts/<Project>.md`) recording: purpose, code sources, current status,
open loops, decisions, next actions, and a link to the working directory. See
the project control note pattern in
`Atlas/Maps/Second Brain Operating Model.md`.

## 6. Work with session discipline

Use the `/session` skill (or follow its steps by hand): frame one thread,
snapshot before edits, propose before structural changes, and bank
observed → decided → applied lines to the Session ledger at the end. The
morning-descent and evening-reflect skills are there when the machine hosts
whole working days, not just one-off tasks.
