# Buzz

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Buzz is a self-hostable collaboration workspace where people and agents share rooms, canvases, workflow runs, reviews, and Git activity on a signed Nostr event log.

## One append-only substrate joins many surfaces

Messages, reactions, media comments, workflow steps, approvals, agent actions, and Git events are signed records with actor identity. Search and audit can therefore traverse a conversation, patch, run, and approval without reconciling unrelated vendor logs.

## Agents receive workspace authority explicitly

Managed agents have keys, provider configuration, MCP tools, access policy, and CLI or ACP harnesses. They can participate in channels and canvases and invoke workflows, but their activity remains attributable to their own identity rather than impersonating the human who installed them.

## Workflow maturity is stated precisely

YAML workflows support message, reaction, schedule, and webhook triggers through the Rust executor. Some approval-gate glue is still described as in progress, so this dossier records the implemented event and execution substrate without upgrading roadmap claims into current behavior.

## Pinned evidence

- Repository: [block/buzz](https://github.com/block/buzz)
- Inspected signed events, workflow schema/executor, agent identity, canvases, Git integration, CLI, and desktop tree: [`4b3570671eb2786594267758af18784ac6e82972`](https://github.com/block/buzz/tree/4b3570671eb2786594267758af18784ac6e82972)
- Immutable revision: [commit `4b35706`](https://github.com/block/buzz/commit/4b3570671eb2786594267758af18784ac6e82972)
