# Poco

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Poco is a general agent coworker whose Design-relevant surface is a first-class artifacts view and channel-wide published-artifact tree. HTML, PDF, Markdown, images, video, XMind, Excalidraw and Draw.io results can be previewed and then promoted into shared collaboration material.

## Publication changes visibility without merging filesystems

An execution result begins in an agent session. Publishing creates a channel artifact with explicit database identity, ownership and API access; the UI groups those artifacts by agent and renders them in the artifacts panel or shared drawer. Other agents read them through dedicated list/read/search runtime tools rather than pretending the logical path is a local `/workspace` path.

The architecture deliberately keeps session workspaces, persistent agent state, local mounts and the public artifact tree separate. Published artifacts are shared read-only context, not a silently writable channel filesystem. This makes persistence, collaboration and later reuse explicit parts of the visual-output loop.

## Evidence

- [Pinned repository](https://github.com/poco-ai/poco-claw/tree/e7a9ba81deeb3d47caa6b62108e87d6274b3931f)
- [Artifacts-view contract](https://github.com/poco-ai/poco-claw/blob/e7a9ba81deeb3d47caa6b62108e87d6274b3931f/docs/en/features/beautiful-interface/artifacts.mdx)
- [Channel artifact model](https://github.com/poco-ai/poco-claw/blob/e7a9ba81deeb3d47caa6b62108e87d6274b3931f/backend/app/models/channel_artifact.py)
- [Shared-artifacts decision](https://github.com/poco-ai/poco-claw/blob/e7a9ba81deeb3d47caa6b62108e87d6274b3931f/specs/constitution/2026-05-05-channel-shared-context-and-artifacts.md)
