# UIX AI Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

UIX AI Agent is a browser workspace for generating and refining a connected set of application screens. Its canonical project is structured JSON whose screen bodies are executable Tailwind HTML; the spatial canvas is a projection for arranging and navigating those screens rather than the sole artifact.

## A project is more than a gallery of screenshots

The [`GeneratedUI` types](https://github.com/seeb4coding/uix-ai-agent/blob/0f56a9e422853eafdfa469880f29a46df8cb12e8/types.ts) define an overview, design system, screens, markup and connections. Screen nodes can therefore share project-level design context and navigation relationships.

[`geminiService.ts`](https://github.com/seeb4coding/uix-ai-agent/blob/0f56a9e422853eafdfa469880f29a46df8cb12e8/services/geminiService.ts) sends the current project and existing screens to Gemini or OpenRouter. It supports whole-project generation, new screens and targeted refinement while asking for parseable Tailwind HTML. The model does not operate on a disconnected image prompt.

## Canvas, preview and refinement converge on the same screen records

[`App.tsx`](https://github.com/seeb4coding/uix-ai-agent/blob/0f56a9e422853eafdfa469880f29a46df8cb12e8/App.tsx) projects screens onto a ReactFlow canvas, renders their HTML and routes screen-specific instructions back through the provider service. A refinement replaces the relevant screen record inside the project; adding a screen extends the same graph.

The project consequently uses a source-authority loop:

`project JSON → connected screen canvas + live HTML → contextual AI refinement → updated project JSON`

## History has two different scopes

Undo and redo use explicit in-memory snapshots during the editing session. Projects themselves persist in browser local storage, and complete history can be imported or exported as JSON. Those are useful recovery mechanisms, but they are not equivalent to durable server-side branches or collaborative revision merging.

## Delivery preserves editable source

Screens can be downloaded together as HTML in a ZIP. This matters for classification: the artifact is not only a rendered mockup. The selected project retains executable markup and cross-screen structure that can be edited or delivered. The pinned source does not demonstrate a production backend or application behavior beyond this generated front-end package.

## Evidence

- [Pinned repository](https://github.com/seeb4coding/uix-ai-agent/tree/0f56a9e422853eafdfa469880f29a46df8cb12e8)
- [Application source](https://github.com/seeb4coding/uix-ai-agent/blob/0f56a9e422853eafdfa469880f29a46df8cb12e8/App.tsx)
