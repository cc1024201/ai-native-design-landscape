# Ryze UI Generator by Rohit Kumar

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Ryze implementation separates model-authored design decisions from deterministic code materialization. OpenRouter creates the plan; local code maps that plan into a constrained component system and explanation.

## AI owns the plan rather than every source token

[planner.ts](https://github.com/rohitrk5972/ryze-ui-generator/blob/60c7e96b591d4d908fc971a686101933d91181a3/lib/agent/planner.ts) calls the OpenAI-compatible endpoint configured to OpenRouter. [generator.ts](https://github.com/rohitrk5972/ryze-ui-generator/blob/60c7e96b591d4d908fc971a686101933d91181a3/lib/agent/generator.ts) deterministically turns the structured plan into component source. The product therefore qualifies because model output governs layout and component decisions even though emission is reproducible.

## Versions live only in the current page

[page.tsx](https://github.com/rohitrk5972/ryze-ui-generator/blob/60c7e96b591d4d908fc971a686101933d91181a3/app/page.tsx) appends complete agent responses to React state and lets a selected version replace current code. It does not write localStorage or a database.

## The projector expands supported UI locally

[LivePreview.tsx](https://github.com/rohitrk5972/ryze-ui-generator/blob/60c7e96b591d4d908fc971a686101933d91181a3/components/ui/LivePreview.tsx) maps the generated surface into an iframe document with local component implementations. That is executable design evidence but not source-equivalent production bundling.

## Evidence

- [Canonical repository](https://github.com/rohitrk5972/ryze-ui-generator)
- [Inspected tree](https://github.com/rohitrk5972/ryze-ui-generator/tree/60c7e96b591d4d908fc971a686101933d91181a3)
- Commit: 60c7e96b591d4d908fc971a686101933d91181a3
