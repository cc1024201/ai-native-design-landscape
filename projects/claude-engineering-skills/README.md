# Claude Engineering Skills Library

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

The Claude Engineering Skills Library focuses on mechanical aerospace fluid and pump design. It combines domain databases package integrations helper scripts and thinking workflows so an external agent can assemble a traceable engineering analysis rather than improvising every equation.

## Design work is composed from capabilities

At commit [`1c3340b`](https://github.com/Soljourner/claude-engineering-skills/tree/1c3340ba171b475fb0ecd7b1699e41dac6acd986) the inventory routes requests to data sources such as material and pump curves calculations and integration instructions for tools including OpenFOAM ANSYS SolidWorks and COMSOL. A system-design request can combine component selection loss calculation optimization and performance plotting.

The skill files are the agent interface; Python examples and third-party solvers perform deterministic computation. The library does not own a common geometry model or project database so downstream CAD and simulation files remain authoritative.

This dossier records the collection as an engineering design toolkit rather than claiming each database reference is a separate product. Public first-party evidence did not establish the maintainer's region.

## Evidence

- [Capability inventory](https://github.com/Soljourner/claude-engineering-skills/blob/1c3340ba171b475fb0ecd7b1699e41dac6acd986/SKILLS_INVENTORY.md)
- [Engineering context initializer](https://github.com/Soljourner/claude-engineering-skills/blob/1c3340ba171b475fb0ecd7b1699e41dac6acd986/skills/helpers/engineering-context-init/SKILL.md)
- [Pinned README](https://github.com/Soljourner/claude-engineering-skills/blob/1c3340ba171b475fb0ecd7b1699e41dac6acd986/README.md)
