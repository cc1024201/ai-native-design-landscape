# Manim Explainer Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Manim Explainer Agent turns an educational brief into executable Manim source and then into a rendered video. It is a code-visual pipeline rather than a timeline editor: the Python scene is the recoverable working artifact, while the MP4 is a delivery projection.

## Three model stages converge on one program

The [`advanced orchestrator`](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/manim_agent/core/advanced_orchestrator.py) first develops the educational content, then asks a visual-design agent for scenes, objects, timing, colors and transitions, and finally asks a code agent to materialize that plan as Manim Python. Short jobs can prepare the visual plan and an initial code structure concurrently; longer or corrective passes run the stages sequentially.

The visual stage is not an image model. [`visual_design_agent.py`](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/manim_agent/agents/visual_design_agent.py) produces a structured animation plan. [`manim_code_agent.py`](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/manim_agent/agents/manim_code_agent.py) translates content and that plan into a complete scene program and normalizes several deprecated Manim calls.

## Rendering is an executable acceptance boundary

The API writes generated code under `generated_videos/`, invokes the Manim CLI, retries rendering up to three times and applies a small deterministic repair set for known API and color failures in [`api_server.py`](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/api_server.py). A successful run is therefore more than a text response: the program must render to an MP4 that the browser can preview and download.

The front end exposes progress from the specialist stages and a [`VideoPlayer`](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/frontend/components/VideoPlayer.tsx). Conversation history can be reinjected as context for a later request, but there is no source editor, scene-level direct manipulation or branchable version graph in the inspected UI.

## Persistence boundary

Generated `.py` and `.mp4` files survive as server files. Session metadata is held in an in-memory dictionary, so process restart does not provide a durable project index or restore chat state. The implementation returns the first generated code candidate even when its internal quality validator reports warnings; render success is real execution evidence, not proof that instructional timing or aesthetics met the plan.

## Evidence

- [Pinned repository](https://github.com/MurtazaKafka/manim-agent/tree/c4951eb0f9a0159bf95d27d690b84cd8b071c508)
- [LLM provider boundary](https://github.com/MurtazaKafka/manim-agent/blob/c4951eb0f9a0159bf95d27d690b84cd8b071c508/manim_agent/core/llm_service.py)
