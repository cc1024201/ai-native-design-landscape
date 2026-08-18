# Get Shit Pretty

Get Shit Pretty (GSP) treats design as a **verdict on intent**: a coded agent doesn't just build an interface, it first establishes *why* a brand or product should look the way it does, then checks the shipped screen against that stated reason. Design is a pass/fail contract between research and implementation, not a free-form act.

## Two connected diamonds, one gated pipeline

GSP splits the act into a brand diamond and a product diamond, each driven by a brief, a configuration and a `STATE.md` that lets a session recover mid-flow. The [architecture contract](https://github.com/jubscodes/get-shit-pretty/blob/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8/ARCHITECTURE.md) keeps the machinery honest: pipeline skills own the gates and the state, while expertise skills own just the design knowledge — color, type, imagery, icons, critique. Separating "who advances the phase" from "who holds taste" is the load-bearing decision.

Brand phases produce research, strategy, identity and W3C-style token sets (a durable [TOKENS template](https://github.com/jubscodes/get-shit-pretty/blob/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8/gsp/templates/system/TOKENS.md)); product phases turn those into screen and flow specs, a `preview.html`, then run heuristic and accessibility critique and build components in bounded waves. The terminal **Pass/Conditional/Fail** verdict closes the loop: implementation is rated against the design intent that preceded it.

## Where authority lives

Authority is split deliberately — source code and the `.design/` artifacts both preserve it, so the documented intent survives alongside what was built. Figma MCP enters only as an input bridge, never as the source of truth. Each project carries its own [state template](https://github.com/jubscodes/get-shit-pretty/blob/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8/gsp/templates/projects/state.md); the maintainer is based in Florianópolis, Brazil. The unusual move is that "good design" here is defined operationally: whatever the critique stage can defend against the brief.

**证据**

- [Pinned repository](https://github.com/jubscodes/get-shit-pretty/tree/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8)
- [Project state template](https://github.com/jubscodes/get-shit-pretty/blob/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8/gsp/templates/projects/state.md)
- [Token template](https://github.com/jubscodes/get-shit-pretty/blob/5754ce8c44cd9cc9d9207e25955a1a89cf875bb8/gsp/templates/system/TOKENS.md)
- [Maintainer profile](https://github.com/jubscodes)
