# ClawPhD

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ClawPhD is a research agent that turns papers into diagrams, posters, videos, structured Markdown and editable figure packs. Its Design surface is specialized for scholarly communication rather than a generic chat attachment viewer.

## Publication artifacts are revised through a human-in-the-loop run

For diagram generation, the agent assembles paper context and reference figures, produces a candidate and iterates with human feedback. Figure extraction preserves multiple representations—PNG for visual evidence, SVG and PPTX for editing, and Draw.io reconstruction where available. PDF conversion similarly retains structured text plus individually addressable figure assets.

Different deliverables keep their native authorities instead of being collapsed into one internal canvas. The agent coordinates the run and stores its outputs; editable SVG, PPTX and Draw.io files are the durable handoff artifacts.

## Evidence

- [Pinned repository](https://github.com/ZhihaoAIRobotic/ClawPhD/tree/b3bb1ed934c200f89c0e804e6e232313903b20e4)
- [Product workflow](https://github.com/ZhihaoAIRobotic/ClawPhD/blob/b3bb1ed934c200f89c0e804e6e232313903b20e4/README.md)
- [Diagram generation example](https://github.com/ZhihaoAIRobotic/ClawPhD/blob/b3bb1ed934c200f89c0e804e6e232313903b20e4/examples/diagram_generation_command.sh)
- [Tool and skill validation tests](https://github.com/ZhihaoAIRobotic/ClawPhD/blob/b3bb1ed934c200f89c0e804e6e232313903b20e4/tests/test_tool_validation.py)
