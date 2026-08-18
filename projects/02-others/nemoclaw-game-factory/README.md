# NemoClaw Game Factory

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

NemoClaw Game Factory turns a prompt into one self-contained HTML app or game, but its important mechanism is the promotion loop around that file: builder, reviewer, deployed preview and explicit human finalization.

## Revision preserves the deployed artifact

[`server.py`](https://github.com/nv-drollins/nemoclaw-gamfacotry/blob/a40d8a98a962082d47d5cb8961f93b53b885cd93/server.py) supports local Ollama and OpenAI-compatible NemoClaw routes. Refinement prompts include the currently deployed HTML and instruct the builder to return it unchanged if a valid repair cannot be produced. A reviewer evaluates layout, controls, mobile behavior and deployability before the deployer writes the preview.

## Approval is not another generation call

[`app.js`](https://github.com/nv-drollins/nemoclaw-gamfacotry/blob/a40d8a98a962082d47d5cb8961f93b53b885cd93/static/app.js) presents agent state, live preview, refinement and final approval. Marking the current app final promotes existing source rather than silently starting a new prompt.

## Evidence

- [Canonical repository](https://github.com/nv-drollins/nemoclaw-gamfacotry)
- [Inspected tree](https://github.com/nv-drollins/nemoclaw-gamfacotry/tree/a40d8a98a962082d47d5cb8961f93b53b885cd93)
- Commit: `a40d8a98a962082d47d5cb8961f93b53b885cd93`
