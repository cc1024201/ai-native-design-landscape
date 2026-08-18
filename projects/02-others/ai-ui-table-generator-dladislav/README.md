# AI UI Table Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This experiment defines generative UI narrowly: a model creates typed table data with permitted icons and actions, and the application renders that graph through its own components.

## A tool schema is the artifact contract

The [`table` API route](https://github.com/dladislav201/ai-ui-generator/blob/4ad45ae94581fc7eac20522a03820913c54806aa/src/app/api/table/route.ts) forces an OpenAI tool call described by [`tableFunction.ts`](https://github.com/dladislav201/ai-ui-generator/blob/4ad45ae94581fc7eac20522a03820913c54806aa/src/data/tableFunction.ts). Rows, cells, icons and actions arrive as data rather than executable JSX. The renderer accepts only icon names and structures known to the application.

## Prompt history produces selectable visual variants

[`HomeComponent.tsx`](https://github.com/dladislav201/ai-ui-generator/blob/4ad45ae94581fc7eac20522a03820913c54806aa/src/components/sections/HomeComponent/HomeComponent.tsx) appends each generated table to an in-memory history. `TableVariantList` lets the user revisit those results while one index determines the visible table. This is variant comparison at session scope; there is no persisted promotion record.

## Deliberately small boundary

The implementation supports tables only. It does not export source, persist projects or offer direct cell manipulation. Its value to the landscape is the explicit native graph boundary rather than breadth.

## Pinned evidence

- [Canonical repository](https://github.com/dladislav201/ai-ui-generator)
- [Inspected tree](https://github.com/dladislav201/ai-ui-generator/tree/4ad45ae94581fc7eac20522a03820913c54806aa)
- Commit: `4ad45ae94581fc7eac20522a03820913c54806aa`
