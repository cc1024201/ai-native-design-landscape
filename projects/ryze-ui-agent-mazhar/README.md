# Ryze UI Agent by Mohd Mazhar Khan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Ryze UI Agent compresses its architecture into one API route and one page. Three Gemini calls create a plan, component source and explanation; the page then treats complete source strings as editable versions.

## The route is both orchestrator and gate

[route.ts](https://github.com/Mazhar-48/ryze-ui-agent/blob/fa71a0153b5a10d33550c43557143831764950af/app/api/agent/route.ts) performs planning, generation and explanation in sequence. It checks generated imports against the small local registry before returning the component and therefore prevents the preview from silently depending on arbitrary packages.

## A version is a whole component

[page.tsx](https://github.com/Mazhar-48/ryze-ui-agent/blob/fa71a0153b5a10d33550c43557143831764950af/app/page.tsx) owns current code, explanation and a list of complete source versions. Direct editing and version selection update that state but no persistence layer outlives the page session.

## Runtime is narrower than a full app sandbox

The page uses React Live to evaluate the current component against the explicit registry. This supplies immediate executable evidence for the supported component surface while export and deploy remain outside the product.

## Evidence

- [Canonical repository](https://github.com/Mazhar-48/ryze-ui-agent)
- [Inspected tree](https://github.com/Mazhar-48/ryze-ui-agent/tree/fa71a0153b5a10d33550c43557143831764950af)
- Commit: fa71a0153b5a10d33550c43557143831764950af
