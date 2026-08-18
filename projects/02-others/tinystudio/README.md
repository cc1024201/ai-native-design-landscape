# tinyStudio

> Research status: **Source-level** · Lifecycle: **active alpha** · Last reviewed: **2026-08-12**

tinyStudio is an early maker IDE that keeps firmware, circuit wiring and a live p5.js visualization in one project. Its optional in-app agent can read and write those files with permission, so AI participates in the same artifact set that manual editors and the hardware toolchain consume.

## Three views share a filesystem project

Arduino source is edited in Monaco; the Circuit view reads and writes Wokwi-compatible `diagram.json`; the Visual view runs `visual.js` against serial output and can export a standalone page. [`AgentService.ts`](https://github.com/Mister-Industries/tinyStudio/blob/a28d8bf96e730cc13ca01d146609e13f31a9e2e1/src/main/AgentService.ts) mediates the assistant, while the [circuit subsystem](https://github.com/Mister-Industries/tinyStudio/tree/a28d8bf96e730cc13ca01d146609e13f31a9e2e1/src/renderer/src/circuit) owns wiring, ERC and schematic export behavior.

The project files—not the chat—are authoritative. Build/flash and serial feedback close the loop against real hardware, although the maintainers explicitly label the current release a rough alpha.

## Evidence

- [Pinned repository](https://github.com/Mister-Industries/tinyStudio/tree/a28d8bf96e730cc13ca01d146609e13f31a9e2e1)
- [Circuit ERC tests](https://github.com/Mister-Industries/tinyStudio/blob/a28d8bf96e730cc13ca01d146609e13f31a9e2e1/src/renderer/src/circuit/__tests__/erc.test.ts)
- [Organization profile: United States](https://github.com/Mister-Industries)
