# OpenMontage

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

OpenMontage defines AI video production as a governed filesystem pipeline. It does not hide the work behind one prompt: research, proposal, script, scene plan, assets, edit decisions, composition and review remain inspectable project artifacts.

## The storyboard is a gate over production state

Each of twelve pipeline manifests declares stages, allowed tools, required artifacts and success criteria. Stage-specific director skills instruct the host coding agent; Python supplies execution and persistence. [`pipeline_loader.py`](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/pipeline_loader.py) validates the selected workflow and [`checkpoint.py`](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/checkpoint.py) records resumable state.

```text
idea -> research -> proposal approval -> script/scene plan
-> generated or retrieved asset takes -> Backlot contact-sheet approval
-> action timeline + locked renderer -> compose
-> ffprobe/frame/audio/promise review -> final video
```

Backlot derives a living board from project files and pauses at creative gates. The user can compare scene takes, prompts, costs and quality scores before expensive composition. A `render_runtime` decision is locked into edit state so an agent cannot silently swap Remotion and HyperFrames. The delivery-promise check blocks a render whose motion/source mix contradicts the approved proposal; post-render review blocks black frames, audio failures and missing subtitles.

Project manifests, scripts, timelines, assets, checkpoints and decision logs jointly form production authority. The MP4 is the final delivery projection, not the only recoverable state. This is versionable and auditable, though direct timeline editing occurs through files and agent tools rather than a conventional NLE canvas.

The project is AGPL-3.0 licensed. The maintainer profile reports Seattle, United States.

## Decisive evidence

- [Pinned repository](https://github.com/calesthio/OpenMontage/tree/4eab34c5cfcccaa4f1970554928feccce73ee930)
- [Pipeline manifests](https://github.com/calesthio/OpenMontage/tree/4eab34c5cfcccaa4f1970554928feccce73ee930/pipeline_defs)
- [Action-timeline schema](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/schemas/artifacts/action_timeline.schema.json)
- [Backlot state derivation](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/backlot/state.py)
- [Delivery-promise gate](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/delivery_promise.py)
- [AGPL-3.0 license](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/LICENSE)
