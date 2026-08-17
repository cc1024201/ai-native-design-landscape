# OpenVibeCoding

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

OpenVibeCoding is Tencent CloudBase's open app-building platform, not merely an agent SDK demo. An ordinary user describes an application, watches task and subagent activity, reviews file diffs, edits workspace files, opens a live preview and deploys the selected workspace to CloudBase targets including web and mini-program surfaces.

## The workspace is mediated by an open agent kernel

Pinned revision: `c412c2cd12515a14e5ddd3f1cf6e35094c7ed539`.

The monorepo separates chat UI, server orchestration and `open-agent-kernel`. The kernel defines sessions, permissions, sandbox/storage adapters and workspace snapshots. Server persistence projects agent events into application state. The web client exposes file browser, diff viewer and editor, so applied changes have source-level receipts rather than only narrative status.

## Preview and deployment are client tools with independent completion

The preview bridge connects the product UI to a running sandbox. CloudBase middleware uploads files and tracks deployment jobs. Agent completion, file persistence, preview readiness and deployment success are separate events; the task transcript can therefore show progress without falsely asserting that the public artifact moved.

## Why the kernel does not become a separate census product here

The kernel is reusable infrastructure inside the same repository, but discovery established one surfaced ordinary-user product loop. It is treated as OpenVibeCoding's runtime architecture, not double-counted as an additional design product.

## Pinned evidence

- [Repository](https://github.com/TencentCloudBase/OpenVibeCoding)
- [Open agent kernel design](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/docs/open-agent-kernel-design.md)
- [File diff viewer](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/web/src/components/file-diff-viewer.tsx)
- [Preview bridge](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/web/src/hooks/use-preview-bridge.ts)
- [CloudBase deployment job tool](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/server/src/middleware/mcp/cloudbase/getDeployJobStatus.ts)
