# Kgents

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Kgents wraps Langflow graphs in an Agent-as-a-Service lifecycle: import a visual definition preserve versions publish it deploy a runnable image and converse through the selected flow.

## Langflow owns graph authoring

Kgents does not implement another node editor. Its [Langflow routes](https://github.com/Ugo5738/kgents/blob/da6676ca080577764d43d6be9563013b1ec8c2a8/agent_management_service/src/agent_management_service/routers/langflow_routes.py) import and export Langflow flow JSON. Agent updates can create immutable configuration snapshots and a published agent points at an active version.

## A version becomes a deployment input

The [deployment orchestrator](https://github.com/Ugo5738/kgents/blob/da6676ca080577764d43d6be9563013b1ec8c2a8/agent_deployment_service/src/agent_deployment_service/services/orchestration_service.py) retrieves a version snapshot extracts its Langflow data writes flow.json into a build context and drives container or Cloud Run deployment strategies. The visual artifact therefore crosses an explicit promotion boundary.

## Runtime selection is narrower than generation

The Agent Runtime Service discovers existing Langflow flows and chooses one using name-token matching in [provisioning_routes.py](https://github.com/Ugo5738/kgents/blob/da6676ca080577764d43d6be9563013b1ec8c2a8/agent_runtime_service/src/agent_runtime_service/routers/provisioning_routes.py). It does not synthesize a new graph from the description. Conversation code attempts real Langflow execution but documents a simulated stream fallback.

## Product boundary

Kgents is independent through lifecycle management deployment conversations tools and auth around Langflow. The graph editor remains external and the repository does not contain the optional frontend described by its root documentation.

## Pinned evidence

- [Repository](https://github.com/Ugo5738/kgents)
- [Inspected tree](https://github.com/Ugo5738/kgents/tree/da6676ca080577764d43d6be9563013b1ec8c2a8)
- [Agent version model](https://github.com/Ugo5738/kgents/blob/da6676ca080577764d43d6be9563013b1ec8c2a8/agent_management_service/src/agent_management_service/models/agent_version.py)
