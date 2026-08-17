# AI Component Builder by Sanskriti Singh

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder separates ephemeral generation from explicit curation: JSX is generated and rendered immediately, but it becomes a retained variant only when the user saves it.

## Generated JSX is the projection input

[`App.tsx`](https://github.com/sanskritisingh245/ai-component-builder/blob/faeea443aa3f57f2d687f204bafcb085a4593145/src/App.tsx) calls OpenAI from the browser, removes wrappers and module syntax and keeps the resulting JSX string as current session state. [`preview-panel.tsx`](https://github.com/sanskritisingh245/ai-component-builder/blob/faeea443aa3f57f2d687f204bafcb085a4593145/src/preview-panel.tsx) embeds that expression in a React/Babel/Tailwind document. The script-only iframe is visual evidence of the code but not its persistence layer.

## Save promotes a variant

[`firebase.ts`](https://github.com/sanskritisingh245/ai-component-builder/blob/faeea443aa3f57f2d687f204bafcb085a4593145/src/firebase.ts) stores prompt, source, title and creation time only after the explicit save action. [`gallery.tsx`](https://github.com/sanskritisingh245/ai-component-builder/blob/faeea443aa3f57f2d687f204bafcb085a4593145/src/gallery.tsx) independently reprojects each retained source and makes it copyable. The gallery is therefore a promotion boundary rather than an automatic log of every generation.

## Evidence

- [Canonical repository](https://github.com/sanskritisingh245/ai-component-builder)
- [Inspected tree](https://github.com/sanskritisingh245/ai-component-builder/tree/faeea443aa3f57f2d687f204bafcb085a4593145)
- [Live product](https://ai-component-builder.vercel.app)
- Commit: `faeea443aa3f57f2d687f204bafcb085a4593145`
