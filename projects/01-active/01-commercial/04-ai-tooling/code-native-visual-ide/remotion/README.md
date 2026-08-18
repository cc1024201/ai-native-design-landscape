# Remotion

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Remotion now describes itself as “video tools for the agent era.” It is not a prompt-to-video model and not merely a React rendering library: the current repository connects agent guidance, a code-aware visual Studio and deterministic video rendering around one React composition.

## The video source is the authority

A Remotion project expresses frames, timing, assets and parameters as React source. [`<Composition>`](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/core/src/Composition.tsx) registers the renderable entry point and its dimensions, frame rate, duration and schema. Preview and final render both execute that source, so there is no separate proprietary canvas document that must later be translated back into code.

This makes the artifact loop unusually direct:

`agent edits React → Studio evaluates the composition → user inspects or directly adjusts it → renderer executes the same composition`

## Agent skills make source visually operable

The official [`remotion-create` skill](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/skills/skills/remotion-create/SKILL.md) tells an external coding agent how to scaffold a project, author compositions and open Studio for review. The broader [best-practices router](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/skills/skills/remotion-best-practices/SKILL.md) dispatches to artifact-specific guidance for captions, media, maps, interactivity and rendering while requiring preservation of user changes.

These skills do not own a project database or run a hidden design agent. The CLI installs and updates them; the selected coding-agent runtime edits the user's repository. Remotion contributes the artifact grammar, preview environment and render engine.

## Studio closes the direct-edit loop through constrained source mapping

The current [`remotion-interactivity` contract](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/skills/skills/remotion-interactivity/SKILL.md) defines source patterns that Studio can recognize as selectable and draggable elements. Position, size, rotation and keyframe changes can be written back into compatible inline React style and sequence props. The write path is visible in Studio's [`save-sequence-prop.ts`](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/studio/src/components/Timeline/save-sequence-prop.ts) and its queued update machinery.

This is not arbitrary round-trip editing of every possible React program. Visual writeback depends on AST-friendly structure. Unsupported abstractions remain editable in code and visible in preview but are outside the direct manipulation contract.

## Rendering and versioning stay downstream of source

Studio, browser Studio, CLI rendering and serverless render packages are execution surfaces of the same composition model. Output video and stills are derivatives; the durable editable artifact remains source plus assets. Remotion does not impose provider-owned design history: filesystem history and Git remain the recovery and collaboration layer unless a host application adds another one.

## Product identity boundary

Agent Skills, Studio, Browser Studio and render infrastructure are components and interfaces of Remotion rather than separately counted products. They share the same composition authority and move one artifact through creation, inspection, direct correction and delivery.

## Evidence

- [Pinned repository](https://github.com/remotion-dev/remotion/tree/ec1d45e41d1ad554758430a9bdc2f53a1c270c93)
- [Official skills package](https://github.com/remotion-dev/remotion/tree/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/skills)
- [Browser Studio source write path](https://github.com/remotion-dev/remotion/blob/ec1d45e41d1ad554758430a9bdc2f53a1c270c93/packages/browser-studio/src/save-sequence-props.ts)
