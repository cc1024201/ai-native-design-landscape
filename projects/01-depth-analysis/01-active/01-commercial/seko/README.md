# Seko

Seko's design is video as a managed project graph, not a one-shot media endpoint. Idea becomes synopsis, outline, art style, subject and scene lists, then storyboard scripts and a final outline confirmation — each stage a separate decision rather than a single prompt. Its implementation treats subjects and scenes as reusable entities: shot edits apply back to a selected storyboard frame, and every modification instruction can enter generation history.

The mechanism is the split into two visual authorities. Canvas mode connects prompt, image, video and audio nodes into a workflow graph; Editor mode places shots and audio on a timeline with replacement, insertion and pacing preview. Both draw from the same project entity graph, giving candidate history and promotion instead of regenerating each shot from an isolated prompt. A finished plan can be copied before later structural changes would invalidate generated video — an explicit invalidation boundary that keeps the plan the source of truth.

Because backend generation and persistence are closed, only the first-party application contract reveals this architecture; the public bundle supports the stage/storyboard/timeline split but not the internal graph implementation.

- [Seko product](https://seko.sensetime.com/)
- [SenseTime product directory](https://www.sensetime.com/cn/)
- [First-party application contract reviewed on 2026-08-12](https://seko.sensetime.com/assets/index-DbTwB1Lb.js)
