# AI Website Builder by Zyra

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Zyra's builder makes each OpenRouter response a complete WebsiteVersion containing HTML, CSS and JavaScript. Conversation provides model context but version rows provide the artifact history.

## Generation appends instead of overwriting

[generate/route.ts](https://github.com/supportzaranp-dev/AI-Website-Builder/blob/2d6b96c39e64705f8221cb9e06bb7ac606f57655/app/api/projects/%5Bid%5D/generate/route.ts) reads prior chat, asks [openrouter.ts](https://github.com/supportzaranp-dev/AI-Website-Builder/blob/2d6b96c39e64705f8221cb9e06bb7ac606f57655/lib/openrouter.ts) for a structured three-layer website and creates a new WebsiteVersion. A follow-up does not destroy the previous source bundle.

## The schema separates dialogue and artifact states

[schema.prisma](https://github.com/supportzaranp-dev/AI-Website-Builder/blob/2d6b96c39e64705f8221cb9e06bb7ac606f57655/prisma/schema.prisma) gives Project separate messages and versions. Version selection is therefore independent from reconstructing code out of prose history.

## Preview and delivery use the selected version

[Workspace.tsx](https://github.com/supportzaranp-dev/AI-Website-Builder/blob/2d6b96c39e64705f8221cb9e06bb7ac606f57655/components/Workspace.tsx) assembles the active version into srcDoc, exposes its three code tabs and downloads the same composed HTML. The source snapshot is durable but delivery is a local file rather than hosted deployment.

## Evidence

- [Canonical repository](https://github.com/supportzaranp-dev/AI-Website-Builder)
- [Inspected tree](https://github.com/supportzaranp-dev/AI-Website-Builder/tree/2d6b96c39e64705f8221cb9e06bb7ac606f57655)
- Commit: 2d6b96c39e64705f8221cb9e06bb7ac606f57655
