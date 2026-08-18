# Kleva

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

Kleva is an early AI website builder that exposes two overlapping authoring paths: prompt or voice-driven regeneration of HTML/CSS/JavaScript, and a component canvas for manual layout and style changes.

## Source code is the shared regeneration boundary

[`ai.ts`](https://github.com/Bamideleo/kleva-frontend/blob/33f87253866c690e49ac428e37a993fb2cc2acdc/src/lib/ai.ts) sends the brief and—during a revision—the current HTML, CSS and JavaScript to the generation backend. `EditProject` retains those files as separate strings, exposes code tabs, streams changes into an iframe preview and can submit the same files to edit, publish and update APIs.

```text
text/voice brief -> generated HTML + CSS + JS -> iframe preview
-> source edit or follow-up regeneration -> project API
-> publish or ZIP of the same files
```

The separate [`Editor.tsx`](https://github.com/Bamideleo/kleva-frontend/blob/33f87253866c690e49ac428e37a993fb2cc2acdc/src/components/Editor.tsx) implements a small draggable component graph and HTML export. Some controls are still partial: its save path is simulated and the visible undo/redo buttons are not wired to a history model. The stronger implemented persistence path is the source-oriented `EditProject` API. This is why the record is `active-transition`, not evidence of a mature collaborative visual editor.

HTML/CSS/JavaScript are the portable authority; the iframe and component canvas are projections. ZIP preserves source editability, whereas the published page is a deployed outcome. No license file or package license declaration was present. The maintainer profile reports Lagos, Nigeria.

## Pinned evidence

- [Repository](https://github.com/Bamideleo/kleva-frontend/tree/33f87253866c690e49ac428e37a993fb2cc2acdc)
- [Source workspace](https://github.com/Bamideleo/kleva-frontend/blob/33f87253866c690e49ac428e37a993fb2cc2acdc/src/components/EditProject.tsx)
- [Project and publishing APIs](https://github.com/Bamideleo/kleva-frontend/blob/33f87253866c690e49ac428e37a993fb2cc2acdc/src/api/auth.tsx)
- [Artifact types](https://github.com/Bamideleo/kleva-frontend/blob/33f87253866c690e49ac428e37a993fb2cc2acdc/src/types/index.ts)
