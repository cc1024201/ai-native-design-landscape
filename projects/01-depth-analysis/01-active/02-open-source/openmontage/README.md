# OpenMontage

OpenMontage defines AI video production as a governed filesystem pipeline. It refuses the equation "one prompt in, video out": research, proposal, script, scene plan, assets, edit decisions, composition and review all remain inspectable project artifacts, and design is not a burst of creativity but a sequence of approved, versionable states.

## The storyboard is a gate over production state

Each of twelve pipeline manifests declares stages, allowed tools, required artifacts and success criteria. Stage-specific "director" skills instruct the host coding agent; Python performs execution and persistence. [`pipeline_loader.py`](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/pipeline_loader.py) validates the selected workflow and [`checkpoint.py`](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/checkpoint.py) records resumable state.

```text
idea -> research -> proposal approval -> script/scene plan
-> generated or retrieved asset takes -> contact-sheet approval
-> action timeline + locked renderer -> compose
-> ffprobe/frame/audio/promise review -> final video
```

## Creative gates sit before expensive composition

Backlot derives a living board from project files and pauses at cost-bearing decision points, letting the user compare scene takes, prompts, costs and quality scores before composition. A `render_runtime` decision is locked into edit state so an agent cannot silently swap Remotion and HyperFrames. The delivery-promise check blocks a render whose motion/source mix contradicts the approved proposal, and post-render review blocks black frames, audio failures and missing subtitles. The design act here is precisely this gating: authoring the constraints and approvals, not the frames.

Project manifests, scripts, timelines, assets, checkpoints and decision logs jointly form production authority; the MP4 is the final delivery projection, not the only recoverable state. It is versionable and auditable — though direct timeline editing happens through files and agent tools rather than a conventional NLE canvas. The project is AGPL-3.0 licensed, and the maintainer profile reports Seattle, United States. Key references: the [pinned repository](https://github.com/calesthio/OpenMontage/tree/4eab34c5cfcccaa4f1970554928feccce73ee930), its [pipeline manifests](https://github.com/calesthio/OpenMontage/tree/4eab34c5cfcccaa4f1970554928feccce73ee930/pipeline_defs), [action-timeline schema](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/schemas/artifacts/action_timeline.schema.json), [Backlot state derivation](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/backlot/state.py), [delivery-promise gate](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/lib/delivery_promise.py) and [AGPL-3.0 license](https://github.com/calesthio/OpenMontage/blob/4eab34c5cfcccaa4f1970554928feccce73ee930/LICENSE).
