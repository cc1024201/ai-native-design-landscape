# AI Website Generator by shrik4

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

This builder exposes OpenAI, Gemini, Anthropic and OpenRouter behind one provider interface, then normalizes their answers into a structured website project rather than rendering raw chat text.

## Provider choice precedes artifact assembly

[`ai-providers.ts`](https://github.com/shrik4/AI-Website-Generator/blob/fabf890bb483a4ed08451099936bc50d13396e7d/server/services/ai-providers.ts) implements provider-specific calls. [`website-generator.ts`](https://github.com/shrik4/AI-Website-Generator/blob/fabf890bb483a4ed08451099936bc50d13396e7d/server/services/website-generator.ts) parses and assembles the common website representation defined with the shared schema.

[`website-preview.tsx`](https://github.com/shrik4/AI-Website-Generator/blob/fabf890bb483a4ed08451099936bc50d13396e7d/client/src/components/website-preview.tsx) renders the generated site while the client offers code and download views. The public project has server storage but not a branch-oriented version graph.

## Source anchors

- [Canonical repository](https://github.com/shrik4/AI-Website-Generator)
- [Inspected tree](https://github.com/shrik4/AI-Website-Generator/tree/fabf890bb483a4ed08451099936bc50d13396e7d)
- Commit: `fabf890bb483a4ed08451099936bc50d13396e7d`
