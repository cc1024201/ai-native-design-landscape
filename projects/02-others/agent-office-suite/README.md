# Agent Office Suite Enterprise

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Agent Office Suite Enterprise (AOSE) is a shared editing environment for documents, presentations, flowcharts, canvas graphics and video. Humans edit through dedicated applications while agents use MCP tools against the same native artifact models.

## Agent writes are attributed, versioned editor mutations

The MCP server exposes type-specific tools for [`canvas`](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/mcp-server/src/tools/canvas.js), [`presentations`](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/mcp-server/src/tools/presentations.js) and [`video`](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/mcp-server/src/tools/video.js). Before an agent mutation, the versioning layer takes an automatic attributed snapshot. [`revisions.js`](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/mcp-server/src/tools/revisions.js) exposes history and restoration.

```text
human editor or MCP agent -> native document mutation
-> automatic attributed snapshot -> shared artifact state
-> inspect history / restore revision -> continue in same editor
```

The shell mounts dedicated canvas and presentation editors, while `RevisionHistory` makes the provenance chain available to users. This distinguishes AOSE from chat systems that merely attach generated files: both parties operate on the same structured artifacts, and recovery is part of the agent interface. Export formats are projections; the suite's stored graphs plus revision chain are the working authority.

The project is Apache-2.0 licensed. No reliable maintainer-region evidence was found.

## Decisive evidence

- [Pinned repository](https://github.com/manpoai/AgentOfficeSuite/tree/d60ee30853a5a61bd4af624a68a8ff37f8e83357)
- [Canvas editor](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/shell/src/components/canvas-editor/CanvasEditor.tsx)
- [Presentation editor](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/shell/src/components/presentation-editor/PresentationEditor.tsx)
- [Revision-history UI](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/shell/src/components/RevisionHistory.tsx)
- [Revision MCP tools](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/mcp-server/src/tools/revisions.js)
- [Apache-2.0 license](https://github.com/manpoai/AgentOfficeSuite/blob/d60ee30853a5a61bd4af624a68a8ff37f8e83357/LICENSE)
