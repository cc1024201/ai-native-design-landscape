# Puck

> Research status: **Source-level** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | Puck contributors |
| Category | React visual-editor kernel / open-source interaction primitive |
| Status | Active; v0.23.0 at pinned revision |
| Source availability | MIT |
| Previous names / aliases | — |
| Canonical product URL | https://puckeditor.com |
| Canonical source repository | https://github.com/puckeditor/puck |
| Pinned source revision | `b4204f09fde3f4b286294567fce53fafa7136858` |

## 1. Product facts

Puck is a modular open-source visual editor for React. It is distributed primarily as `@puckeditor/core`, which an application embeds as a React component to create a custom drag-and-drop editing experience using that application's own React components.

The host supplies a component configuration and structured editor data. Puck renders the editing UI; the host decides how and where published data is persisted. The same component configuration and data can be rendered outside the editor through Puck's `Render` component.

Puck is therefore an editor kernel rather than a hosted AI design product or coding-agent runtime.

## 2. Technical direction

Puck's architectural direction is **schema/config-driven visual editing over application-owned React components and application-owned data**.

It separates:

- component implementation (`config.components[*].render`);
- editable field/schema definitions (`config`);
- structured page data (`Data`);
- editor state/drag-drop interactions;
- final runtime rendering (`Render`);
- persistence, which is explicitly delegated to the embedding application.

This makes Puck useful as a visual-surface primitive because the host can build a domain-specific editor without surrendering component ownership or storage to Puck.

## 3. Technology choices

### Core/editor

- **Language/runtime:** TypeScript + React; React 18 and 19 are peer-supported.
- **Drag/drop:** dnd-kit (`@dnd-kit/abstract`, DOM, geometry, helpers, React and state packages).
- **Rich text:** Tiptap 3 / ProseMirror packages.
- **State:** Zustand 5.
- **Virtualization:** TanStack React Virtual.
- **Popover primitives:** Radix UI.
- **Diff/data helpers:** `deep-diff`, `fast-equals`, `object-hash`, `flat`.
- **Build:** tsup; Node >=20.
- **Test environment:** Jest/happy-dom/testing-library stack.

### Packaging

`@puckeditor/core` ships normal client exports plus React-server-compatible exports and an RSC entry point. The repository also supplies app recipes for Next.js and React Router.

## 4. Artifact and data model

### Primary durable artifact / source of truth

Puck's primary editable artifact is the host-owned structured `Data` object. Puck does not prescribe a database or proprietary file format.

At the pinned revision:

```ts
Data = {
  root,
  content,
  zones?
}
```

`content` and each zone are arrays of `ComponentData` entries. A component entry has:

- a component `type`;
- `props` that include a stable item `id` through `WithId`;
- optional read-only field metadata.

The root can also carry deep slots containing nested Puck content.

### Component model

`Config` maps symbolic component types to field schemas and React render functions. The serialized data refers to those component types and props rather than serializing arbitrary React component instances.

### Data ownership

The README's minimal example passes `initialData` into `<Puck ...>` and receives the edited `data` through `onPublish`, where the host application saves it. This establishes storage inversion: Puck owns editing behavior but not persistence.

## 5. Agent interface

Puck core does **not** define a first-party coding-agent runtime or MCP/ACP contract in the pinned source inspected for this dossier.

Its relevance to agentic design is as an embeddable visual editor primitive. An external product can:

- generate/modify Puck `Data`;
- expose the data/config to an agent;
- embed Puck for human direct manipulation;
- persist accepted data through its own service.

Any project-specific agent bridge built on top of Puck should therefore be documented in that project's own directory rather than attributed to Puck core.

## 6. Runtime and rendering

### Editor runtime

Puck runs as a React component inside the host application. Drag/drop and field editing mutate editor/application state built around the structured `Data` representation.

### Final rendering

`<Render config={config} data={data} />` resolves the serialized component types against the host-provided React render functions. This means the final UI is rendered using real host React components, but from a Puck-owned structured content graph rather than by editing an arbitrary already-running DOM tree.

### Server rendering

The core package publishes React-server/RSC-compatible exports and contains `ServerRender`, establishing a rendering path beyond the interactive browser editor.

## 7. Source mapping and targeting

Puck does not solve arbitrary DOM-to-source mapping. Its targeting model is stronger and narrower: editor nodes already originate from Puck's structured data.

### Stable identity

Component data props include IDs. Selection, drag/drop and editing can therefore target structured editor items directly rather than reconstructing identity from a rendered DOM node.

### Mapping

The primary mapping is:

`Data component type + id + props → config component renderer → rendered React output`.

Because the host supplies component render functions, a Puck item can deterministically identify which configured component type it represents. This does **not** mean Puck knows the source file/line of that component implementation.

### Boundary

Puck is not a source-code editor and does not claim deterministic writeback into arbitrary JSX/TSX source. Durable edits normally update the Puck `Data` artifact.

## 8. Persistence and versioning

### Persistence

Puck intentionally delegates persistence to the embedding application. `onPublish(data)` is the canonical example of handing the edited artifact back to host code for saving.

### Editor state

Internal application/editor state is managed separately from the durable `Data`; source paths under `packages/core/store/` and `packages/core/reducer/` hold this runtime editor state and mutation logic.

### Migration

`packages/core/lib/migrate.ts` demonstrates that Puck includes data migration handling as the structured artifact evolves.

### Versioning

Puck provides no mandated repository/database version system. The host can version JSON/data in a DB, CMS, filesystem or git according to its application architecture.

## 9. Open-source implementation map

Repository pinned at `b4204f09fde3f4b286294567fce53fafa7136858`.

| Concern | Repository path | What it establishes |
|---|---|---|
| Product contract | `README.md` | embed Puck, define config/data, persist via host, render with `Render` |
| Core package stack | `packages/core/package.json` | React/dnd-kit/Tiptap/Zustand/deep-diff/tooling choices |
| Durable data model | `packages/core/types/Data.tsx` | `root`, `content`, `zones`, component type/props/id structure |
| Component configuration | `packages/core/types/Config.tsx` | host-defined component/field/render contract |
| Editor state | `packages/core/store/` | runtime app/editor state |
| Mutation/reducer layer | `packages/core/reducer/` | structured editor operations |
| Drag/drop | `packages/core/components/DragDropContext/` | DnD orchestration |
| Drop zones | `packages/core/components/DropZone/` | nested content/zone interaction surface |
| Rendering | `packages/core/components/Render/`, `packages/core/components/ServerRender/` | structured data → React output |
| Data migration | `packages/core/lib/migrate.ts` | artifact-schema migration behavior |

## 10. Commit-level evidence

**Pinned revision:** `b4204f09fde3f4b286294567fce53fafa7136858`

| Claim | Evidence at pinned revision |
|---|---|
| Puck is an embeddable MIT visual editor for host-owned React components/data | [`README.md`](https://github.com/puckeditor/puck/blob/b4204f09fde3f4b286294567fce53fafa7136858/README.md) |
| Core stack includes React, dnd-kit, Tiptap and Zustand | [`packages/core/package.json`](https://github.com/puckeditor/puck/blob/b4204f09fde3f4b286294567fce53fafa7136858/packages/core/package.json) |
| Durable data is structured as root/content/zones with typed component entries and IDs | [`packages/core/types/Data.tsx`](https://github.com/puckeditor/puck/blob/b4204f09fde3f4b286294567fce53fafa7136858/packages/core/types/Data.tsx) |
| Host application controls persistence through the Puck publish callback | [`README.md`](https://github.com/puckeditor/puck/blob/b4204f09fde3f4b286294567fce53fafa7136858/README.md) |

## Evidence boundary

- **Fact:** Puck's data/config/render/persistence boundary and package technology choices are pinned to public source.
- **Inference:** Puck is best modeled as a visual-editor kernel because it supplies editing/runtime primitives while delegating storage, application shell and agents to the host.
- **Unknown/not applicable:** Puck core does not provide a universal code source-mapping or coding-agent protocol in the evidence reviewed here.

## Research gaps

- Trace reducer/action/history semantics and exact undo/redo model.
- Trace nested slot/zone identity and drag/drop location semantics.
- Trace data migration versions and compatibility rules.
- Trace RSC/server-rendering constraints.
- Document extension/plugin APIs relevant to embedding Puck in agent-native products.

## Primary sources

- https://github.com/puckeditor/puck/tree/b4204f09fde3f4b286294567fce53fafa7136858
- https://puckeditor.com
