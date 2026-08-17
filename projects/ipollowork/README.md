# iPolloWork

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

iPolloWork is a local general-purpose agent workspace rather than a design-only product. It belongs in this landscape because design, slides and video are first-class editable artifact modes inside the same session—not merely files emitted by a chat transcript.

## Artifact runtimes separate conversation from editing

The session UI mounts artifacts through [`artifact-panel.tsx`](https://github.com/Devin-AXIS/iPolloWork/blob/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/artifacts/artifact-panel.tsx). The design domain under [`domains/session/design`](https://github.com/Devin-AXIS/iPolloWork/tree/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/design) owns the design-specific interaction state, while [`design-html-runtime.ts`](https://github.com/Devin-AXIS/iPolloWork/blob/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/design/design-html-runtime.ts) projects generated HTML into the visible artifact surface.

```text
local session + agent tools -> typed design/slides/video artifact
-> dedicated runtime/editor -> user edits or requests revision
-> session artifact state -> local handoff/export
```

This is a workbench architecture: the agent may create an artifact, but the ordinary user can continue in its dedicated surface. The repository does not establish a portable cross-instance design graph comparable to a Figma or Penpot file, so session storage and exported outputs should not be overstated as universal design authority.

The repository uses a custom source-available license with non-OSI restrictions. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/Devin-AXIS/iPolloWork/tree/cd3a08a55141be735cd8662914ef76c0db3ba0b4)
- [Artifact panel](https://github.com/Devin-AXIS/iPolloWork/blob/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/artifacts/artifact-panel.tsx)
- [Design domain](https://github.com/Devin-AXIS/iPolloWork/tree/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/design)
- [Design HTML runtime](https://github.com/Devin-AXIS/iPolloWork/blob/cd3a08a55141be735cd8662914ef76c0db3ba0b4/apps/app/src/react-app/domains/session/design/design-html-runtime.ts)
- [Custom license](https://github.com/Devin-AXIS/iPolloWork/blob/cd3a08a55141be735cd8662914ef76c0db3ba0b4/LICENSE)
