# AI Creative Studio

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

AI Creative Studio defines “design” as coordination of a campaign package across remote specialists. It produces market framing, social copy, image concepts and generation prompts, critique, revisions and a delivery timeline. It does not render the proposed images or expose a visual editor, so its qualifying visual artifact is the reviewed campaign specification rather than finished media.

## A2A is the agent boundary

The [`Creative Director`](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/blob/1b2197eccccfafd3d12aca21f96bbc38ef181aac/agents/creative_director/agent.py) runs on Google's Agent Development Kit and wraps independently deployed Brand Strategist, Copywriter, Designer, Critic and Project Manager services as remote A2A agents. It plans before delegation, passes earlier outputs explicitly because remote agents do not inherit the conversation, waits for actual tool results and stops the chain on an ambiguous failure.

The architecture can invoke one specialist for a narrow task or sequence the full campaign. Context compaction summarizes older agent events after long runs while retaining the most recent result.

## Visual work is an implementation-ready concept package

The [`Designer agent`](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/blob/1b2197eccccfafd3d12aca21f96bbc38ef181aac/agents/designer/agent.py) specifies composition, subjects, lighting, palette, typography treatment and an image-generation prompt for each post. Those descriptions can direct a later image model or human production step, but the pinned system has no such rendering tool and should not be counted as a raster or native-canvas authoring implementation.

## Critique routes work back to its owner

[`critic/agent.py`](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/blob/1b2197eccccfafd3d12aca21f96bbc38ef181aac/agents/critic/agent.py) scores posts and visuals separately and emits explicit approval or revision status. The orchestrator can send copy feedback back to the Copywriter and visual feedback back to the Designer, with a bounded revision count to avoid an unending loop.

The Project Manager always produces a text plan and can additionally persist projects and tasks through Notion MCP in [`project_manager/agent.py`](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/blob/1b2197eccccfafd3d12aca21f96bbc38ef181aac/agents/project_manager/agent.py). Notion is delivery coordination, not the authority for visual content. ADK sessions and A2A event streams carry the working run; the source does not establish a branchable campaign document, direct manipulation or durable image lineage.

## Evidence

- [Pinned repository](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/tree/1b2197eccccfafd3d12aca21f96bbc38ef181aac)
- [Revision workflow contract](https://github.com/Saoussen-CH/ai-creative-studio-adk-a2a-mcp-vertexai-cloudrun/blob/1b2197eccccfafd3d12aca21f96bbc38ef181aac/docs/REVISION_WORKFLOW.md)
