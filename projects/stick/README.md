# Stick

> Research status: **Source-level** · Last reviewed: **2026-08-12**

Stick is a small but complete Google Stitch-style implementation: one prompt becomes a planned multi-screen application, and the screens remain arranged on a project canvas with later prompt-based additions. It is not counted because it resembles a famous product; it is counted because its own source establishes a recoverable user loop.

## Generation is a persisted state machine

The new-project route first creates a database project with `ANALYZING` status. The background function streams a short plan into `agentMessage`, asks for a structured sitemap, generates pages and advances status to `COMPLETED`. The client polls this record and renders pages as movable frames on an infinite canvas.

```text
brief
  -> Project(ANALYZING)
  -> streamed plan
  -> structured sitemap
  -> generated Page rows
  -> Project(COMPLETED)
  -> movable canvas frames
```

Adding a screen is a smaller continuation path. It reads an existing page as a style anchor, creates another page and leaves the prior pages intact. This makes multi-screen consistency a data dependency rather than a visual promise.

## Artifact and recovery model

At pinned commit [`35bec8d`](https://github.com/Atiqullah-Naemi/stick/commit/35bec8de5debce21bfa4afb1358882e368fbcbaf):

- [`schema.prisma`](https://github.com/Atiqullah-Naemi/stick/blob/35bec8de5debce21bfa4afb1358882e368fbcbaf/prisma/schema.prisma) defines the durable project/page relationship.
- [`inngest/functions.ts`](https://github.com/Atiqullah-Naemi/stick/blob/35bec8de5debce21bfa4afb1358882e368fbcbaf/inngest/functions.ts) implements the multi-stage background generation.
- [`design-canvas.tsx`](https://github.com/Atiqullah-Naemi/stick/blob/35bec8de5debce21bfa4afb1358882e368fbcbaf/components/design-canvas.tsx) supplies pan/zoom and movable screen frames.
- project and page API routes under [`app/api/projects`](https://github.com/Atiqullah-Naemi/stick/tree/35bec8de5debce21bfa4afb1358882e368fbcbaf/app/api/projects) recover the stored state.

Generation history is therefore not just chat text: project/page rows survive a refresh and can be resumed from the project route.

## Evidence limits

The project accompanies a public build tutorial, but the repository and deployed site have a distinct name and working contract; it is not one of the repeated Ryze assignment submissions. No license file was present at the pinned revision, so public source visibility does not imply reuse permission. The maintainer profile places the creator in Melbourne and supports the Australia region label.

## Decisive sources

- [Repository README](https://github.com/Atiqullah-Naemi/stick/blob/35bec8de5debce21bfa4afb1358882e368fbcbaf/README.md)
- [Live surface](https://stick-coral.vercel.app)
- [Maintainer profile](https://github.com/Atiqullah-Naemi)
