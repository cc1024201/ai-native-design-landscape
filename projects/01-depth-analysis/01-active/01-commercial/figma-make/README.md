# Figma Make

**What is design.** Figma Make refuses to deliver a single design artifact. It answers "design" only after you split the room:

- in the ordinary hosted product, design is a Figma-owned React/TSX code project plus an automatic Make version graph;
- in the local-codebase closed beta, design is a real checkout governed by local Git commits, branches and pull requests.

Everything else—preview, published site, GitHub repo, ZIP, copied Design layers—is a projection downstream of one of those two authorities. The visible loop feels continuous, but generation, Make versions, comments, Supabase data, GitHub, Design layers and a published URL each run on their own clock.

**How it is implemented.** The decisive mechanism is that both regimes make *mutation authority* the design act. Hosted Make converges prompt, plan mode, direct code edits and a staged visual-property panel onto one hosted code project: a `plan.md` stays a planning input until Build writes code, and the property panel stacks intent in chat until Apply invokes the agent. Every code-changing action creates a numbered Make version, and restore keeps later versions—a branch-like graph, not Git-equivalent semantics.

Authority for the design-system context splits three ways: an executable npm package (generation context *and* runtime supply chain), a simplified `styles.css` projection of a Figma library that never writes back, and natural-language guidelines whose precedence is unstated. The Figma MCP relationship is asymmetric—Make can call external connectors outward, but the public Figma write tool does not mutate Make.

In the local beta, `.figma/make` scripts (setup, install, dev, verify, env) become an executable repository interface, the preview is evidence over the real dev server, and a code-changing prompt becomes a local commit with nothing merged automatically. Every exit—publish/update, one-way GitHub push, ZIP, Copy as Design, template fork—starts a separate destination clock, so no single recovery button rewinds the whole system.

[Evidence: Figma Make product page](https://www.figma.com/make/) · [Make in your local codebase](https://help.figma.com/hc/en-us/articles/40775535020695-Make-in-your-local-codebase) · [Work with Figma Make code](https://developers.figma.com/docs/code/intro-to-figma-make/)
