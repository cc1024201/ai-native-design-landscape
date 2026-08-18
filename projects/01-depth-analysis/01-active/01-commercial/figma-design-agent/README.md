# Figma Design Agent

Figma Design Agent's answer is that design is a shared file's native layers — the agent does not produce imagery on top of the canvas but creates and edits the layers themselves, and "done" means the result is manipulable by the same tools and collaborators as any ordinary Figma layer. It lives in Figma Design, needs edit access, and deposits results in that same file.

The decisive mechanism is that the Agent operates directly on the host graph. It plans and performs native layer edits using the file's real components, variables, tokens and styles; connects libraries as context; resolves `@`-mentions of components, variables and styles; and can apply design-system conventions in bulk. The loop is selection → prompt → native edit → review on the shared canvas → manual manipulation, continue thread, undo or branch by duplication. The AI output is the working artifact, not a preview behind provider-managed source.

Several clocks stay deliberately separate. Prompt execution is transient run state; the chat thread is a collaborative conversation associated with the file (visible by default to full-seat editors since 2026-06-23); native layers are the working design state; chat undo is operation recovery; and file version history is the durable checkpoint system. Parallel prompts read as exploration in space — separate frames, no formal merge graph — and promotion is spatial and human-mediated.

There is a clean governance boundary on authority: the agent may draw from a connected library but never publishes assets into a shared library autonomously — a person performs that publication step. The June 2026 code-on-canvas work adds interactive React-based code layers as a second authority connected by explicit materialization steps (build with code, extract designs, explicit update, explicit push) — not universal live sync. The built-in agent is deliberately kept separate from the MCP server, and First Draft is treated as its predecessor. Closed source means the model routing, plan representation and layer-operation protocol stay undisclosed.

- [Figma AI Design Agent product page](https://www.figma.com/solutions/ai-design-agent/)
- [Work with the Figma agent in design files](https://help.figma.com/hc/en-us/articles/37998629035799-Work-with-the-Figma-agent-in-design-files)
- [Figma Design Agent launch](https://www.figma.com/blog/the-figma-agent-is-here/)
- [Custom tools, context and skills update](https://www.figma.com/blog/agent-custom-tools-context-skills/)
- [Code on the Figma canvas](https://www.figma.com/blog/code-on-the-figma-canvas/)
