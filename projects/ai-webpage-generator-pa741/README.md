# AI Webpage Generator by Pablo de Groot

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This project differs from one-shot HTML generators: the public website URL is a generative surface backed by reusable per-user web components, preferences and feedback-driven mutation.

## Components are the durable design unit

[`component-manager.ts`](https://github.com/pa741/ai-webpage-generator/blob/40e4937606d90708926672e31cf286e661192704/functions/src/component-manager.ts) manages generated component definitions rather than treating each response as disposable page text. The server composes those components into requested routes and Firestore keeps user-specific overrides.

## Feedback can change either artifact or preference

The function layer in [`index.ts`](https://github.com/pa741/ai-webpage-generator/blob/40e4937606d90708926672e31cf286e661192704/functions/src/index.ts) exposes streamed generation and model tools. Its evaluator routes free-form feedback toward a concrete component mutation or a persistent user preference. This is a consequential distinction: local page repair and future-generation governance are separate state changes.

## Runtime is also the evaluation surface

The repository's benchmark drives the live URL with Playwright, saves page HTML and screenshots, then scores appearance and functional completeness. That confirms the generated component graph is projected as a working page and checked as such; it does not make the screenshot authoritative.

## Pinned evidence

- [Canonical repository](https://github.com/pa741/ai-webpage-generator)
- [Model-provider boundary](https://github.com/pa741/ai-webpage-generator/blob/40e4937606d90708926672e31cf286e661192704/functions/src/ai-model-provider.ts)
- [Inspected tree](https://github.com/pa741/ai-webpage-generator/tree/40e4937606d90708926672e31cf286e661192704)
- Commit: `40e4937606d90708926672e31cf286e661192704`
