# AI Game LaunchPad

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Game LaunchPad turns a prompt into a playable browser game while keeping generation inside a bounded runtime vocabulary.

## The model produces configuration, not arbitrary game code

Generated output is parsed into a validated game configuration and assigned to known Canvas or WebGL templates. Image models can supply sprite assets, but runtime behavior comes from registered templates and fields.

## Play and correction are separate surfaces

The generated prototype runs immediately, while an editor changes the structured configuration. `GameVersion` snapshots can be restored, preserving an explicit correction history around the playable artifact.

## Product delivery extends beyond the studio

Workflow and run records coordinate the creation stages; published launch pages add leaderboards and reviews. The workflow surface is primarily an ordered template system, not an unrestricted node-graph programming environment.

## Pinned evidence

- Repository: [oplooins/ai-game-launchpad](https://github.com/oplooins/ai-game-launchpad)
- Inspected generation schema, bounded runtime templates, game editor, version restore, workflow records, publishing, and community features: [`9cae633fb742fd1418e68d71bea390b3686c6dfa`](https://github.com/oplooins/ai-game-launchpad/tree/9cae633fb742fd1418e68d71bea390b3686c6dfa)
- Immutable revision: [commit `9cae633`](https://github.com/oplooins/ai-game-launchpad/commit/9cae633fb742fd1418e68d71bea390b3686c6dfa)
