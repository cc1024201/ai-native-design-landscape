# MakeMyWebsite AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

MakeMyWebsite AI is split across a Vite frontend and a same-maintainer Express backend. Together they implement an account-based single-HTML website lifecycle: generate, edit or refine, reopen from a dashboard and publish through a stable slug.

## Two repositories are one product

Pinned frontend revision: `c4b76bf288e1b833274f5deb38e4b304c848ce7d`.

Pinned backend revision: `3b238e7292016ba3a0fb19d728be4018c2f72378`.

The frontend calls the backend website routes and treats `latestCode` as current authority. Mongo stores a conversation next to that code plus deployment state and slug. Refinement sends the entire current HTML back to the model and replaces `latestCode`; conversation is an intent log rather than a restorable source history.

## Public deployment is a database view

Deploying does not create an external hosting build. It assigns a slug and marks the Mongo record deployed; the public route fetches and renders that saved code. Editing afterward can therefore change what the same public URL serves.

## Lineage decision

`vodnalashivani/PROMPT2WEBSITE` arrived later as a single squashed commit and reproduces the same page set, controllers, Mongo fields, credits and slug route with mostly cosmetic edits. It is counted as a duplicate source publication rather than another product team definition.

## Pinned evidence

- [Frontend repository](https://github.com/krishnasharma0101k/makeMyWebsite-Ai)
- [Backend repository](https://github.com/krishnasharma0101k/makeMyWebsite-Ai_backend)
- [Frontend editor](https://github.com/krishnasharma0101k/makeMyWebsite-Ai/blob/c4b76bf288e1b833274f5deb38e4b304c848ce7d/src/pages/editor.jsx)
- [Website controller](https://github.com/krishnasharma0101k/makeMyWebsite-Ai_backend/blob/3b238e7292016ba3a0fb19d728be4018c2f72378/src/controllers/website.controller.js)
- [Website persistence model](https://github.com/krishnasharma0101k/makeMyWebsite-Ai_backend/blob/3b238e7292016ba3a0fb19d728be4018c2f72378/src/models/website.model.js)
- [Later source-family publication](https://github.com/vodnalashivani/PROMPT2WEBSITE)
