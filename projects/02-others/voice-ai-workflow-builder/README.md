# Voice AI Workflow Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Voice AI Workflow Builder is a React Flow prototype for sketching a voice-agent system and testing that specification with OpenAI Realtime. The saved graph is real; the test path describes the graph to a model rather than executing its edges.

## Draft and published graphs are separate files

[`App.jsx`](https://github.com/QuantAI3113/AI-Workflow-Builder/blob/3a8b32c1898853cd1b91b7fec19c5271f9a3a7f0/UI/src/App.jsx) edits typed workflow nodes and connections. The backend in [`main.py`](https://github.com/QuantAI3113/AI-Workflow-Builder/blob/3a8b32c1898853cd1b91b7fec19c5271f9a3a7f0/Backend/main.py) serializes complete graph JSON under draft and published directories. Text-to-workflow generation can create the same graph shape from a prompt.

Publication is therefore a state transition over an artifact even though it does not provision a remote service.

## Realtime test embeds the specification as instructions

The backend opens a Realtime session and includes the graph JSON in session instructions. There is no interpreter that follows connection order dispatches each node or enforces branches. The model is asked to behave according to a textualized design. This is a prompt-grounded simulation of the workflow rather than graph-native runtime authority.

## Versioning and self-healing are future claims

The README proposes self-healing and richer version management but the pinned source only distinguishes current draft and published files. Those roadmap concepts are not counted as implemented mechanisms.

## Security boundary

The inspected source contains an embedded provider credential. It is not reproduced here and should be revoked and moved to environment-managed secret storage. This does not change the product classification but prevents the dossier from normalizing unsafe delivery practice.

## Pinned evidence

- [Repository](https://github.com/QuantAI3113/AI-Workflow-Builder)
- [Inspected tree](https://github.com/QuantAI3113/AI-Workflow-Builder/tree/3a8b32c1898853cd1b91b7fec19c5271f9a3a7f0)
- [Workflow node component](https://github.com/QuantAI3113/AI-Workflow-Builder/blob/3a8b32c1898853cd1b91b7fec19c5271f9a3a7f0/UI/src/components/WorkflowNode.jsx)
