# FigCraft

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

FigCraft frames image and video production as a coding-agent-like job running in a local visual workspace.

## Task graph rather than one model call

The agent can analyze references break a brief into dependent subtasks choose generation and editing tools compare intermediate results and continue until a set is delivered. Plan mode exposes the proposed work before execution. Tasks may be paused and resumed and the agent can call local file operations network research and media utilities such as `ffmpeg` rather than treating every result as a single opaque generation.

The canvas carries generated outputs as editable layer projects. Reference indices help preserve a person or product across a batch. The visible result can be inspected then refined through inpainting background removal image-to-image generation layout changes or video continuation.

```text
brief + local references
  -> explicit task plan and dependencies
  -> model and utility tool calls
  -> layers placed in the local canvas project
  -> inspect correct batch and export
```

## Authority and persistence

The local workspace and its layer graph are the continuing creative artifact; exported images and videos are delivery files. First-party docs establish local file access and project continuation but do not disclose the serialized layer schema exact model-routing policy or version-control format.

The operating entity is QINAXIS TECHNOLOGY GROUP LIMITED. Its privacy policy gives a Guangdong address and says account data is stored in China. Region is recorded from that first-party legal page rather than inferred from the Chinese interface.

## Primary evidence

- [FigCraft product and live demonstration](https://figcraft.ai/)
- [FigCraft agent documentation](https://figcraft.ai/docs/)
- [FigCraft privacy and operating entity](https://figcraft.ai/privacy/)
