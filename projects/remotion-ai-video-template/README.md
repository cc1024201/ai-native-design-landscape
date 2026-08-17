# Remotion AI Video Template

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Remotion AI Video Template is a CLI-first project for producing narrated vertical stories. It is counted separately from the Remotion framework because it owns a complete AI generation pipeline and a concrete timeline schema; Remotion supplies its preview and rendering substrate.

## Generation materializes a project directory

The CLI asks for a title and topic, uses OpenAI to generate the story and scene descriptions, creates an image per scene and asks ElevenLabs for voice audio with character timestamps. [`cli.ts`](https://github.com/remotion-dev/template-prompt-to-video/blob/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876/cli/cli.ts) writes the resulting descriptor, images, audio and `timeline.json` beneath `public/content/<story>/`.

There is no hidden hosted story record. The directory is the durable project and can be inspected, edited, copied or versioned before rendering.

## Timeline JSON is the composition authority

[`timeline.ts`](https://github.com/remotion-dev/template-prompt-to-video/blob/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876/cli/timeline.ts) deterministically converts narration timestamps into background, text and audio intervals with transitions and animation parameters. The timeline is more than generation metadata: it is the structured editable input consumed by the video composition.

[`AIVideo.tsx`](https://github.com/remotion-dev/template-prompt-to-video/blob/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876/src/components/AIVideo.tsx) maps those elements into Remotion sequences. `Root.tsx` discovers every saved timeline and exposes it as a previewable and renderable composition. Users refine the generated result by editing timeline data, assets or React components and then inspecting the same project in Studio.

## The product is a pipeline rather than an interactive agent

Generation is a one-way CLI run; the source does not provide conversational revision, direct canvas manipulation, parallel candidates or automatic acceptance checks. Its complete loop is nevertheless Design-relevant: AI creates a structured audiovisual project, the user can edit the native files, Remotion projects them and the renderer produces the delivery.

Filesystem and Git provide history. Regeneration can create or overwrite material within a story directory, so recoverability depends on ordinary file-versioning discipline rather than a built-in version service.

## Evidence

- [Pinned repository](https://github.com/remotion-dev/template-prompt-to-video/tree/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876)
- [OpenAI and ElevenLabs generation service](https://github.com/remotion-dev/template-prompt-to-video/blob/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876/cli/service.ts)
- [Composition registration](https://github.com/remotion-dev/template-prompt-to-video/blob/27ecd9762a47aa177a5e83c6974e4c4e5e0d3876/src/Root.tsx)
