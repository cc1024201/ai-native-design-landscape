# Drupal Canvas

Drupal Canvas defines design as composing reusable components into structured page entities — and its hidden **Canvas AI** submodule adds agents to that same component-and-entity authority rather than inventing a parallel design document. Design is what you edit, and the AI works inside that definition.

## The page is a structured component tree, owned by Drupal

The editor composes server and JavaScript components into Canvas page entities and structured-content templates. Autosave, draft rendering, entity revisions, permissions, translation, personalization and publication all remain Drupal concerns — the CMS's revision and workflow machinery, not model-session state, is what makes a page durable and shippable.

## AI mutates through explicit host tools

Configured orchestrator, page-builder, component, template, metadata and title [agents](https://www.drupal.org/project/canvas) call functions to inspect layout and entity context, place or edit components, create field content, change page values and verify completion — constrained by props schemas and the component catalog. The agents write through the page and component model; they do not hold their own artifact between turns.

## One tree serves visual and headless delivery

The same stored component tree drives both the browser editor and published rendering, with headless packages projecting it into supported frontend frameworks. Because Canvas AI operates through the editor's own mutations, there is no fork between what a person builds visually and what ships — design, revisioning, translation and delivery converge on one entity model. [Source](https://git.drupalcode.org/project/canvas) · [commit `1b9b5ed`](https://git.drupalcode.org/project/canvas/-/commit/1b9b5eddee83e5347f2dad8aafc43109e7634aa9)
