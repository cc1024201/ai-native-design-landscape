# HyCanvas

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HyCanvas is a self-hostable visual platform spanning graphics, presentations, video, whiteboards, documents, sheets and print. Its product claim is broader than AI generation: a user can open a template, directly edit the structured document, use a workspace-scoped BYOK AI layer and retain the result in an open `.hyc` JSON file.

## One document engine serves several design domains

Framework-independent packages define schema, geometry, editor, timeline, whiteboard, document and export behavior. The frontend projects that state into the browser editor. The Go backend stores workspace documents, media and history and owns server-side export and rendering.

The persistence package at [`backend/internal/persistence`](https://github.com/hyscaler/HyCanvas/tree/4fce59b699dd62812329c0a3b7a81aae3b7f22d9/backend/internal/persistence) contains repository writes, CRDT branches, history updates, leave snapshots and version-history tests. [`backend/internal/aistudio`](https://github.com/hyscaler/HyCanvas/tree/4fce59b699dd62812329c0a3b7a81aae3b7f22d9/backend/internal/aistudio) is a separate generation/session layer; AI output enters the same document system rather than becoming the only source.

```text
template/import/prompt -> native HYC graph -> direct editor mutations
-> database + history -> PNG/PDF/video/document projections
-> portable .hyc export -> import on another instance
```

The portable file is the cross-instance recovery boundary. Database state and branch history support richer in-instance recovery; flat exports lose object editability. Roadmap documents are explicitly not treated as shipped behavior.

HyCanvas uses Elastic License 2.0, which permits source use and modification but restricts providing a substantially similar hosted service; it is source-available rather than OSI open source. The organization profile reports India.

## Decisive sources

- [Pinned repository](https://github.com/hyscaler/HyCanvas/tree/4fce59b699dd62812329c0a3b7a81aae3b7f22d9)
- [Rendering engine](https://github.com/hyscaler/HyCanvas/tree/4fce59b699dd62812329c0a3b7a81aae3b7f22d9/backend/internal/render)
- [Export API](https://github.com/hyscaler/HyCanvas/blob/4fce59b699dd62812329c0a3b7a81aae3b7f22d9/backend/internal/httpapi/export.go)
- [Elastic License 2.0](https://github.com/hyscaler/HyCanvas/blob/4fce59b699dd62812329c0a3b7a81aae3b7f22d9/LICENSE)
