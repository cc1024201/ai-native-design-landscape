# Hanzo App

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Hanzo declares its ancestry instead of hiding it: [`NOTICE`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/NOTICE) traces the code through OSW Studio to DeepSite. It is nevertheless counted separately because the inspected system has an independent Hanzo product identity and materially different cloud, organization, gateway and delivery boundaries.

## Agent tools mutate a managed workspace

[`multi-agent-orchestrator.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/llm/multi-agent-orchestrator.ts) coordinates model roles and tools. [`vfs/index.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/vfs/index.ts) exposes the virtual file authority used by editing and runtime systems.

## Preview and rollback do different jobs

[`live-preview.tsx`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/components/preview/live-preview.tsx) projects the current workspace. [`checkpoint.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/lib/vfs/checkpoint.ts) records recoverable file states. Preview supplies visual evidence; checkpoints govern which source state can be restored.

## Delivery establishes the independent boundary

[`deployments/route.ts`](https://github.com/hanzo-apps/app/blob/485a932a0784ac7f34c6996a81654c3ec1ca28ab/app/v1/deployments/route.ts) connects workspace state to Hanzo deployment records. That operational surface—not a renamed README alone—is why Hanzo is not collapsed into OSW.

## Evidence lock

- [Canonical repository](https://github.com/hanzo-apps/app)
- [Inspected tree](https://github.com/hanzo-apps/app/tree/485a932a0784ac7f34c6996a81654c3ec1ca28ab)
- Commit: `485a932a0784ac7f34c6996a81654c3ec1ca28ab`
