# RocketSmith

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

RocketSmith is an end-to-end model-rocket engineering workspace exposed through MCP and agent skills. It joins flight simulation, parametric part construction, manufacturability, slicing and post-build measurement instead of treating a generated CAD preview as finished Design.

## Physical mass closes the digital loop

OpenRocket owns the flight and stability model. CADSmith runs validated build123d scripts and produces parts and STEP assemblies; PrusaSlicer evaluates print preparation. Manufacturing code annotates the component tree with DfAM constraints. After fabrication, the mass-calibration workflow replaces predicted component weights with real measurements and reruns stability verification.

```text
mission and motor constraints -> OpenRocket model -> parametric parts
-> visual STEP evidence + DfAM -> slicing and print
-> measured part mass -> simulation update -> post-build stability decision
```

The browser dashboard exposes component, flight, part and assembly evidence but is not the engineering authority. The maintainer reports Pittsburgh, United States.

## Evidence

- [Pinned repository](https://github.com/ppak10/RocketSmith/tree/e9039b629e48262f3b8fa6a75545f88c854621a7)
- [CADSmith MCP operations](https://github.com/ppak10/RocketSmith/tree/e9039b629e48262f3b8fa6a75545f88c854621a7/src/rocketsmith/cadsmith/mcp)
- [Manufacturing analysis](https://github.com/ppak10/RocketSmith/blob/e9039b629e48262f3b8fa6a75545f88c854621a7/src/rocketsmith/manufacturing/dfam.py)
- [Maintainer location evidence](https://github.com/ppak10)
