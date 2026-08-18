# PHANTOM by Mohammad Abdul Raffay

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

PHANTOM generates React or React Native projects from a prompt, then treats a serialized multi-file project string as the bridge between Gemini, Firestore, WebContainer and delivery. Its distinguishing feature is not a native canvas but the way runtime failures can be returned as an explicit correction request against that current source bundle.

## A text protocol carries the project between layers

Pinned revision: `05b32c18cc7a9f0a8d9409afcb53642eccf69302`.

Gemini returns a project name plus create-file actions. The server normalizes those actions for the frontend, which joins them into a `Project Name` and repeated `File` text format. Follow-up responses may contain only changed files; the client parses both old and new bundles, merges by path and serializes a new complete value. Firestore stores that complete content under the user's chat id, making the saved bundle—not the mounted WebContainer instance—the recoverable authority.

There is no explicit source version graph. Each successful follow-up overwrites the saved current content. Chat identity survives reload and the latest project can be restored, but recovery of earlier source depends on external Firestore history or exported ZIPs rather than a product-level restore operation.

## Runtime errors become user-visible repair inputs

The client parses the current bundle into a WebContainer filesystem, installs dependencies and starts the declared development server. Terminal output and iframe messages are scanned for compilation, module and React failures. Errors accumulate visibly; the user invokes the fix action, which submits those errors and the complete current bundle to the modification endpoint. The system does not silently mutate source in the background, so the correction boundary remains inspectable.

## Delivery packages the runtime filesystem

ZIP export walks the mounted project. Web publication first runs the project build, collects `/dist`, uploads it to the repository's Netlify endpoint and persists the resulting URL and hosting id. Redeploy updates the same site. The React Native path shares generation and export but does not gain a browser-native mobile runtime merely because the web path uses WebContainer.

## Pinned evidence

- [Repository](https://github.com/raffay69/AI-WEBSITE-BUILDER)
- [Gemini action schema and refinement endpoints](https://github.com/raffay69/AI-WEBSITE-BUILDER/blob/05b32c18cc7a9f0a8d9409afcb53642eccf69302/backend/ai.mjs)
- [Current-source merge and WebContainer loop](https://github.com/raffay69/AI-WEBSITE-BUILDER/blob/05b32c18cc7a9f0a8d9409afcb53642eccf69302/frontend/ai-webgen/app/editor/page.tsx)
- [Project string parser](https://github.com/raffay69/AI-WEBSITE-BUILDER/blob/05b32c18cc7a9f0a8d9409afcb53642eccf69302/frontend/ai-webgen/app/editor/helper.ts)
- [WebContainer singleton](https://github.com/raffay69/AI-WEBSITE-BUILDER/blob/05b32c18cc7a9f0a8d9409afcb53642eccf69302/frontend/ai-webgen/hook/useWebContainer.ts)
- [ZIP delivery from mounted files](https://github.com/raffay69/AI-WEBSITE-BUILDER/blob/05b32c18cc7a9f0a8d9409afcb53642eccf69302/frontend/ai-webgen/hook/useProjectDownloader.ts)
