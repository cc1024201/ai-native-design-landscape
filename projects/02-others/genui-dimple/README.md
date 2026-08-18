# GenUI by Dimple

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

GenUI is a client-side component generator that asks Gemini for output in one of many named framework dialects. The artifact is generated code rather than a component AST or hosted project.

## Framework choice is prompt context not runtime abstraction

[`Home.jsx`](https://github.com/DimpleCh8686/GenUI/blob/f4c88120d69812321552366847347370a2fe868b/src/pages/Home.jsx) sends the selected framework and user description directly to the Google GenAI client. The response is cleaned into a code string. HTML-like modes can be visually projected; other framework modes remain code for inspection and export unless their output is browser-executable as a document.

## Monaco owns correction

The same Home component passes the code state to Monaco. Manual changes replace that state and the preview consumes the updated value. Copy and download therefore deliver the user's corrected code rather than the original model response.

## Local history and authentication limits

Code history and theme are browser-local. The visible “users” are demo records handled by [`UserContext.jsx`](https://github.com/DimpleCh8686/GenUI/blob/f4c88120d69812321552366847347370a2fe868b/src/context/UserContext.jsx); they are not server identities and do not make history portable across browsers. The repository itself lists real authentication and database support as future work.

## Evidence

- [Canonical repository](https://github.com/DimpleCh8686/GenUI)
- [Inspected tree](https://github.com/DimpleCh8686/GenUI/tree/f4c88120d69812321552366847347370a2fe868b)
- [Generation editor and preview loop](https://github.com/DimpleCh8686/GenUI/blob/f4c88120d69812321552366847347370a2fe868b/src/pages/Home.jsx)
- Commit: `f4c88120d69812321552366847347370a2fe868b`

The maintainer profile does not publish a geographic location; region remains `unknown`.
