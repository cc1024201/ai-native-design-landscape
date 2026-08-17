# Forma AI Agent Service

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Forma AI Agent Service is a multi-agent parametric CAD service. A control-flow agent cycles a Designer, a Coder and a headless renderer until the Designer approves the rendered model or returns actionable feedback.

## Specification and render close different loops

The Designer turns intent and references into a technical specification. The Coder translates that specification into build123d Python. `renderer.py` loads and renders the resulting geometry through PyVista without a desktop display, then returns images to the Designer for visual comparison. Feedback re-enters the same controlled session rather than spawning an unrelated regeneration.

The executable build123d source and resolved solid jointly carry engineering authority: code preserves construction intent, while the kernel determines whether it produces geometry. Rendered images are evidence. STEP/STL exports are downstream exchange artifacts and do not by themselves preserve the agent's reasoning or feature construction.

## Orchestration and safety boundary

The control-flow agent owns session state and stage routing. RAG supplies build123d documentation to reduce invalid API usage; search can supply references. Security helpers constrain executable work, but generated CAD code remains an execution boundary that must be reviewed.

## Evidence boundary

The public source establishes the loop and tools, not production-grade tolerance, manufacturability or rollback. Visual approval cannot detect every invalid wall thickness, interference or parametric defect.

- [Pinned Forma AI Service revision](https://github.com/andreyka/forma-ai-service/tree/833082f2516dae70ef636dd27432aa018d5f9ad6)
- [Control-flow agent](https://github.com/andreyka/forma-ai-service/blob/833082f2516dae70ef636dd27432aa018d5f9ad6/sub_agents/control_flow/agent.py)
- [Designer review agent](https://github.com/andreyka/forma-ai-service/blob/833082f2516dae70ef636dd27432aa018d5f9ad6/sub_agents/designer/agent.py)
- [Headless renderer](https://github.com/andreyka/forma-ai-service/blob/833082f2516dae70ef636dd27432aa018d5f9ad6/tools/renderer.py)
