# AI Website Generator by Varun Sharma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

This project is a small full-stack website generator whose most important boundary is not the model choice but the split between server-owned AI state and browser-only manual edits.

## A website is one volatile page map

Pinned revision: `434ef4ce99fc266f6493a48403c86d934fe785b3`.

The Python service keeps `websites["current"]`, a process-memory map from page names to complete HTML strings. Generation and prompt-based edits replace entries in that map; restart the service and the project disappears. There is no account, database, named project or historical snapshot behind the word “website.”

## Manual editing has a different authority

The Next.js editor can change the fetched HTML directly, including through a content-editable preview. Those changes live only in component state. A later fetch or AI edit can replace them with the backend copy, so the UI exposes two authorities without a merge or save protocol.

## Preview is the only delivery surface

The preview injects the current HTML into an iframe. The repository exposes neither durable publishing nor a project export path, making the running browser surface—not an external artifact—the end of the implemented loop.

## Pinned evidence

- [Repository](https://github.com/varunsharma6956/AI-Website-Generator)
- [Volatile website register and routes](https://github.com/varunsharma6956/AI-Website-Generator/blob/434ef4ce99fc266f6493a48403c86d934fe785b3/backend/app/main.py)
- [Prompt-to-HTML adapter](https://github.com/varunsharma6956/AI-Website-Generator/blob/434ef4ce99fc266f6493a48403c86d934fe785b3/backend/app/ai.py)
- [Page editor state](https://github.com/varunsharma6956/AI-Website-Generator/blob/434ef4ce99fc266f6493a48403c86d934fe785b3/frontend/src/pages/%5Bpage%5D.tsx)
- [Editable iframe projection](https://github.com/varunsharma6956/AI-Website-Generator/blob/434ef4ce99fc266f6493a48403c86d934fe785b3/frontend/src/components/PreviewPane.tsx)
