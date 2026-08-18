# ADA V2 by Nazir Louis

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

ADA V2 is a multimodal desktop assistant whose Design surface is voice-driven parametric CAD and fabrication. Gemini live audio, an Electron/React interface, gesture control and a Python backend let a user request a part, inspect it in Three.js, revise the prompt, slice the accepted mesh and optionally submit a printer job.

## Generated Python precedes the STL projection

The CAD agent asks for build123d Python, saves the script, executes it and requires an STL export. Execution errors are returned to the model for a corrected full script. Timestamped source and mesh files live in the project output, while the viewer receives a base64 STL projection. Settings can require user confirmation before CAD generation, file writes and Web automation.

Printing crosses a separate physical-action boundary through OrcaSlicer and a discovered printer. The public source does not establish STEP or retained BREP delivery, so manufacturability and editability are limited by the saved script and mesh path.

- [Pinned repository](https://github.com/nazirlouis/ada_v2/tree/d005af742fc5c604074b8b92bd9a223d7fca7447)
- [CAD agent implementation](https://github.com/nazirlouis/ada_v2/blob/d005af742fc5c604074b8b92bd9a223d7fca7447/backend/cad_agent.py)
- [CAD verification helper](https://github.com/nazirlouis/ada_v2/blob/d005af742fc5c604074b8b92bd9a223d7fca7447/backend/verify_cad.py)
- [Maintainer profile checked; no location published](https://github.com/nazirlouis)
