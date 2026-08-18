# Bolt.new

Bolt.new treats design as inseparable from product delivery: prompts, files, templates, Figma frames and GitHub repositories are all entry points, and the destination is a complete, publishable JavaScript application. The implementation is a "many-clocks" structure — project code, chat, design-system revision, database records, Git branch, development preview and published site each advance on a separate clock, with no public operation restoring them as one transaction. [Product lifecycle](https://support.bolt.new/get-started/project-lifecycle)

## The Design System Agent compiles context, not truth

The distinctive mechanism is that team-owned component code and docs are ingested into a generated, browse-only Storybook, and the one active team-wide revision becomes agent context before generation. Sync pulls live sources and identifies changes instead of regenerating; switching the revision is team-global and does not rewrite existing code until a later agent request. The generation is grounded by compiled component context, not a deterministic component compiler with guaranteed conformance. [Design system introduction](https://support.bolt.new/building/design-system/introduction)

## The artifact lives in a browser runtime

In Chromium a WebContainer runs the development projection on the device; on Safari it is a hosted preview with read-only Code View. Since the code-storage migration, durable project storage is no longer the temporary browser filesystem even though execution still is. Publish is an explicit promotion: source changes are not live until **Update** is pressed, and Bolt Database sits outside the code-version ledger.

## The historical baseline is v1

The public `stackblitz/bolt.new` tree at [`eda10b1`](https://github.com/stackblitz/bolt.new/tree/eda10b121221b30825a4c16eec5da1fd3eb1eb99) is the 2024 v1 implementation: the model emits `<boltArtifact>`/`<boltAction>` string tags that a parser replays into the WebContainer, with recovery as chat replay rather than file persistence. It is valuable execution grammar, not a proxy for the closed 2026 core. [bolt.new](https://bolt.new/)
