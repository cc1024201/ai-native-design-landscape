# Forgix

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Forgix descends from a public single-document website-builder source family but materially changes what can authorize a build. A prompt a screenshot or an existing URL can seed the accepted HTML; that new multi-input definition is why it remains an independent derived record.

## Visual and existing-site evidence are first-class inputs

[`client/src/pages/Generate.jsx`](https://github.com/Tanayahue/Forgix/blob/a5e47a12a470b1c5670834ecdd5a09c29a8cf021/client/src/pages/Generate.jsx) exposes prompt image and URL paths. [`server/controllers/Website.controllers.js`](https://github.com/Tanayahue/Forgix/blob/a5e47a12a470b1c5670834ecdd5a09c29a8cf021/server/controllers/Website.controllers.js) sends screenshots through the vision-capable model and extracts an existing page before asking the model to rebuild it.

That differs from a rebrand of the shared Mongo builder: visual pixels or an external site can now establish the initial design evidence rather than only prose.

## A mutable HTML document remains the output authority

[`server/models/website.model.js`](https://github.com/Tanayahue/Forgix/blob/a5e47a12a470b1c5670834ecdd5a09c29a8cf021/server/models/website.model.js) persists `latestCode` conversation and publication fields. [`client/src/pages/Editor.jsx`](https://github.com/Tanayahue/Forgix/blob/a5e47a12a470b1c5670834ecdd5a09c29a8cf021/client/src/pages/Editor.jsx) uses that document for editing and preview. Revisions replace sequential current source; there is no immutable version graph.

## Evidence and lineage limit

- [Canonical repository](https://github.com/Tanayahue/Forgix)
- [Inspected tree](https://github.com/Tanayahue/Forgix/tree/a5e47a12a470b1c5670834ecdd5a09c29a8cf021)
- Commit: `a5e47a12a470b1c5670834ecdd5a09c29a8cf021`

Exact controller and schema fingerprints connect Forgix to the Genie public source family. The multi-input artifact contract is the material divergence. The maintainer profile states Jaipur; team region is recorded as India.
