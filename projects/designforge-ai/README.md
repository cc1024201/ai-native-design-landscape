# DesignForge AI

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DesignForge AI is closer to an AI-assisted component system than a blank-prompt site builder. A curated component registry is the starting authority; AI proposes variants; property controls and a local kit determine what the user keeps.

## AI returns a candidate not an automatic mutation

[`app/api/ai-generate/route.ts`](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/app/api/ai-generate/route.ts) sends the current component source plus a natural-language request to Anthropic and expects JSON code plus explanation. When no key is configured it labels the local rule-based result as a mock. [`ai-assistant.tsx`](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/components/playground/ai-assistant.tsx) presents the result separately; it does not silently overwrite the registry component.

## Playground authority is split by purpose

[`app/playground/page.tsx`](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/app/playground/page.tsx) combines the selected registry component with responsive preview and [`props-editor.tsx`](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/components/playground/props-editor.tsx). Prop changes affect the current rendered instance; AI output is source for a proposed variant. This is a candidate-and-promotion workflow rather than one undifferentiated editor state.

## The kit is local governance and delivery

[`useKitStore.ts`](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/store/useKitStore.ts) persists favorites and named collections in the browser. The My Kit page packages selected component source into ZIP. The repository has no shared cloud library or team review graph; local selection is the governance boundary.

## Evidence

- [Canonical repository](https://github.com/CodesByShi/designforge-ai)
- [Inspected tree](https://github.com/CodesByShi/designforge-ai/tree/ca58c9ede9be8c3ba64d0a883aa60837c2111024)
- [AI route with explicit mock provenance](https://github.com/CodesByShi/designforge-ai/blob/ca58c9ede9be8c3ba64d0a883aa60837c2111024/app/api/ai-generate/route.ts)
- Commit: `ca58c9ede9be8c3ba64d0a883aa60837c2111024`

No reliable team location is published on the maintainer profile; region remains `unknown`.
