# Genie AI Website Builder

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Genie is the earliest public repository currently located for a widely copied Mongo and OpenRouter website-builder lineage. It is counted as the provisional canonical source record only in that narrow sense; the evidence does not prove that its maintainer originated an unpublished tutorial or upstream source.

## One Mongo document governs the site

[`server/models/website.model.js`](https://github.com/Abhi21-7/Genie/blob/c123357e5f0280d749b101203123fb535684b2b3/server/models/website.model.js) stores `latestCode` with conversation credit deployment and slug fields. [`server/controllers/website.controllers.js`](https://github.com/Abhi21-7/Genie/blob/c123357e5f0280d749b101203123fb535684b2b3/server/controllers/website.controllers.js) creates that HTML through OpenRouter and sends the current document back for sequential revisions.

[`client/src/pages/Editor.jsx`](https://github.com/Abhi21-7/Genie/blob/c123357e5f0280d749b101203123fb535684b2b3/client/src/pages/Editor.jsx) exposes source and iframe projection from the same value. [`client/src/pages/Generate.jsx`](https://github.com/Abhi21-7/Genie/blob/c123357e5f0280d749b101203123fb535684b2b3/client/src/pages/Generate.jsx) initiates the project. Publication assigns the stored document a stable slug; it is not a separate deployment artifact graph.

## Why later repositories collapse here

Velora.AI GenwebAI and GenWeb AI reproduce substantial normalized source and the same unusual `latestCode` conversation credit and slug protocol. An exact typo in the credit error appears across at least seventeen public repositories. Those are provenance signals rather than seventeen independently defined products. Forgix remains separate because screenshot and URL inputs materially redefine the initial artifact authority.

## Evidence and limit

- [Canonical public repository](https://github.com/Abhi21-7/Genie)
- [Inspected tree](https://github.com/Abhi21-7/Genie/tree/c123357e5f0280d749b101203123fb535684b2b3)
- [Representative later mirror](https://github.com/SwaroopVNaik/Velora.AI)
- Commit: `c123357e5f0280d749b101203123fb535684b2b3`

The maintainer profile states India; team region is recorded as India. No official upstream identity was found.
