# IceZone Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

IceZone Studio treats an image or video production as an executable node canvas. Prompts media analysis generation and storyboard operations are connected so an output can become the input of another visible step rather than disappearing into a provider history page.

## Canvas state and asynchronous jobs meet at typed nodes

At commit [`a9d2015`](https://github.com/icezone/icezone-studio/tree/a9d201541556b4670bab4a51964c01091675513d) the canvas supports connections grouping undo/redo and autosave. API routes validate generation providers and enqueue jobs; node stores attach completed media back to the graph. Tests cover project persistence conflicts offline state connection validation batch storyboards and video analysis.

```text
novel / media / prompt node -> analysis or generation job -> output node
          ^                                               |
          +--------- reconnect / refine / template -------+
```

The same graph can be saved as a reusable template. Storyboard export is a delivery projection while the project graph its nodes and attached assets are the working authority. Provider keys are BYOK and stored through the application's encrypted key boundary.

The repository supplies broad automated evidence but no paid provider run was executed for this audit. Public first-party evidence did not establish the team region.

## Pinned evidence

- [Persistence design](https://github.com/icezone/icezone-studio/blob/a9d201541556b4670bab4a51964c01091675513d/docs/standards/persistence.md)
- [Project save tests](https://github.com/icezone/icezone-studio/blob/a9d201541556b4670bab4a51964c01091675513d/__tests__/unit/projectStore-save.test.ts)
- [Pinned README](https://github.com/icezone/icezone-studio/blob/a9d201541556b4670bab4a51964c01091675513d/README.md)
