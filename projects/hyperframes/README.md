# HyperFrames

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

HyperFrames defines agent-native motion design as authored HTML, CSS, media and seekable browser animation that can be previewed and rendered deterministically to video. The project is not merely a video model wrapper: an agent writes an inspectable executable composition and the runtime materializes frames from it.

## The browser composition is the master

The workflow contracts in [`skills/hyperframes/SKILL.md`](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/skills/hyperframes/SKILL.md) and the core skill require a time-addressable composition. Assets and animation logic stay in the project; MP4 is a delivery projection.

```text
brief/assets -> agent plans and writes HTML motion source
             -> lint + inspect + browser preview
             -> deterministic frame production -> encoded MP4
             -> source correction -> re-render
```

The large monorepo makes those stages executable. [`producer.ts`](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/packages/cli/src/utils/producer.ts) coordinates frame production. The studio server exposes separate [preview](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/packages/studio-server/src/routes/preview.ts), [lint](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/packages/studio-server/src/routes/lint.ts) and [render](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/packages/studio-server/src/routes/render.ts) routes instead of treating a successful export as the only feedback.

## What survives export

The HTML project retains editable structure, media references and animation semantics. A rendered MP4 preserves pixels and timing but not DOM editability. This asymmetry is the decisive source-versus-delivery boundary; versioning remains ordinary filesystem and Git history rather than an evidenced hosted design graph.

The repository is Apache-2.0 licensed. HeyGen is the public organization boundary; the repository does not identify a narrower HyperFrames team region.

## Primary evidence

- [Pinned source tree](https://github.com/heygen-com/hyperframes/tree/7860d19433e45507c9544f6e6b542e7e572e47c9)
- [Project README](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/README.md)
- [Apache-2.0 license](https://github.com/heygen-com/hyperframes/blob/7860d19433e45507c9544f6e6b542e7e572e47c9/LICENSE)
