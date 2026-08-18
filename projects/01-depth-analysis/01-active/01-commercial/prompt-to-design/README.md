# Prompt.to.design

Prompt.to.design answers "what is design" by locating it inside the Figma
document a person already has open, and by treating the AI's output as
provisional until the human decides to commit. Design is not the generated
picture; it is the native, editable file that the assistant only produces on
request. The whole product is built around that split between generation and
materialization.

The decisive mechanism is the **result panel as a holding pen** rather than a
live canvas. A prompt, selected frame, region or style first resolves into a
scrollable preview with analysis, summary, history, feedback and refinement
controls — none of which touches the design file. The model's output is
authored and re-runnable outside Figma's authority. Only an explicit
**Import to Figma** turns that candidate into editable frames, Auto Layout,
text layers and components; that is the single point where the AI's answer
becomes the user's document.
[Evidence: generation result and Figma import](https://docs.superun.ai/prompt-to-design/features/modify-elements)

The product is not one unbounded prompt-to-page tool but a family of
**bounded mutations** that each set their own intent boundary. **Smart Fill**
inserts a new region inside a selected frame while leaving the rest
untouched; **Frame Redesign** changes the visual language of a layout while
preserving its structure; Style Transfer, Region Design and template remix
each constrain what the model is allowed to move. These narrower operations
imply the agent reasons about structural preservation, yet the closed
implementation never reveals how it decides what to keep.
[Frame Redesign](https://docs.superun.ai/prompt-to-design/features/frame-redesign)

Prompt.to.design is coupled to Superun — results can open as a browser demo
there, and they share docs and organization — but it is counted separately
because its final authority is a native Figma file, not a managed project.
Model routing, node-mapping, prototype-link generation and history retention
are undisclosed; what is public is the contract that generation is hosted and
the document is the destination. Design lives in Figma; the assistant is the
channel into it. [Overview](https://docs.superun.ai/prompt-to-design/guide/welcome)
