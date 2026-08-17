# Context Space

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Context Space treats application design as a human-approved stream of file operations. A CopilotKit client sends a brief to an AG-UI agent, renders the proposed plan for approval, executes model-requested writes in the browser, and continuously projects the resulting React files into an iframe.

## Approval precedes mutation

Pinned revision: `c6dff37583f02af6e520798ed2dfdf6423ac9438`.

The backend exposes `proposePlan`, `writeFile` and `deleteFile` as model tools but deliberately does not execute the file tools itself. CopilotKit relays them to registered frontend handlers. `proposePlan` pauses for approve or request-changes input; only after approval does `writeFile` mutate the Zustand project store. This makes the UI—not the language model or FastAPI process—the immediate source writer.

Each write appends a before/after edit record. Restore rebuilds the complete file map by replaying edits through a selected index. Zustand persists the current files and edit log in localStorage, while transient preview state is excluded.

## The live evidence path is a Babel document, not WebContainer

The current repository has moved beyond its stale phase checklist but has not implemented the advertised WebContainer path. `useLivePreview` turns the file map into a generated HTML document using Babel and esm.sh, then loads it through iframe `srcDoc`. Runtime errors return through `postMessage` and can be sent back as a synthetic user message for correction. This supports a genuine build-and-repair loop for the supported React subset without npm installation or a general Node runtime.

## Durable projects and edit history have different authorities

FastAPI proxies complete project files, chat messages, thread id and usage data into PocketBase, enabling project switching and cross-device recovery. GitHub publication creates or updates a repository from the saved file map and records its URL. The fine-grained edit log is only browser-local, however: loading a PocketBase project resets that log. A recovered project therefore preserves current source and conversation but not the local sequence used by the History panel.

## Pinned evidence

- [Repository](https://github.com/super-nived/ctx-space)
- [Approval and browser-executed file tools](https://github.com/super-nived/ctx-space/blob/c6dff37583f02af6e520798ed2dfdf6423ac9438/frontend/src/features/agent/useAgentTools.tsx)
- [File authority and replayable local edit log](https://github.com/super-nived/ctx-space/blob/c6dff37583f02af6e520798ed2dfdf6423ac9438/frontend/src/store/projectStore.ts)
- [Babel iframe preview and runtime-error relay](https://github.com/super-nived/ctx-space/blob/c6dff37583f02af6e520798ed2dfdf6423ac9438/frontend/src/features/preview/useLivePreview.ts)
- [PocketBase project contract and GitHub publication route](https://github.com/super-nived/ctx-space/blob/c6dff37583f02af6e520798ed2dfdf6423ac9438/backend/app/projects.py)
- [GitHub repository writer](https://github.com/super-nived/ctx-space/blob/c6dff37583f02af6e520798ed2dfdf6423ac9438/backend/app/github.py)
