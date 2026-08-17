# Visionary for Claude Code

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Visionary is a visual-direction system for Claude Code. It treats taste as an evolving, inspectable project asset: an agent proposes several style vectors, the user selects or rejects them, and accepted decisions constrain subsequent implementation and review.

## Selection turns taste into durable evidence

The `/variants` workflow deliberately separates exploration from commitment. Candidate directions are rendered and compared by distance rather than collapsed into one opaque answer. `/apply` converts the accepted direction into DTCG-compatible tokens and implementation guidance. [`accepted-store.mjs`](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/blob/eb74afb1ae495009ac8e447c8848c9f6b1799235/hooks/scripts/lib/accepted-store.mjs) persists the user's accepted choices so later agents can distinguish declared taste from a model's fresh preference.

```text
brief + current interface -> multiple style vectors -> human selection
-> accepted taste store + tokens -> implementation
-> deterministic slop checks + visual/a11y critics -> revise
```

Verification is deliberately plural. Deterministic hooks catch named anti-patterns; the visual verifier uses Playwright screenshots and accessibility evidence; specialist critics assess typography, hierarchy and coherence. These layers can reject a build, but source code remains the production authority and the accepted store is a constraint record rather than a drawable canvas.

The repository also contains an MCP server package for exposing the workflow to compatible hosts. The project is Apache-2.0 licensed. No reliable maintainer-region evidence was found.

## Pinned evidence

- [Repository](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/tree/eb74afb1ae495009ac8e447c8848c9f6b1799235)
- [Accepted-direction store](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/blob/eb74afb1ae495009ac8e447c8848c9f6b1799235/hooks/scripts/lib/accepted-store.mjs)
- [Visual verifier](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/blob/eb74afb1ae495009ac8e447c8848c9f6b1799235/agents/visual-verifier.md)
- [MCP package](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/tree/eb74afb1ae495009ac8e447c8848c9f6b1799235/packages/mcp-server)
- [Apache-2.0 license](https://github.com/GIT-Webb-App-Studio-AB/Visionary-for-Claude-Code/blob/eb74afb1ae495009ac8e447c8848c9f6b1799235/LICENSE)
