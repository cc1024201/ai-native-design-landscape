# OpenVibeCoding

OpenVibeCoding treats design as a described application that becomes a workspace of real files with source-level receipts. It is Tencent CloudBase's open app-building platform, not merely an agent SDK demo: an ordinary user describes an app, watches task and subagent activity, reviews file diffs, edits workspace files, opens a live preview and deploys the selected workspace. The design's worth is measured by how much of it survives as mutable, reviewable source.

## An open agent kernel mediates the workspace

The monorepo separates chat UI, server orchestration and `open-agent-kernel`. The kernel owns sessions, permissions, sandbox/storage adapters and workspace snapshots; the server persists agent events into application state; the web client exposes a file browser, diff viewer and editor. Applied changes therefore have source-level receipts — you can see exactly what the agent wrote — rather than only a narrative of what it intended. [Open agent kernel design](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/docs/open-agent-kernel-design.md) · [File diff viewer](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/web/src/components/file-diff-viewer.tsx)

## Preview and deployment are client tools with independent completion

The preview bridge connects the product UI to a running sandbox; CloudBase middleware uploads files and tracks deployment jobs. Agent completion, file persistence, preview readiness and deployment success are separate events — the task transcript can show progress without falsely asserting that the public artifact moved. Shipping is a deliberate, observable act over the workspace, not an implicit consequence of a chat finishing. [Preview bridge](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/web/src/hooks/use-preview-bridge.ts) · [Deployment job tool](https://github.com/TencentCloudBase/OpenVibeCoding/blob/c412c2cd12515a14e5ddd3f1cf6e35094c7ed539/packages/server/src/middleware/mcp/cloudbase/getDeployJobStatus.ts)

The kernel is reusable infrastructure inside the same repository, so it is treated as OpenVibeCoding's runtime architecture rather than double-counted as an additional census product ([repository](https://github.com/TencentCloudBase/OpenVibeCoding)).
