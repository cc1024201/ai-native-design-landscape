# Forma Fluens

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Forma Fluens is a browser-only AI UI studio whose durable unit is a self-contained HTML page. Its distinctive design choice is to keep prompt history locally while letting direct code edits bypass regeneration.

## Model contract and failure provenance

[`generate.ts`](https://github.com/atharva-kulkarni-1106/edi/blob/a6139238c7115ade733edfa795088bdcc7859932/src/lib/generate.ts) calls Gemini through a model fallback chain. Every model must return a complete HTML document with both light and dark rules and the chosen primary color. Authentication errors fail immediately; quota or unavailable-model errors move to the next named model. Invalid output is rejected rather than silently dressed as model success.

## One document connects editing and rendering

[`Canvas.tsx`](https://github.com/atharva-kulkarni-1106/edi/blob/a6139238c7115ade733edfa795088bdcc7859932/src/components/Canvas.tsx) keeps the iframe mounted and feeds it the current HTML with `srcDoc`. Code mode edits that same string. Device controls change only the projection width; they do not create separate artifacts. Copy Open and Download all carry the adopted document outward.

## History is snapshots rather than a project graph

[`Dashboard.tsx`](https://github.com/atharva-kulkarni-1106/edi/blob/a6139238c7115ade733edfa795088bdcc7859932/src/pages/Dashboard.tsx) stores the most recent prompt-and-HTML pairs in `localStorage`. Selecting a history item restores that document. There are no named branches relational project objects or server-side versions; the local list is the whole recovery model.

## Evidence

- [Canonical repository](https://github.com/atharva-kulkarni-1106/edi)
- [Inspected tree](https://github.com/atharva-kulkarni-1106/edi/tree/a6139238c7115ade733edfa795088bdcc7859932)
- [Prompt and theme controls](https://github.com/atharva-kulkarni-1106/edi/blob/a6139238c7115ade733edfa795088bdcc7859932/src/components/Sidebar.tsx)
- Commit: `a6139238c7115ade733edfa795088bdcc7859932`

No reliable geographic statement appears on the maintainer profile; region remains `unknown`.
