# PromptOnent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PromptOnent streams component source into an isolated renderer and treats completed generations as selectable browser-local versions.

## Streaming has a completion boundary

[`generate/route.ts`](https://github.com/Abrar090909/promptonent/blob/aad1c7e4301d33f4ded803bedc234ce1a7ce38b5/app/api/generate/route.ts) forwards Gemini chunks. [`useGeminiStream.ts`](https://github.com/Abrar090909/promptonent/blob/aad1c7e4301d33f4ded803bedc234ce1a7ce38b5/hooks/useGeminiStream.ts) accumulates them, supports cancellation and saves history only after a completed response.

## Sandbox and history solve different problems

[`PreviewFrame.tsx`](https://github.com/Abrar090909/promptonent/blob/aad1c7e4301d33f4ded803bedc234ce1a7ce38b5/components/canvas/PreviewFrame.tsx) builds a script-enabled iframe without same-origin authority. [`canvasStore.ts`](https://github.com/Abrar090909/promptonent/blob/aad1c7e4301d33f4ded803bedc234ce1a7ce38b5/store/canvasStore.ts) persists prompt/code entries and selection in localStorage. Isolation protects execution; history supports recovery.

## Pinned source

- [Canonical repository](https://github.com/Abrar090909/promptonent)
- [Inspected commit](https://github.com/Abrar090909/promptonent/commit/aad1c7e4301d33f4ded803bedc234ce1a7ce38b5)
- [Maintainer region evidence](https://github.com/Abrar090909)
- Commit: `aad1c7e4301d33f4ded803bedc234ce1a7ce38b5`
