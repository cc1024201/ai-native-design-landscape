# Seko

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Seko is SenseTime's AI video workspace for moving from an idea to a structured story, visual assets, storyboard and final timeline. It exposes subjects and scenes as reusable project entities rather than regenerating every shot from an isolated prompt.

## Story planning, generation canvas and edit timeline are different stages

The [first-party application](https://seko.sensetime.com/) exposes synopsis, outline, art style, subject and scene lists, storyboard scripts and explicit outline confirmation. Storyboard edits can remain unsaved, be undone or redone, and every modification instruction can enter generation history. Image edits are applied back to a selected storyboard frame; a finished plan can be copied when later structural changes would otherwise invalidate generated video.

Seko then offers two distinct visual authorities: Canvas mode connects prompt, image, video and audio nodes into a workflow; Editor mode places shots and audio on a timeline, supports replacement or insertion and previews final pacing. This is a managed project graph with candidate history and promotion, not a one-shot media endpoint. [SenseTime's product directory](https://www.sensetime.com/cn/) independently identifies Seko as its multimodal short-video creation platform. The public application bundle supports this architecture, but its backend persistence and generation implementation remain closed.

## Evidence

- [Seko product](https://seko.sensetime.com/)
- [SenseTime product directory](https://www.sensetime.com/cn/)
- [First-party application contract reviewed on 2026-08-12](https://seko.sensetime.com/assets/index-DbTwB1Lb.js)
