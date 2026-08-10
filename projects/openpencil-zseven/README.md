# OpenPencil (ZSeven-W/openpencil)

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | ZSeven-W / contributors |
| Category | AI-native design editor |
| Status | Active |
| Source availability | Open source |

## Scope

A separate open-source project named OpenPencil focused on AI-native design-as-code and agent-driven live-canvas workflows.

## Technical direction

- Treats AI agents as native participants in the design editor.
- Uses a design-as-code workflow with an agent-accessible tool layer.
- Provides built-in MCP integration for external agent runtimes.
- Implements layered design workflows for skeleton, content and refinement stages.

## Public technical choices

- Core: public Rust workspace.
- Rendering/editor: custom/vendored Skia/widget stack documented in the repository.
- Agent interface: built-in MCP server.
- Surface: live visual canvas with AI/codegen integration.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://github.com/ZSeven-W/openpencil
