# AI Component Builder by Devisha Arora

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This implementation treats one generated JSX string as both the inspectable artifact and the input to an isolated visual projection.

[`App.tsx`](https://github.com/dev-isha12/ai-component-builder/blob/058331d150b9125a9b25185b66696d396b964471/ai/src/App.tsx) sends a component brief to Gemini 2.5 Flash, handles provider safety and empty-result states, then builds a React/Babel/Tailwind `srcDoc` for the preview. [`clean.tsx`](https://github.com/dev-isha12/ai-component-builder/blob/058331d150b9125a9b25185b66696d396b964471/ai/src/components/clean.tsx) strips response fences and module syntax before that projection.

The API key and generated code remain browser state. No project, version or gallery persistence is wired at the pinned commit, so the product is counted as a bounded component session rather than a managed builder.

## Evidence

- [Canonical repository](https://github.com/dev-isha12/ai-component-builder)
- [Inspected tree](https://github.com/dev-isha12/ai-component-builder/tree/058331d150b9125a9b25185b66696d396b964471)
- Commit: `058331d150b9125a9b25185b66696d396b964471`
