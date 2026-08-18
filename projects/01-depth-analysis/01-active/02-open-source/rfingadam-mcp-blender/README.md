# RFingAdam mcp-blender

RFingAdam's mcp-blender answers "what is design" by refusing to own an artifact at all: it is a broad native control system for Blender, exposing [218 tools spanning modeling, materials, animation, simulation, rendering, AI-generated assets and even Microsoft Flight Simulator delivery](https://github.com/RFingAdam/mcp-blender/tree/4dd91799a492bbb297bd0f92a8a78d2df354702a). Design stays in Blender's live scene; the MCP pair is the hand that moves it.

Implementation is the decisive part. An [MCP server](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/src/mcp_blender/server.py) sends typed commands over a socket to the Blender add-on, and host-side handlers mutate the live scene for mesh editing, geometry nodes, materials and animation. What makes this more than remote control is the render–analyze–refine loop it implements as a product: a self-refinement session renders multiple angles, [feeds the viewport evidence to a local vision model, and records successive scores and changes](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/addon/blender_mcp_addon/handlers/ai.py). The agent does not generate a finished render and hand it back — it iterates inside the tool, and Blender's scene graph stays authoritative the whole time.

Text/image-to-3D backends can auto-import their results, but that import lands in the live scene rather than replacing it. There is no separate design document, no branch model, no export pipeline of its own: the scene **is** the design, and the AI is a mutation channel onto it. Persistence and authority belong to Blender. This remains independent from the separately maintained `blender-mcp-n8n` studio.

- [Pinned repository](https://github.com/RFingAdam/mcp-blender/tree/4dd91799a492bbb297bd0f92a8a78d2df354702a)
- [Host-side AI handlers](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/addon/blender_mcp_addon/handlers/ai.py)
- [Scene tools](https://github.com/RFingAdam/mcp-blender/blob/4dd91799a492bbb297bd0f92a8a78d2df354702a/src/mcp_blender/tools/scene.py)
