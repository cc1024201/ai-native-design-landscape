# Bedrock Image MCP Server

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-13**

Bedrock Image MCP Server exposes Amazon and Stability image models as a visual asset workbench for coding agents. It is the community-maintained successor named by the retired AWS Nova Canvas MCP documentation.

## The interface is a typed family of image operations

Pinned revision: `426bf1a5f0c34341beeda100b221e891d71ea740`.

The MCP surface separates text-to-image generation from image-to-image transformation, inpainting and outpainting, search-and-replace, recoloring, background replacement or removal, structure/style control and creative upscaling. Typed parameters make intent, source image, mask or control image, output format and model-specific constraints explicit to the agent.

## Workspace files are artifact authority

Tools require the agent to pass the current IDE workspace directory and return `file://` paths for saved outputs. Each transformation creates a new raster asset rather than mutating an invisible service project. Iteration is consequently a file lineage coordinated by the calling agent; the MCP server itself supplies neither a canvas document nor a version graph.

## Model plurality does not imply one common capability

Nova Canvas, Stable Image and SD3.5 adapters have different accepted formats, control modes and editing features. The server normalizes their responses and storage, but preserves those capability boundaries in separate tools and Pydantic models rather than pretending all providers are interchangeable.

## Successor provenance and evidence ceiling

The retired AWS MCP page points to this repository for image generation. Source inspection confirms the callable surface and file-output behavior; it does not establish an end-user gallery, collaboration layer or hosted persistence, because those belong to whichever agent host invokes the server.

## Pinned evidence

- [Repository](https://github.com/kalleeh/bedrock-image-mcp-server)
- [MCP tool surface and workspace delivery](https://github.com/kalleeh/bedrock-image-mcp-server/blob/426bf1a5f0c34341beeda100b221e891d71ea740/awslabs/bedrock_image_mcp_server/server.py)
- [Nova Canvas service adapter](https://github.com/kalleeh/bedrock-image-mcp-server/blob/426bf1a5f0c34341beeda100b221e891d71ea740/awslabs/bedrock_image_mcp_server/services/nova_canvas.py)
- [Stability edit operations](https://github.com/kalleeh/bedrock-image-mcp-server/blob/426bf1a5f0c34341beeda100b221e891d71ea740/awslabs/bedrock_image_mcp_server/services/stability_edit.py)
- [Shared image path utilities](https://github.com/kalleeh/bedrock-image-mcp-server/blob/426bf1a5f0c34341beeda100b221e891d71ea740/awslabs/bedrock_image_mcp_server/utils/image_utils.py)
- [Deprecated AWS MCP migration notice](https://github.com/awslabs/mcp/blob/main/src/nova-canvas-mcp-server/README.md)
