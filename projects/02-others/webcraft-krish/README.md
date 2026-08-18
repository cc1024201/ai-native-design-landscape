# WebCraft AI by Krish Anand

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

WebCraft gives the model authority over an executable workspace rather than returning one HTML string. The product boundary spans persistent project prompts, an isolated worker filesystem and separate editor and preview services.

## Streamed actions mutate a live workspace

[`worker/index.ts`](https://github.com/Official-Krish/WebCraft-Website-that-makes-website/blob/42da2019aec38148673fe9fa212c8d26163f2bbe/apps/worker/index.ts) gathers a project's prompt history, streams Gemini 2.5 Pro and passes each chunk to an action parser. [`parser.ts`](https://github.com/Official-Krish/WebCraft-Website-that-makes-website/blob/42da2019aec38148673fe9fa212c8d26163f2bbe/apps/worker/utils/parser.ts) turns tagged file and shell actions into callbacks as they become complete. The [system contract](https://github.com/Official-Krish/WebCraft-Website-that-makes-website/blob/42da2019aec38148673fe9fa212c8d26163f2bbe/apps/worker/utils/Prompt.ts) requires comprehensive file content and adds component identifiers for later targeted edits.

## Rendering is service-level rather than `srcdoc`

Each project receives worker, browser-editor and preview endpoints. [`EditorPanel.tsx`](https://github.com/Official-Krish/WebCraft-Website-that-makes-website/blob/42da2019aec38148673fe9fa212c8d26163f2bbe/apps/frontend/src/components/project/EditorPanel.tsx) switches between those live URLs and can expose the preview full screen. Prisma records the project and its prompt/action history; the running workspace remains the immediate source authority, so this is a managed agent builder rather than a chat-only generator.

## Evidence

- [Canonical repository](https://github.com/Official-Krish/WebCraft-Website-that-makes-website)
- [Inspected tree](https://github.com/Official-Krish/WebCraft-Website-that-makes-website/tree/42da2019aec38148673fe9fa212c8d26163f2bbe)
- Commit: `42da2019aec38148673fe9fa212c8d26163f2bbe`
