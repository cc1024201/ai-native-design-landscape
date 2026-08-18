# Reactor by admineral

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Reactor is a small Vercel AI SDK generative-UI derivative focused on one concrete Design loop: ask for a React component receive it through a tool call edit the source in Sandpack and inspect the live result beside it. It is counted as an independently surfaced open-source project while its upstream demo ancestry remains explicit.

## A tool call is the only generation handoff

[`systemMessage.ts`](https://github.com/admineral/Reactor/blob/1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d/app/ai/systemMessage.ts) instructs the model to route every generated component through `show_sandpack_editor` rather than print code into chat. [`functions.tsx`](https://github.com/admineral/Reactor/blob/1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d/app/ai/functions.tsx) validates that function input and resolves the streamed UI with a Sandpack editor.

[`OpenAIService.tsx`](https://github.com/admineral/Reactor/blob/1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d/app/services/OpenAIService.tsx) joins chat state streaming completion and function handling. This is a narrow runtime intent relay whose accepted payload is React source.

## Sandpack is both editor and projection

[`SandpackEditor.js`](https://github.com/admineral/Reactor/blob/1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d/components/SandPack_Components/SandpackEditor.js) installs generated code as `/App.js` alongside a fixed React entry point dependencies and Tailwind configuration. Sandpack exposes editable code and a live preview in one surface so direct correction returns to the same source authority.

No project save version graph or release path is present in the inspected source. The authority lasts for the current application state and should not be described as durable persistence.

## Upstream and evidence boundary

The copied README identifies the Vercel AI SDK 3.0 generative UI demo and the [official Vercel generative UI article](https://vercel.com/blog/ai-sdk-3-generative-ui). Reactor's independent boundary is the focused React authoring surface rather than ownership of the underlying SDK pattern.

- [Canonical repository](https://github.com/admineral/Reactor)
- [Inspected tree](https://github.com/admineral/Reactor/tree/1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d)
- Commit: `1aa24bbc0393cd3a7cc56fed5b37f29f2befc83d`

The maintainer profile states Austria so team region is recorded as Austria.
