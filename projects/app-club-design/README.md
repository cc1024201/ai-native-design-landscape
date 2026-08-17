# App Club Design

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

App Club Design is a compact Nuxt implementation in which an agent creates and edits mobile/desktop screens on an infinite canvas. Its authority is a project state containing screen nodes, not the assistant transcript.

## Screen nodes are shared state

[`useProjectState.ts`](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/composables/useProjectState.ts) owns the current project and screens. [`InfiniteStage.vue`](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/components/Canvas/InfiniteStage.vue) projects those screens into pan/zoom coordinates; each [`ScreenNode.vue`](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/components/Canvas/ScreenNode.vue) remains selectable and movable.

The agent path is split between [`useChatAgent.ts`](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/composables/useChatAgent.ts) and the server [design-agent tool contract](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/server/utils/designAgent.ts). Tool results add or update screen state; the renderer does not replace existing screens with one flattened answer.

## Ordinary loop

```text
prompt -> agent screen operations -> project screen nodes
       -> canvas inspection -> move/select/edit -> further prompt
```

The project is therefore distinct from a prompt-to-image demo even though it is small. It supplies a Figma-like multi-screen spatial surface and a continuing correction path.

## Boundary

Pinned commit: [`1cacdd9`](https://github.com/munonzito/design.appclub.dev/commit/1cacdd9382a3003f029ae7452bf45205b33a1a6d). No license file was present. The last source update preceded this review by months and there is no strong release history, so lifecycle is active-transition. No reliable team-region evidence was found.

## Decisive sources

- [Repository README](https://github.com/munonzito/design.appclub.dev/blob/1cacdd9382a3003f029ae7452bf45205b33a1a6d/README.md)
- [Pinned source tree](https://github.com/munonzito/design.appclub.dev/tree/1cacdd9382a3003f029ae7452bf45205b33a1a6d)
