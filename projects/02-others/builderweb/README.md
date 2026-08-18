# BuilderWeb (Project Horizon)

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

BuilderWeb is not just a prompt-to-page demo. It defines a managed marketing workspace spanning websites, landing pages, brand assets, images, content, email and social output. Its repository also reveals a consequential gap between the intended relational model and the currently wired runtime.

## Website authority is a structured JSON response

Pinned revision: `860d877d00a2f793ba462f0f8834b39b8ff815ab`.

Generated websites are represented as structured `WebsiteOutput` content and projected into editor, preview and export routes. Landing pages have a separate section-oriented editing loop, while the adjacent studios each keep their own artifact contract; this is a suite of coordinated authoring surfaces, not one universal canvas.

## Version semantics exist, durability does not yet match them

The service contract exposes list, create, autosave and restore operations. Restore copies an older snapshot into a new head version, preserving lineage instead of moving the cursor backward. However, the active website endpoint stores websites and versions in module-level dictionaries. SQLAlchemy models describe relational `generated_websites` and `website_versions` tables, but those models are not the authority used by that endpoint. A process restart therefore defeats the UI's durable-project appearance.

## Delivery branches by artifact

Website and landing-page routes provide preview and export surfaces, while the broader studios expose their own export or publishing actions. The dossier treats those as separate delivery contracts and does not infer that every studio is production-backed merely because navigation exists.

## Pinned evidence

- [Repository](https://github.com/AbdullahShahid156/project-horizon)
- [Intended website and version data model](https://github.com/AbdullahShahid156/project-horizon/blob/860d877d00a2f793ba462f0f8834b39b8ff815ab/backend/app/models/website.py)
- [Current in-memory version and restore runtime](https://github.com/AbdullahShahid156/project-horizon/blob/860d877d00a2f793ba462f0f8834b39b8ff815ab/backend/app/api/v1/endpoints/websites.py)
- [Frontend persistence contract](https://github.com/AbdullahShahid156/project-horizon/blob/860d877d00a2f793ba462f0f8834b39b8ff815ab/frontend/src/services/websites.ts)
- [Website editor surface](https://github.com/AbdullahShahid156/project-horizon/blob/860d877d00a2f793ba462f0f8834b39b8ff815ab/frontend/src/app/%28dashboard%29/projects/%5BprojectId%5D/editor/%5BwebsiteId%5D/page.tsx)
- [Landing-page export projection](https://github.com/AbdullahShahid156/project-horizon/blob/860d877d00a2f793ba462f0f8834b39b8ff815ab/frontend/src/features/landing-page/utils/export.ts)
