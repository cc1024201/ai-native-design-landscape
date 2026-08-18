# Kyndryl Consult Agent Builder for Modernization

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Kyndryl Consult Agent Builder is a monorepo for materializing deployable agent projects and coordinating registered A2A agents. Its README still calls the web builder future work, but the inspected tree contains a working form-based builder, a separate experimental workflow canvas and the CLI bridge they sit above.

## The primary promotion path is form to source package

[agentBuilderStore.js](https://github.com/krogstade/agentic-ai-aws/blob/a8cd078a5e2c751366e397e7fe4a94a140d12540/packages/agent-builder-ui/src/store/agentBuilderStore.js) collects template, cloud, deployment target and repository settings, then streams progress from the creation API. The API [server.js](https://github.com/krogstade/agentic-ai-aws/blob/a8cd078a5e2c751366e397e7fe4a94a140d12540/packages/agent-builder-ui/api/server.js) translates those fields into `agent-builder create` arguments and can return a generated ZIP or pushed repository.

## Visual workflow composition is a second, less durable surface

[useWorkflowCanvas.js](https://github.com/krogstade/agentic-ai-aws/blob/a8cd078a5e2c751366e397e7fe4a94a140d12540/packages/agent-builder-ui/src/hooks/useWorkflowCanvas.js) supports React Flow agents, decisions, conditions and human-input nodes. The inspected path does not persist or compile that graph into the creation CLI, so it is an experimental coordination UI rather than the source authority.

## Generated agents participate through A2A

The monorepo contains deployable ADK templates, registry and orchestration packages. `useTask` submits messages to a selected agent's A2A endpoint and polls task state, while the builder's durable result is generated source and deployment configuration.

## Lifecycle judgment

Overlapping old/new components and README roadmap language make this an active transition. Inclusion rests on the implemented form → CLI → source/repository loop, not on claiming the visual canvas already governs runtime.

## Pinned evidence

- [Repository](https://github.com/krogstade/agentic-ai-aws)
- [Inspected tree](https://github.com/krogstade/agentic-ai-aws/tree/a8cd078a5e2c751366e397e7fe4a94a140d12540)
- [CLI package](https://github.com/krogstade/agentic-ai-aws/tree/a8cd078a5e2c751366e397e7fe4a94a140d12540/packages/agent-builder-cli)
