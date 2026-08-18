# TaskStream

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

TaskStream is a full-stack visual AI workflow system whose stored React Flow graph reaches a queued backend executor. The source also contains assistant-like UI that is rule-based; this dossier separates that presentation from the real runtime.

## The versioned graph is authoritative

[workflow.py](https://github.com/jason-jz-zhu/TaskStream/blob/f56918d618aef202513228049202add67478ee22/backend/app/models/workflow.py) stores nodes and edges as workflow JSON, validates acyclicity and retains separate `WorkflowVersion` snapshots. Publication and organization scope live on the same record.

## Runs consume the saved topology

[executor.py](https://github.com/jason-jz-zhu/TaskStream/blob/f56918d618aef202513228049202add67478ee22/backend/app/tasks/executor.py) builds a topological order, passes connected upstream output into registered node executors and writes per-node status, inputs, output, retries and provider metadata. Celery queues the run; OpenAI, Anthropic, Mistral and Ollama adapters implement LLM nodes.

## “AI assistant” is not the prompt-to-graph evidence

[WorkflowAssistant.tsx](https://github.com/jason-jz-zhu/TaskStream/blob/f56918d618aef202513228049202add67478ee22/frontend/src/components/workflow/WorkflowAssistant.tsx) returns hard-coded suggestions. The generate page similarly uses keyword rules. TaskStream qualifies through editable graph execution and versioning, not through those simulated authoring claims.

## Delivery and inspection

Manual, webhook, schedule and API triggers create durable runs, and the run routes expose logs as they progress. That makes the ordinary loop edit → save/version → publish/trigger → inspect, with a clear backend authority.

## Pinned evidence

- [Repository](https://github.com/jason-jz-zhu/TaskStream)
- [Inspected tree](https://github.com/jason-jz-zhu/TaskStream/tree/f56918d618aef202513228049202add67478ee22)
- [Run records](https://github.com/jason-jz-zhu/TaskStream/blob/f56918d618aef202513228049202add67478ee22/backend/app/models/run.py)
