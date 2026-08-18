# AI Website Builder by Bonifacio Calindoro

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This FastAPI product uses one complete HTML document as both preview and publication authority. Its unusual persistence choice is a file-locked pickle store containing per-user sessions and their chat-shaped version trail.

## Model replies replace complete HTML

[main.py](https://github.com/BonifacioCalindoro/ai-website-builder/blob/76ab9de078c4a236dd0f055d8166f7ae70d73ce9/main.py) sends the description and current document to an OpenAI-compatible model and expects a complete HTML response. The accepted result becomes current website state.

## History is serialized application state

The same file appends prompt, timestamp and HTML to a session record and writes the store under a file lock. Restore selects a historical document and makes it current. This survives process restart on one host but lacks database-level concurrency or migration semantics.

## Preview and publication share the document

[index.html](https://github.com/BonifacioCalindoro/ai-website-builder/blob/76ab9de078c4a236dd0f055d8166f7ae70d73ce9/templates/index.html) refreshes the iframe from current HTML and exposes restoration controls. Publish creates a share route backed by the same session artifact rather than a separate deployment build.

## Evidence

- [Canonical repository](https://github.com/BonifacioCalindoro/ai-website-builder)
- [Inspected tree](https://github.com/BonifacioCalindoro/ai-website-builder/tree/76ab9de078c4a236dd0f055d8166f7ae70d73ce9)
- Commit: 76ab9de078c4a236dd0f055d8166f7ae70d73ce9
