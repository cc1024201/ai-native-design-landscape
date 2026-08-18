# ZapTrace

> Research status: **Source-level** · Lifecycle: **active pre-1.0** · Last reviewed: **2026-08-12**

ZapTrace is an AI-native EDA kernel built around a normalized design model and auditable proof packs. It accepts intent through SDK, CLI, REST or MCP, then carries a board through schematic construction, ERC, placement, routing, DRC and manufacturing export.

## Verification evidence is an artifact, not a correctness claim

The pipeline produces KiCad, Gerber, Excellon, BOM, pick-and-place and schematic SVG outputs alongside a manifest of configured checks and assumptions. The checked-in [proof-pack example](https://github.com/oaslananka/zaptrace/tree/8a3b21dca3dcb163a2a9dae2dfd3546a5dd70587/benchmarks/esp32_usb_sensor/proof-pack) shows that release evidence persists with the design. [KiCad round-trip fixtures](https://github.com/oaslananka/zaptrace/tree/8a3b21dca3dcb163a2a9dae2dfd3546a5dd70587/benchmarks/kicad_roundtrip) make translation failures inspectable.

ZapTrace's normalized model is the construction authority until export; native KiCad files become an independent downstream authority. Proof packs record what was checked but explicitly do not certify fabrication readiness.

## Evidence

- [Pinned repository](https://github.com/oaslananka/zaptrace/tree/8a3b21dca3dcb163a2a9dae2dfd3546a5dd70587)
- [Design benchmark with native KiCad sources](https://github.com/oaslananka/zaptrace/tree/8a3b21dca3dcb163a2a9dae2dfd3546a5dd70587/benchmarks/high_current_led_driver)
- [Maintainer profile: Türkiye](https://github.com/oaslananka)
