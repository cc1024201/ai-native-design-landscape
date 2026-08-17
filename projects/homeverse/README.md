# HomeVerse

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HomeVerse is an AI-assisted interior-design studio whose important boundary is the transition from generated layout candidates to a persistent editable 3D scene. It combines blueprint interpretation, image variants, direct object manipulation and a copilot that mutates the same project scene.

## Generation begins with structured house data

[`layout_engine.py`](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/backend/app/services/layout_engine.py) asks Gemini to turn a floor-plan image and user brief into structured room and object data, validates the response and has deterministic fallbacks. This intermediate geometry constrains later layout and visualization work more than a free-form image prompt would.

The application can retain multiple `Design` records beneath a project. Those candidate records include generated imagery and generation metadata, so exploration is not overwritten by the next prompt.

## Selection crosses into a different artifact authority

The durable editable workspace is represented by SQL models for [`Project`](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/backend/app/models/project.py), [`Design`](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/backend/app/models/design.py) and individual 3D [`Object`](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/backend/app/models/object.py) transforms. Generated 2D candidates are therefore not mistaken for the final editable representation. The selected direction becomes a scene whose object position, scale, rotation and properties can be changed directly.

## Copilot and direct manipulation converge on the scene graph

React Three Fiber renders the studio canvas, while the properties panel exposes ordinary direct edits. [`copilot/service.py`](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/backend/app/v2/ai/copilot/service.py) translates natural-language instructions into add, update and delete operations over scene objects. Failed interpretation preserves the original graph rather than committing arbitrary text as state.

This produces a meaningful shared-authority loop: the user and copilot change the same structured object model and the canvas projects that model. The repository also contains a broader V2 AI pipeline, but its presence is not treated as proof that every module is wired into the ordinary user path.

## Maturity boundary

The pinned implementation is an ambitious working project rather than a hardened CAD system. Generated imagery, layout JSON and 3D object graphs have different fidelity and editability; source does not establish lossless reconstruction from an arbitrary rendered room back into detailed geometry. SQL persistence is real, while merge-aware collaboration and a durable branch/revert model are not established.

## Evidence

- [Pinned repository](https://github.com/AnishaPaturi/HomeVerse/tree/8a184b4394bf2c5fe1c34ec66272e031540b52d7)
- [Studio canvas](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/frontend/src/components/studio/CanvasContainer.tsx)
- [Copilot UI](https://github.com/AnishaPaturi/HomeVerse/blob/8a184b4394bf2c5fe1c34ec66272e031540b52d7/frontend/src/components/studio/CopilotChat.tsx)
