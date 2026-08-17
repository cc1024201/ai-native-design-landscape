# Shadway

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Shadway is a component workshop rather than a one-shot HTML answer. The generated artifact is a small React/TypeScript/Tailwind file set that executes in Sandpack and can cross a separate promotion boundary into a shared registry.

## Generation writes a runnable file bundle

[`generate-component/route.ts`](https://github.com/moazamdotdev/shadway/blob/25ec64251f3cf0de3b3e4b3bc6e95d0f40592147/app/api/generate-component/route.ts) selects the configured model and streams a structured component response. [`page.tsx`](https://github.com/moazamdotdev/shadway/blob/25ec64251f3cf0de3b3e4b3bc6e95d0f40592147/app/component-generator/page.tsx) coordinates prompts, files, iterations and the generator workspace.

## Execution is isolated from publication

[`sandpack-preview.tsx`](https://github.com/moazamdotdev/shadway/blob/25ec64251f3cf0de3b3e4b3bc6e95d0f40592147/components/sandpack-preview.tsx) runs the current file set with code and visual views. [`chat-persistence.ts`](https://github.com/moazamdotdev/shadway/blob/25ec64251f3cf0de3b3e4b3bc6e95d0f40592147/lib/chat-persistence.ts) gives conversation state a durable path. Registry files are a later governed representation: previewing a candidate does not by itself publish it.

That separation—source bundle, live projection, then registry promotion—is the decisive architecture.

## Source anchors

- [Canonical repository](https://github.com/moazamdotdev/shadway)
- [Inspected tree](https://github.com/moazamdotdev/shadway/tree/25ec64251f3cf0de3b3e4b3bc6e95d0f40592147)
- [Maintainer region evidence](https://github.com/moazamdotdev)
- Commit: `25ec64251f3cf0de3b3e4b3bc6e95d0f40592147`
