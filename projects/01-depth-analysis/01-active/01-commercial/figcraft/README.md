# FigCraft

**What is design.** FigCraft frames design as a *coding-agent-like job* running in a local visual workspace, not as a single model generation and not as a static canvas. Design is the act of decomposing a brief into dependent subtasks, choosing generation and editing tools, comparing intermediate results and continuing until a set is delivered. The continuing artifact is the local layer-graph project: outputs are placed as editable layer projects in a canvas, and design persists as that project plus its reference indices, which help preserve a person or product across a batch.

**How it is implemented.** The mechanism is a task graph in front of model and utility calls. Plan mode exposes the proposed work and its dependencies before execution, tasks can be paused and resumed, and the agent can call local file operations, network research and media utilities such as `ffmpeg`—so a result is not a single opaque call but a traced sequence.

The canvas holds generated outputs as editable layer projects, and refinement routes through concrete operations: inpainting, background removal, image-to-image generation, layout changes and video continuation. The visible result is inspected, corrected and then exported as delivery files (images, video), while the local workspace and its layer graph remain the continuing authority.

The operating entity is QINAXIS TECHNOLOGY GROUP LIMITED, whose privacy policy gives a Guangdong address and states account data is stored in China. First-party docs establish local file access and project continuation without disclosing the serialized layer schema, exact model-routing policy or version-control format—so the inspection loop and local persistence are established at product level, while the internal representation stays closed.

[Evidence: FigCraft product and live demonstration](https://figcraft.ai/) · [FigCraft agent documentation](https://figcraft.ai/docs/) · [FigCraft privacy and operating entity](https://figcraft.ai/privacy/)
