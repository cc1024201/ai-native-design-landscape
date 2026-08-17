# AI Figma

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Figma is a deliberately small Drupal module that exposes live Figma structure to Drupal AI Agent tools so Canvas agents can plan against design context.

## The connector is server-side and read-only

An encrypted Key record holds a read-scoped Figma token. The client validates Figma URLs and API-base configuration before calling the REST API, avoiding a browser OAuth dependency and limiting where the secret can be sent.

## One function establishes the current boundary

`ai_figma_list_design_pages` returns top-level frames, node IDs, and their Figma canvases. An administrator adds that tool to the Canvas AI assistant, which can then plan one Drupal page per frame.

## Materialization belongs downstream

The inspected module does not itself resolve theme components or write a complete page. Drupal Canvas agents and downstream Varbase AI Figma perform those steps, so this product is counted as the context bridge rather than credited with the whole design-to-page loop.

## Pinned evidence

- Project and source: [AI Figma](https://www.drupal.org/project/ai_figma) and [GitLab repository](https://git.drupalcode.org/project/ai_figma)
- Inspected encrypted configuration, URL parsing, Figma REST client, agent function, permissions, tests, and documentation: [`aca4cf8e591e197a8d47955b44032ac76f127355`](https://git.drupalcode.org/project/ai_figma/-/tree/aca4cf8e591e197a8d47955b44032ac76f127355)
- Immutable revision: [commit `aca4cf8`](https://git.drupalcode.org/project/ai_figma/-/commit/aca4cf8e591e197a8d47955b44032ac76f127355)
