# AI Website Builder by Safwan Hanif

This builder defines design as a **persisted graph of components** rather than a single generated HTML response. The model first defines the site plan and design tokens, then authors each component separately; the project's canonical state is that component graph, not one blob.

The decisive mechanism is how edits are routed and how history is kept. On a change request the same pipeline asks the model whether the instruction applies to each existing component and replaces **only the changed component code** rather than regenerating everything — the graph is edited at component granularity, not wholesale.

Every mutation then creates a **new snapshot instead of erasing prior state**. `version.py` stores a numbered JSONB snapshot of the complete graph, and `versions.py` lists, creates and restores those snapshots as current components. Persistence is therefore a recoverable version series of whole-graph states, not just a live set of files.

`pipeline.py` selects Groq or Gemini and generates plan, tokens, copy and component source as distinct outputs, while deterministic App and entry files tie the graph together into a runnable project.

Delivery runs through two projections of the same component set: `PreviewFrame.tsx` renders the assembled project, and `export_service.py` writes the identical components into a React ZIP — so the file tree you ship is a faithful export of the graph you designed.

[Evidence: pipeline.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/ai/pipeline.py) · [version.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/models/version.py) · [export_service.py](https://github.com/SafwanHanif/AI-Website-builder/blob/6f42e507e89d344f06de318ee65453269d26c758/backend/app/services/export_service.py) · [inspected tree](https://github.com/SafwanHanif/AI-Website-builder/tree/6f42e507e89d344f06de318ee65453269d26c758)
