# AI Frontend Generator by Marcelo Lima

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This 2025 generator uses three model roles to turn an objective into a runnable filesystem project: an orchestrator decomposes work, a sub-agent produces code, and a refiner consolidates the final file set.

## Completion is negotiated between agents

[`agent.py`](https://github.com/marcelorl/ai-frontend-generator/blob/bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181/app/agent.py) defines orchestrator, sub-agent, and refinement calls. [`maestro.py`](https://github.com/marcelorl/ai-frontend-generator/blob/bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181/app/maestro.py) repeats until the orchestrator declares the task complete, then extracts a folder graph and named code blocks.

## Files become the authority

[`files.py`](https://github.com/marcelorl/ai-frontend-generator/blob/bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181/app/files.py) creates the project beneath `results/`. [`app.py`](https://github.com/marcelorl/ai-frontend-generator/blob/bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181/app/app.py) points a Streamlit iframe at the Nginx-served result. No later persistence or recovery system is present, and the last pinned activity is 2025, so it is historical.

## Pinned evidence

- [Repository](https://github.com/marcelorl/ai-frontend-generator)
- [Inspected tree](https://github.com/marcelorl/ai-frontend-generator/tree/bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181)
- Commit: `bf01f04a3925ff71fd1cc84ad4c16b3a3a9c7181`
