# Remotion Prompt to Motion Graphics

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Remotion Prompt to Motion Graphics is an independently runnable Next.js design workspace built by the Remotion team. A prompt becomes editable React animation code, the browser compiles that code into a live Remotion preview and follow-up requests or direct code edits revise the same artifact.

## The workspace is a transient code document

The generator's [`route.ts`](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/blob/341afb0d9aa9d837cb58b9c802d89ac105a42a6c/src/app/api/generate/route.ts) first validates that a request is visual, detects relevant motion-design skills and then streams a React component. Its system contract puts text, colors, timing and layout into constants so the returned source is deliberately editable rather than merely executable.

The current component source is held in the browser workspace. A visible code editor and Remotion Player project it immediately. [`compiler.ts`](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/blob/341afb0d9aa9d837cb58b9c802d89ac105a42a6c/src/remotion/compiler.ts) transforms generated TSX in-browser and injects the bounded Remotion APIs required by the preview.

## Follow-up generation preserves direct edits

The application records whether the user has changed code after generation. Follow-up requests send the current source and recent conversation back to the API; small changes return exact search-and-replace operations and larger changes return full source. Ambiguous or missing edit targets fail rather than being applied heuristically. The generation prompt explicitly requires manual edits to be preserved unless the user asks to change them.

This creates a real convergence loop:

`prompt → React source → live preview → direct source edit or targeted AI edit → same preview`

The chat history retains code snapshots for the current browser session, but it is not a durable branch or version system.

## Render delivery is another execution of the code

The same source and composition settings can be sent through [`renderMediaOnLambda`](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/blob/341afb0d9aa9d837cb58b9c802d89ac105a42a6c/src/app/api/lambda/render/route.ts), polled and downloaded as a video. The render is a derivative of the editable code rather than a new authority.

## Persistence and trust boundary

The pinned starter has no user accounts, project database or durable browser persistence. Refreshing the workspace can lose the current code and conversation unless a deployer adds storage or the user copies the source. Generated code also executes inside the preview's supplied runtime, so a production host must treat generation and dependency exposure as a security boundary. These limits distinguish the project from Remotion itself and from a mature hosted design service.

## Evidence

- [Pinned repository](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/tree/341afb0d9aa9d837cb58b9c802d89ac105a42a6c)
- [Conversation and manual-edit tracking](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/blob/341afb0d9aa9d837cb58b9c802d89ac105a42a6c/src/hooks/useConversationState.ts)
- [Live composition wrapper](https://github.com/remotion-dev/template-prompt-to-motion-graphics-saas/blob/341afb0d9aa9d837cb58b9c802d89ac105a42a6c/src/remotion/DynamicComp.tsx)
