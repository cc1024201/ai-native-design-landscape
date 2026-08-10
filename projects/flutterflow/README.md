# FlutterFlow

> Research status: **Seed / v0.1** · Last reviewed: **2026-08-10**

| Field | Value |
|---|---|
| Organization / team | FlutterFlow |
| Category | Visual builder with coding-agent integration |
| Status | Active |
| Source availability | Closed |

## Scope

A visual application builder that exposes project/code workflows to external coding agents while retaining a visual authoring surface.

## Technical direction

- Keeps a mature visual builder as the primary structured UI surface.
- Allows agent-produced project changes to return to the visual environment.
- Connects generated application code with visual editing rather than replacing the builder.
- Targets Flutter application projects.

## Public technical choices

- Surface: visual Flutter application builder.
- Artifact: FlutterFlow/Flutter project.
- Agent integration: CLI/project workflows for external coding agents.
- Iteration: agent edits can be inspected through the visual builder.

## Evidence boundary

This file records only this project. Undisclosed internal implementation details are left unknown rather than inferred. Cross-project comparison belongs in the repository root.

## Primary sources

- https://docs.flutterflow.io/flutterflow-cli/build/
- https://www.flutterflow.io/
