# Yellow Machine

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Yellow Machine separates transient generation from retained component history. The current Gemini result is not durable until the user presses Save.

## Generation and isolation

[`Slide1.tsx`](https://github.com/Codevesh090/YellowMachine-Ai-Component-Builder/blob/87394fc633db43ccd3021a04c508d97ffb0fc1c5/src/components/Slide1.tsx) sends the prompt to Gemini and requests raw single-root JSX. [`PreviewComponent.tsx`](https://github.com/Codevesh090/YellowMachine-Ai-Component-Builder/blob/87394fc633db43ccd3021a04c508d97ffb0fc1c5/src/components/PreviewComponent.tsx) constructs a sandboxed iframe document and deliberately excludes same-origin access.

## Promotion to gallery

[`firebase.ts`](https://github.com/Codevesh090/YellowMachine-Ai-Component-Builder/blob/87394fc633db43ccd3021a04c508d97ffb0fc1c5/src/firebase.ts) creates, lists and deletes saved component records. Gallery cards render their own preview, so selection creates a recoverable candidate collection rather than just chat history.

## Pinned evidence

- [Canonical repository](https://github.com/Codevesh090/YellowMachine-Ai-Component-Builder)
- [Inspected tree](https://github.com/Codevesh090/YellowMachine-Ai-Component-Builder/tree/87394fc633db43ccd3021a04c508d97ffb0fc1c5)
- Commit: `87394fc633db43ccd3021a04c508d97ffb0fc1c5`
