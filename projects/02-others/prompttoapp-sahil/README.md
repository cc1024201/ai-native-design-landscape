# PromptToApp by Sahil Tanwani

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

PromptToApp is a two-repository Lovable-style builder whose distinctive authority is a server-owned project file set. Chat tools read and write those files, the frontend streams file events, and a Kubernetes runner produces a temporary preview. It is unrelated to the separately counted `prompttoapp.dev` product unless future identity evidence establishes a connection.

## Tool writes, not prose, mutate the project

Backend revision: `aa5a18ab318c271cecb2a94891abd6be0f2efb80`. Frontend revision: `5a94d670cc3c99636bdb48e32d2b1ba99d10d570`.

Spring AI tools receive a project id and perform explicit file reads or writes through `ProjectFileService`. Chat messages and tool events are persisted separately. The browser listens to the stream, marks affected paths and reloads the server-owned file content. This makes a text answer and an applied source change distinguishable events.

## Preview is an expiring deployment

The backend claims an idle Kubernetes pod, mirrors the project's object-storage directory into `/app`, installs dependencies, starts a Vite server and registers a six-hour route. The frontend stores the returned preview URL locally and renders it in a sandboxed iframe. Preview availability is therefore temporary runtime evidence, not a durable release record.

## Collaboration and editing limits

Project roles distinguish viewers, editors and owners, and ZIP download provides a portable copy. The inspected frontend CodeMirror instance is explicitly `editable={false}`: source is inspectable, but normal mutation flows through the agent tools rather than direct typing. No version-restore ledger was found.

## Pinned evidence

- [Backend repository](https://github.com/SahilTanwani/PromptToAppBackend)
- [Agent file tools](https://github.com/SahilTanwani/PromptToAppBackend/blob/aa5a18ab318c271cecb2a94891abd6be0f2efb80/src/main/java/lovable_clone/llm/tools/CodeGenerationTools.java)
- [Kubernetes preview service](https://github.com/SahilTanwani/PromptToAppBackend/blob/aa5a18ab318c271cecb2a94891abd6be0f2efb80/src/main/java/lovable_clone/service/impl/KubernetesDeploymentServiceImpl.java)
- [Frontend project workspace](https://github.com/SahilTanwani/PromptToAppFrontend/blob/5a94d670cc3c99636bdb48e32d2b1ba99d10d570/src/pages/ProjectView.tsx)
- [Read-only source pane](https://github.com/SahilTanwani/PromptToAppFrontend/blob/5a94d670cc3c99636bdb48e32d2b1ba99d10d570/src/components/CodeEditor.tsx)
