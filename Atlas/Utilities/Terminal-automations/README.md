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
| `audit_supplementary.sh` | Audits the Supplementary tree without opening every private file. |
| `audit_vault_readme_agents.sh` | Audits README/AGENTS coverage under a selected root. |
| `audit_whole_vault_hubs.sh` | Finds candidate hub directories across the vault. |
| `cleanup_old_dot_dir_metadata.sh` | Deletes old `.dir-metadata.md` files only when run in apply mode. |
| `export_llm_context.sh` | Exports README/AGENTS files into a compact context folder. |
| `setup_furth_lab_obsidian.sh` | Builds a Furth Lab vault `.obsidian` copy from whitelisted settings. |
| `setup_furth_lab_obsidian_safe.sh` | Safer Furth Lab vault `.obsidian` setup with reduced plugin state. |
| `setup_laptop_governance_git.sh` | Initializes or updates a lightweight governance Git layer on laptop. |
| `write_dir_metadata.sh` | Writes generated directory metadata beside README/AGENTS files. |
