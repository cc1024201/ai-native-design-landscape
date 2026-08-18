# LUMA AI Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

LUMA exposes a file-manipulating LangGraph agent rather than asking a model for one opaque project blob. SQL-backed project state and tool-mediated edits make the agent interface the central implementation fact.

## Gemini reasons through explicit workspace tools

[agent.py](https://github.com/kreeshal17/LUMA-AI-STUDIO/blob/7435a9b04ad816092fa40512dfde6a65a3fbc0cd/backend/agent.py) builds a LangGraph ReAct loop around Gemini. [tools.py](https://github.com/kreeshal17/LUMA-AI-STUDIO/blob/7435a9b04ad816092fa40512dfde6a65a3fbc0cd/backend/tools.py) exposes bounded read write edit and list operations so the model mutates a named project graph.

## SQL retains the project outside the model context

[db.py](https://github.com/kreeshal17/LUMA-AI-STUDIO/blob/7435a9b04ad816092fa40512dfde6a65a3fbc0cd/backend/db.py) defines durable users projects files and related state. Model context can be reconstructed from this authority rather than serving as the only copy.

## Preview export and GitHub consume stored files

[main.py](https://github.com/kreeshal17/LUMA-AI-STUDIO/blob/7435a9b04ad816092fa40512dfde6a65a3fbc0cd/backend/main.py) exposes generation file and export operations while [github.py](https://github.com/kreeshal17/LUMA-AI-STUDIO/blob/7435a9b04ad816092fa40512dfde6a65a3fbc0cd/backend/github.py) publishes the project through GitHub. The frontend uses Sandpack for runtime proof. No complete version graph was established in the inspected schema.

## Evidence

- [Canonical repository](https://github.com/kreeshal17/LUMA-AI-STUDIO)
- [Inspected tree](https://github.com/kreeshal17/LUMA-AI-STUDIO/tree/7435a9b04ad816092fa40512dfde6a65a3fbc0cd)
- Commit: 7435a9b04ad816092fa40512dfde6a65a3fbc0cd
