# AI Website Builder by V

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Website Builder by V is a portable agent skill plus a concrete Vite/Tailwind site scaffold. It does not supply its own model runtime; Claude Code Codex Gemini CLI Cursor or Copilot becomes the mutation engine while normal project files and a browser preview remain authoritative.

## The product is a bounded workflow rather than a prompt list

[`SKILL.md`](https://github.com/builtbyV/ai-website-builder/blob/4bf3931a9651a5d0ba6ff60851bd402f24aec762/skill/SKILL.md) defines which files the agent may edit how it must inventory media how design direction changes typography palette radius and spacing and how every task returns to a preview. The bundled [`index.html`](https://github.com/builtbyV/ai-website-builder/blob/4bf3931a9651a5d0ba6ff60851bd402f24aec762/index.html) is a real editable delivery artifact with navigation sections responsive behavior metadata and explicit placeholders.

## Files own the design; the browser is evidence

The agent mutates HTML and public assets under fixed guardrails. Vite and Tailwind deterministically project those files at a local preview address. There is no separate canvas graph or opaque provider workspace. Git supplies reversal and handoff while visual inspection supplies acceptance evidence.

## Publication is gated and multi-provider

The [`publishing workflow`](https://github.com/builtbyV/ai-website-builder/blob/4bf3931a9651a5d0ba6ff60851bd402f24aec762/skill/references/publishing.md) blocks release when placeholders metadata images or links are unresolved and then routes the same project to GitHub Pages Cloudflare Netlify or Vercel. This delivery path is part of the workflow rather than a static starter-template claim.

## Boundary

Because an external agent supplies intelligence this record describes a reusable Design workflow and artifact contract—not a distinct foundation model or integrated visual editor.

## Pinned evidence

- [Repository](https://github.com/builtbyV/ai-website-builder)
- [Inspected tree](https://github.com/builtbyV/ai-website-builder/tree/4bf3931a9651a5d0ba6ff60851bd402f24aec762)
- [Maintainer organization](https://github.com/builtbyV)
- Commit: `4bf3931a9651a5d0ba6ff60851bd402f24aec762`
