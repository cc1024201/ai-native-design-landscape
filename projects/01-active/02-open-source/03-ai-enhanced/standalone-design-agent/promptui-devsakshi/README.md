# PromptUI by devSakshi022R

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

PromptUI puts generated source under three user-controlled mutation paths: another Gemini prompt, direct Monaco editing and restoration through local prompt history.

[`generate/route.ts`](https://github.com/devSakshi022R/AI-UI-builder/blob/6308aebed915210bd447496c3ea7fcd27c48e041/app/api/generate/route.ts) produces constrained React/Tailwind source. [`generate/page.tsx`](https://github.com/devSakshi022R/AI-UI-builder/blob/6308aebed915210bd447496c3ea7fcd27c48e041/app/dashboard/generate/page.tsx) joins prompting, editable code, preview, scoring, copy and React/HTML export.

[`ui-preview.tsx`](https://github.com/devSakshi022R/AI-UI-builder/blob/6308aebed915210bd447496c3ea7fcd27c48e041/components/preview/ui-preview.tsx) executes the current source representation. [`app.store.ts`](https://github.com/devSakshi022R/AI-UI-builder/blob/6308aebed915210bd447496c3ea7fcd27c48e041/store/app.store.ts) retains client-side generation and prompt history; the inspected tree does not claim a server project database.

## Evidence

- [Canonical repository](https://github.com/devSakshi022R/AI-UI-builder)
- [Inspected tree](https://github.com/devSakshi022R/AI-UI-builder/tree/6308aebed915210bd447496c3ea7fcd27c48e041)
- Commit: `6308aebed915210bd447496c3ea7fcd27c48e041`
