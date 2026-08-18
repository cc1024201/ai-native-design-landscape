# LightLang AI Workflow Builder

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

LightLang AI Workflow Builder is a deliberately small form-based workflow surface. Instead of a node canvas, it makes an ordered list of editable prompt programs the artifact and streams each real model result into the same page.

## The workflow is a sequence of prompt templates

[streamlit_app.py](https://github.com/reasonmethis/lightlang-showcase/blob/25e9ffc66552d887b5a1c915ce39945d766ebcc8/streamlit_app.py) lets a user add, revise, delete and reorder-by-construction task prompts in Streamlit session state. Templates explicitly reference `input_text` and earlier task output, making composition visible without introducing an ornamental graph.

## Execution uses the same list

On Run, the application passes that list to LightLang's `SequentialWorkflow` with a configured OpenAI model and streams task lifecycle events and output tokens back into the result pane. The edited artifact is therefore the runtime input; there is no parallel hidden recipe behind the UI.

## Scope is intentionally local and temporary

The product has no saved workflow ID, version history, branching graph, deployment endpoint or run archive. Session state is lost with the browser process. It qualifies as an interactive AI workflow authoring surface, but its authority ends at the current Streamlit session, which is why the record remains `active-transition`.

## Pinned evidence

- [Repository](https://github.com/reasonmethis/lightlang-showcase)
- [Inspected tree](https://github.com/reasonmethis/lightlang-showcase/tree/25e9ffc66552d887b5a1c915ce39945d766ebcc8)
- [Product instructions](https://github.com/reasonmethis/lightlang-showcase/blob/25e9ffc66552d887b5a1c915ce39945d766ebcc8/README.md)
