---
created: 2026-06-17
type: agent-guide
up:
---

## Purpose

Guide LLM work inside `Worlds`, the audience-facing interface layer.

## Inheritance

This file inherits the root agent guide in `[[AGENTS]]`.
It also follows the directory meaning in `[[Worlds/README]]`.
Local rules below add Worlds-specific behavior.

## Allowed actions

- Read `Worlds/README.md` before acting in `Worlds`.
- Suggest structure, clarity, audience fit, and privacy review steps.
- Improve public-facing material after privacy assumptions are clear.
- Preserve attribution and links to source notes.
- Suggest redaction when material looks too private.
- Prefer creating a manifest note over copying raw files.
- For Google Drive packets, maintain access notes and review status.
- For presentables, prefer editable source plus export note.
- For briefings, preserve audience, context, intent, source notes, and review status.
- Prefer Markdown-first when it cleanly supports equations, images, videos, diagrams, and PPT/PDF export.
- Use hybrid source workflows when Markdown is not enough: PowerPoint, Google Slides, Excalidraw, Mermaid, LaTeX/TikZ, PDFs, images, and manifest notes.
- For child vaults, enforce shareability review.

## Forbidden actions

- Do not make private content more publishable without asking.
- Do not invent audience, claims, dates, credentials, or outcomes.
- Do not remove attribution or source links.
- Do not import raw private memories, media archives, or heavy files.
- Do not treat drafts as safe to publish by default.
- Do not make private material more shareable without review.
- Do not treat ExampleGroup material as team-shareable until explicitly curated.
- Do not create God or alternate-currency packet folders until the first packet exists.

## Local rules

- Treat `Worlds` as audience-facing.
- Ask or infer audience before polishing.
- Check privacy before improving or polishing.
- Keep public claims traceable to source notes.
- Prefer redaction, staging, or review flags when content is sensitive.
- For ExampleGroup, keep the user's curated work first; make it team-shareable only after review.
- Suggest redaction and staging when privacy is unclear.
