# CoderX

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

CoderX is a local AI website builder whose model output is an executable action stream. File actions write into WebContainer, shell actions run in the same workspace, and the workbench derives its editor, terminal and preview from that filesystem. An optional Python pipeline searches public repositories for reusable context before generation.

## Artifact tags become ordered side effects

Pinned revision: `286ffdd1b50582c48addc1d079117e3684e2644a`.

The chat endpoint streams model output under a CoderX-specific artifact protocol. `StreamingMessageParser` recognizes artifact boundaries and file or shell actions as text arrives. `ActionRunner` queues them in order, writes complete file contents, normalizes a small set of obsolete dependencies and executes commands through WebContainer's shell. The file watcher then feeds the same filesystem into CodeMirror and the preview selector.

Manual editor saves write back to WebContainer and record the pre-edit content so the next user message can tell the model what changed. Runtime and human edits therefore converge on one source authority rather than living in detached panes.

## Repository mining is context not authority

The optional FastAPI agent plans a requested product, searches and ranks GitHub repositories, clones selected sources and extracts a component registry. The Remix chat route serializes that output as extra prompt context. It does not silently import those repositories as the active project, so generated WebContainer files remain the artifact the user is actually designing.

## “Projects” and “sharing” are browser-scoped facades

Supplemental project and gallery services serialize complete file maps to localStorage. Their share ids resolve only within the same browser profile; there is no remote share service behind the public-looking route. The live WebContainer state and saved project records also require an explicit save path to converge. CoderX therefore has a functional local creation and preview loop, but cross-device persistence, public sharing and claimed one-click deployment are not established by this revision.

## Pinned evidence

- [Repository](https://github.com/Narayaaana11/CoderX)
- [Streaming artifact protocol](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/lib/runtime/message-parser.ts)
- [Ordered WebContainer file and shell execution](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/lib/runtime/action-runner.ts)
- [Filesystem watcher and manual edit tracking](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/lib/stores/files.ts)
- [Chat stream and optional agent context](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/routes/api.chat.ts)
- [GitHub context pipeline](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/agent/agent/github_agent.py)
- [Browser-local project store](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/services/projects-api.ts)
- [Device-local share facade](https://github.com/Narayaaana11/CoderX/blob/286ffdd1b50582c48addc1d079117e3684e2644a/app/services/share.ts)
