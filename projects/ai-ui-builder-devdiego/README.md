# AI UI Builder by Diego Perez

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This builder treats generated React source as something that must pass a governance boundary before it becomes a visual artifact. Its project history distinguishes a modification from a new iteration instead of flattening every model call into one chat transcript.

## Model output enters a repair gate

[`ai.service.ts`](https://github.com/devDiego98/AI-Site-Generator/blob/8f2fcf593c1d327065225189f82682ffbbf1ddb4/backend/src/ai/ai.service.ts) supports Anthropic and several OpenAI-compatible providers and gives generation and modification different prompt paths. It extracts and normalizes returned source, validates whether that source can form the expected UI, and invokes [`ai-ui-fix-loop.ts`](https://github.com/devDiego98/AI-Site-Generator/blob/8f2fcf593c1d327065225189f82682ffbbf1ddb4/backend/src/ai/utils/ai-ui-fix-loop.ts) for bounded model repair attempts. Invalid prose is therefore not promoted directly into the workspace.

## Iterations and versions mean different things

[`useBuilderState.ts`](https://github.com/devDiego98/AI-Site-Generator/blob/8f2fcf593c1d327065225189f82682ffbbf1ddb4/frontend/src/hooks/useBuilderState.ts) creates a project and first iteration on initial generation, appends modifications as versions within that iteration, and starts a new iteration for regeneration. Historical versions remain selectable. [`projectStorage.ts`](https://github.com/devDiego98/AI-Site-Generator/blob/8f2fcf593c1d327065225189f82682ffbbf1ddb4/frontend/src/utils/projectStorage.ts) serializes that nested graph into localStorage and migrates an earlier flat version shape.

## Preview is isolated but local

[`PreviewFrame.tsx`](https://github.com/devDiego98/AI-Site-Generator/blob/8f2fcf593c1d327065225189f82682ffbbf1ddb4/frontend/src/organisms/PreviewFrame/PreviewFrame.tsx) renders the prepared document in a script-only sandbox and relays runtime errors to the parent workspace. Projects and history survive browser reloads but have no server synchronization or collaborative authority in the inspected source.

## Evidence

- [Canonical repository](https://github.com/devDiego98/AI-Site-Generator)
- [Inspected tree](https://github.com/devDiego98/AI-Site-Generator/tree/8f2fcf593c1d327065225189f82682ffbbf1ddb4)
- Commit: `8f2fcf593c1d327065225189f82682ffbbf1ddb4`
