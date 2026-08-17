# ComposeFlow

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ComposeFlow is an AI-first visual editor for Compose Multiplatform applications. Unlike a prompt wrapper around source files it owns a structured cross-platform project graph that both people and the assistant can edit before the graph materializes as Kotlin source.

## AI begins with an editable application plan

The [AI assistant view model](https://github.com/ComposeFlow/ComposeFlow/blob/3347013354285e6103a9a693aff5f77b74e37912/feature/uibuilder/src/commonMain/kotlin/io/composeflow/ai/AiAssistantViewModel.kt) asks the service to derive a project name package and screen prompts. Users can rename delete or rewrite those prompts before parallel screen generation begins. Subsequent tool calls update application state screens data types resources and other project objects rather than returning only prose.

## YAML is the durable project authority

[`ProjectRepository.kt`](https://github.com/ComposeFlow/ComposeFlow/blob/3347013354285e6103a9a693aff5f77b74e37912/core/model/src/commonMain/kotlin/io/composeflow/repository/ProjectRepository.kt) serializes the complete `Project` through a local-first saver and mirrors the editing project into a platform data store. [`YamlSerializer.kt`](https://github.com/ComposeFlow/ComposeFlow/blob/3347013354285e6103a9a693aff5f77b74e37912/core/model/src/commonMain/kotlin/io/composeflow/serializer/YamlSerializer.kt) provides the polymorphic graph codec. This establishes an editable native authority rather than generated screenshots.

## Source is a materialization of the graph

Project nodes implement the [`CodeGenerator`](https://github.com/ComposeFlow/ComposeFlow/blob/3347013354285e6103a9a693aff5f77b74e37912/core/model/src/commonMain/kotlin/io/composeflow/model/CodeGenerator.kt) contract and emit Compose code through KotlinPoet wrappers. The [README](https://github.com/ComposeFlow/ComposeFlow/blob/3347013354285e6103a9a693aff5f77b74e37912/README.md) separately shows drag-and-drop editing live preview state management and project export. Visual and AI edits therefore converge on the same project graph before code generation.

## Service boundary

The open client traces the project editor mutation dispatch YAML persistence and code generation. Initial AI calls require ComposeFlow authentication and a remote service; the server implementation behind those endpoints is not established by this repository.

## Pinned evidence

- [Repository](https://github.com/ComposeFlow/ComposeFlow)
- [Inspected tree](https://github.com/ComposeFlow/ComposeFlow/tree/3347013354285e6103a9a693aff5f77b74e37912)
- Commit: `3347013354285e6103a9a693aff5f77b74e37912`
