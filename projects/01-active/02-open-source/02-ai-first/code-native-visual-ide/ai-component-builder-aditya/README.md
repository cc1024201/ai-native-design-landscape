# AI Component Builder by Aditya Sharma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This product treats a frontend component as durable source with conversation, CSS properties, versions, direct editing, and live projection—not merely as the last model response.

## Current code anchors every AI turn

[`openai.js`](https://github.com/aditya020402/AI-Frontend-Generator/blob/61b8538332dbda77cb2836b98ece63ea261e639b/lib/openai.js) sends current code and recent conversation to Azure OpenAI. [`chat.js`](https://github.com/aditya020402/AI-Frontend-Generator/blob/61b8538332dbda77cb2836b98ece63ea261e639b/routes/chat.js) writes the result back to the component and appends both conversation entries.

## Each conversational rewrite produces a version

The chat route increments `component_versions` before updating `current_code`. [`components.js`](https://github.com/aditya020402/AI-Frontend-Generator/blob/61b8538332dbda77cb2836b98ece63ea261e639b/routes/components.js) reopens and directly updates the same source and CSS property state.

## The frontend closes the loop

[`componentStore.js`](https://github.com/aditya020402/AI-Frontend-Generator/blob/61b8538332dbda77cb2836b98ece63ea261e639b/frontend/src/stores/componentStore.js) synchronizes selected component source with the API. The editor, property panel, and [`LivePreview.jsx`](https://github.com/aditya020402/AI-Frontend-Generator/blob/61b8538332dbda77cb2836b98ece63ea261e639b/frontend/src/components/LivePreview.jsx) all consume that current state.

## Pinned evidence

- [Repository](https://github.com/aditya020402/AI-Frontend-Generator)
- [Inspected tree](https://github.com/aditya020402/AI-Frontend-Generator/tree/61b8538332dbda77cb2836b98ece63ea261e639b)
- Commit: `61b8538332dbda77cb2836b98ece63ea261e639b`
