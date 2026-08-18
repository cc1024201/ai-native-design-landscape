# AI CodeTutor Video Generator

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI CodeTutor materializes a tutorial through a small scene pipeline. The LLM supplies instructional content; deterministic stages decide how that content becomes timed visual frames and a final MP4.

## Script is normalized into scene records

[`app.py`](https://github.com/PushkargithubCSE/verceti/blob/210d7a6850b0e4166adad0c93efd6ac00867e1ff/app.py) accepts a topic and sends it to local Ollama. [`scene_builder.py`](https://github.com/PushkargithubCSE/verceti/blob/210d7a6850b0e4166adad0c93efd6ac00867e1ff/services/scene_builder.py) separates explanation lines from recognized code lines and produces `{text, code}` scene records. This scene list is the intermediate authority visible in the API response.

## Audio duration controls the timeline

Each scene is narrated by offline TTS and rendered as a 1280×720 frame in [`frame_generator.py`](https://github.com/PushkargithubCSE/verceti/blob/210d7a6850b0e4166adad0c93efd6ac00867e1ff/services/frame_generator.py). [`video_builder.py`](https://github.com/PushkargithubCSE/verceti/blob/210d7a6850b0e4166adad0c93efd6ac00867e1ff/services/video_builder.py) gives every image its audio clip's duration and concatenates the clips into MP4.

## No editing contract is implied

The repository has no checked-in frontend despite documenting one and exposes no scene editor, regeneration target or version history. It qualifies as delegated visual production and delivery—not as an editable video workspace.

## Pinned evidence

- [Canonical repository](https://github.com/PushkargithubCSE/verceti)
- [Inspected tree](https://github.com/PushkargithubCSE/verceti/tree/210d7a6850b0e4166adad0c93efd6ac00867e1ff)
- Commit: `210d7a6850b0e4166adad0c93efd6ac00867e1ff`
