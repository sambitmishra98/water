---
created: 2026-06-17
type: readme
up:
---

## Purpose

This directory stores reusable terminal scripts for auditing and maintaining the vault.

Scripts here should help inspect, summarize, package, and validate the vault without moving or deleting notes by default.

## Inheritance

This README inherits the root vault contract in `[[README]]`.

It carries over `[[README#Global conventions]]` and `[[README#README rules]]`.

The sections below add local rules for this directory.

If a local rule appears to conflict with a parent rule, flag it for human review.

## Rules

- Scripts must identify whether they support Vault User mode or Vault Developer mode.
- Scripts must be dry-run or read-only by default.
- Scripts must write outputs to `.llm-context/`.
- Scripts must not modify vault content unless explicitly designed for that and run after approval.
- Scripts must not delete files unless explicitly designed for cleanup and run with `apply`.
- Scripts must not move notes directly.
- Scripts should generate reports that a human or LLM can inspect.
- Scripts should work on any supplied folder, not only the whole vault.
- Scripts should be safe across Desktop and laptop.

## Scripts

| Script | Purpose |
| ------ | ------- |
| `folder-audit.sh` | Generic audit of any folder. |
| `hub-audit.sh` | Finds candidate README/AGENTS hubs. |
| `sensitive-path-audit.sh` | Flags private or risky paths by name. |
| `symlink-audit.sh` | Reports symlinks. |
| `markdown-style-audit.sh` | Audits Markdown note style. |
| `context-pack.sh` | Creates a compressed context pack for LLM review. |
| `run-standard-audits.sh` | Runs the common audits on a target folder. |
| `agents-inheritance-pack.sh` | Packs the AGENTS.md inheritance chain for a folder into a compact context bundle. |
| `readme-inheritance-pack.sh` | Packs the README.md inheritance chain for a folder into a compact context bundle. |
| `governance-pack.sh` | Bundles the README and AGENTS inheritance packs for a folder into one governance pack. |
| `desktop-attachments-sync-audit.sh` | Audits Desktop, attachments, and sync settings for orphaned or misconfigured files. |
| `supplementary-boundary-audit.sh` | Audits Supplementary's expected `in-sync`/`on-drive` boundary structure. |
