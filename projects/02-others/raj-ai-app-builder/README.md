# RAJ AI App Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RAJ AI App Builder is a focused prompt-to-React surface built around Cerebras streaming. It qualifies as a visual authoring loop but does not claim database persistence versioning or product deployment that its source does not show.

## Cerebras streams the component contract

[route.ts](https://github.com/rajshah9305/NLPCEREBRAS/blob/eff0c49c90b74fb180d219db619aea11c67d1f97/src/app/api/generate/route.ts) calls the Cerebras API and streams generated React source under a constrained system prompt. The provider response rather than a local template owns the ordinary generation path.

## Sandpack is the executable evidence surface

[SandpackPreview.tsx](https://github.com/rajshah9305/NLPCEREBRAS/blob/eff0c49c90b74fb180d219db619aea11c67d1f97/src/components/SandpackPreview.tsx) maps current source into a Sandpack runtime. [page.tsx](https://github.com/rajshah9305/NLPCEREBRAS/blob/eff0c49c90b74fb180d219db619aea11c67d1f97/src/app/page.tsx) keeps prompt code and preview together for iterative generation.

## The boundary is intentionally narrow

No inspected schema stores projects or versions and no publication controller advances the artifact beyond the browser workspace. The record therefore represents code-visual component authoring rather than a full managed app lifecycle.

## Evidence

- [Canonical repository](https://github.com/rajshah9305/NLPCEREBRAS)
- [Inspected tree](https://github.com/rajshah9305/NLPCEREBRAS/tree/eff0c49c90b74fb180d219db619aea11c67d1f97)
- Commit: eff0c49c90b74fb180d219db619aea11c67d1f97
