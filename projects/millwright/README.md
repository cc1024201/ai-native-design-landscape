# Millwright

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Millwright is a local AI workbench that operates SolidWorks through roughly fifty native tools. Unlike macro-generation workflows, the agent invokes one structured sketch, feature, assembly, query or export operation at a time, reads the result and chooses the next action.

## SolidWorks owns the model

A persistent Python sidecar keeps a COM connection to SolidWorks. The bridge describes native tools to an Anthropic- or OpenAI-compatible model and returns structured outcomes. The open SolidWorks document and its feature tree remain canonical; chat and screenshots coordinate mutations but do not duplicate the CAD graph.

Cross-version adaptation discovers available COM signatures and falls back to dynamic dispatch when members or parameter counts differ. This is a runtime compatibility mechanism, not a promise that every SolidWorks release and add-in combination behaves identically.

## Visual reasoning and destructive confirmation

The agent can rotate, reorient and screenshot the model, then use the main multimodal model or a dedicated vision model to inspect its work. Destructive tools display their names and parameters in a confirmation card. Before approved destructive execution, the application backs up the document. These gates preserve user authority across a tool-calling loop that can otherwise alter native geometry immediately.

## Persistence boundary

SolidWorks files stay local; text and selected screenshots may reach configured models. Automatic backups protect a pre-operation document but do not constitute full PDM, branching or merge semantics.

- [Pinned Millwright revision](https://github.com/raylanlin/Millwright/tree/a204161b05ec9c80b79e3f6ee77d743d9b667df5)
- [Product, safety and compatibility contract](https://github.com/raylanlin/Millwright/blob/a204161b05ec9c80b79e3f6ee77d743d9b667df5/README.md)
- [Persistent SolidWorks bridge](https://github.com/raylanlin/Millwright/blob/a204161b05ec9c80b79e3f6ee77d743d9b667df5/sidecar/sw_agent/bridge.py)
- [Pre-operation backup implementation](https://github.com/raylanlin/Millwright/blob/a204161b05ec9c80b79e3f6ee77d743d9b667df5/src/main/scripts/backup.ts)
