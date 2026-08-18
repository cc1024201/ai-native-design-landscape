# AI Workflow Builder by Roberts B

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This desktop AI Workflow Builder uses a Qt node graph as the front end to a typed Python workflow engine. It combines manual graph editing, model-generated workflow JSON, file checkpoints and direct execution rather than centering a hosted workspace.

## The desktop canvas serializes ports as well as nodes

[canvas.py](https://github.com/robertsbob/ai_workflow_builder/blob/614a2df03d0130d8b77b5ef10e3d86753294726a/ai_workflow_builder/frontend/node_editor/canvas.py) registers LLM, decision, storage, Python, tool and composite node classes in NodeGraphQt. Its export method reads actual pipes into source node/port and target node/port records, so the runtime contract preserves more than visual adjacency.

## The runner derives parallel stages from the graph

[workflows.py](https://github.com/robertsbob/ai_workflow_builder/blob/614a2df03d0130d8b77b5ef10e3d86753294726a/ai_workflow_builder/backend/workflows.py) validates the shared schema, builds dependencies, rejects cycles and executes each topological level concurrently. Outputs are wired into target ports between levels; LLM nodes use LiteLLM, while composite nodes recursively invoke the same runner on embedded sub-workflows.

## AI can originate the artifact too

The same workflow service can ask a selected model to turn a natural-language description into schema-conforming JSON, repair IDs and load that result into the visual editor. This is delegated creation of the graph, not merely an LLM node placed inside a manually drawn workflow.

## Recovery is local and explicit

[state_manager.py](https://github.com/robertsbob/ai_workflow_builder/blob/614a2df03d0130d8b77b5ef10e3d86753294726a/ai_workflow_builder/backend/state_manager.py) writes timestamped checkpoints and an autosave file that can resume the current workflow after interruption. The FastAPI layer exposes validation, background execution, status and checkpoint operations, while JSON import/export remains the portable delivery format.

## Pinned evidence

- [Repository](https://github.com/robertsbob/ai_workflow_builder)
- [Inspected tree](https://github.com/robertsbob/ai_workflow_builder/tree/614a2df03d0130d8b77b5ef10e3d86753294726a)
- [LLM node runtime](https://github.com/robertsbob/ai_workflow_builder/blob/614a2df03d0130d8b77b5ef10e3d86753294726a/ai_workflow_builder/backend/nodes/llm_node.py)
- [Execution API](https://github.com/robertsbob/ai_workflow_builder/blob/614a2df03d0130d8b77b5ef10e3d86753294726a/ai_workflow_builder/backend/api.py)
