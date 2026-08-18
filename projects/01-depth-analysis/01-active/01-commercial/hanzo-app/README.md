# Hanzo App

Hanzo answers "what is design" the way a cloud platform does: design is a managed workspace whose state is authoritative, and AI is one of several tools mutating it. It does not pretend to generate a finished app from air — the agent writes into a virtual file tree that preview and deployment both treat as the single source of truth.

## The agent is a tool, not the owner

[`multi-agent-orchestrator.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/llm/multi-agent-orchestrator.ts) coordinates model roles and their available tools, and [`vfs/index.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/vfs/index.ts) exposes the virtual file authority those tools act on. The implementation's decisive move is that the "design" the user sees is never a detached mock: it is a real filesystem projection, and the agent edits that same projection. Editing, previewing and deploying therefore all reference identical state rather than branching copies.

## Preview shows evidence, checkpoints grant recovery

[`live-preview.tsx`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/components/preview/live-preview.tsx) renders the current workspace for visual feedback, while [`checkpoint.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/vfs/checkpoint.ts) records recoverable file states. The division is telling: one mechanism only reflects state, the other is what actually constrains undo. Design persistence here lives in versioned file state, not in any canvas memory.

## Delivery is what marks the product boundary

[`deployments/route.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/app/v1/deployments/route.ts) ties workspace state to Hanzo deployment records, and the project's [`NOTICE`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/NOTICE) openly traces the code back through OSW Studio to DeepSite. Hanzo is counted separately not because the code is new but because the operational surface is: cloud, organization, gateway and delivery form an independent boundary where the same generation mechanism ends inside Hanzo's own deployment records — evidenced by the [canonical repository](https://github.com/hanzo-apps/app) at commit `485a932a0784ac7f34c6996a81654c3ec1ca28ab`.
