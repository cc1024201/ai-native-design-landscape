# Trace Symbols and Footprints Libraries

> Research status: **Architecture-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Trace Symbols and Footprints Libraries are paired public component-authoring platforms. They are counted together because first-party architecture documents one shared thin-client platform and account model; they are counted separately from the Trace PCB editor because each website supports a complete artifact-specific search generation preview download and contribution journey.

## Symbols move from description to native EDA data

The [Symbols Library](https://docs.buildwithtrace.com/resources/symbols-platform) indexes official KiCad/Trace CERN and community libraries. A user can describe a missing component generate a symbol with pin names numbers electrical types and footprint references review the preview then copy either a ready-to-place canvas representation or library form. Full `.kicad_sym` downloads preserve authored graphics.

Footprints apply the same lifecycle to the paired physical package artifact at [footprints.buildwithtrace.com](https://footprints.buildwithtrace.com/). Both surfaces feed Trace and vanilla KiCad rather than a proprietary consumer. Contributions validate uploaded native library files and create reviewable pull requests before entering the catalog.

## Evidence ceiling and identity

The catalog source libraries are public—for example [`trace-kicad-symbols-lib`](https://github.com/buildwithtrace/trace-kicad-symbols-lib) and [`trace-kicad-footprints-lib`](https://github.com/buildwithtrace/trace-kicad-footprints-lib)—but the hosted generation and shared platform implementation are not exposed in those repositories. The record is consequently architecture-level. Trace CLI MCP and Partner API access the same component services and remain interfaces of the broader Trace product rather than extra libraries.

## Evidence

- [Symbols platform workflow](https://docs.buildwithtrace.com/resources/symbols-platform)
- [Footprints platform](https://footprints.buildwithtrace.com/)
- [Shared platform architecture index](https://docs.buildwithtrace.com/platforms/architecture)
