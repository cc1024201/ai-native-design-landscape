# Rivet

**What is design.** Rivet's design is *choosing among real mutations*. Its center of gravity is not a visual document and not a single agent answer: it is a local decision system that asks several workers to mutate isolated copies of a real project, renders those copies as live alternatives, preserves their trees, and lets the user promote one result back into a working project. The browser grid is a comparison projection, not the durable authority—the authorities split across the user's repository, a private `.rivet/store.git`, per-run manifests, live processes and optional public preview deploys.

**How it is implemented.** The mechanism is per-direction Git worktrees plus a leased work graph. For an existing repo, each direction becomes a detached worktree whose dirty-state baseline captures the user's current patch; the worker delta is `git diff HEAD`, and "commit variant" applies that diff to the working tree *without creating a Git commit*. For fresh projects, a direction is either an inline static artifact or a scaffolded Vite app, chosen by atomically renaming the worktree into its destination.

Workers run under leases (20-minute default for code generation) with stages from `awaiting_source_plan` through terminal `ready`/`failed`, and a refusal of stale leases keeps completions honest. Persistence stages a complete variant directory into `.rivet/variants/` with a tree ref written before its manifest, backed by a bare `store.git` so the saved `diff.patch` is actually regenerable from exact trees.

"Design context"—Pinterest/Are.na, rendered CSS, images, video keyframes—changes the brief, never the artifact authority. Visual grounding reduces a runtime `data-rivet-id`, DOM id, XPath or dominant class to a target; it is runtime identity plus heuristic source evidence, not an authored byte range. Git/PR delivery is a separate promotion clock downstream of variant selection, and sharing uploads a built projection to a public URL that can be live even for an uncommitted variant.

The declared GPL-3.0-or-later distribution has no reachable corresponding source revision—the pinned `0.14.19` package reveals the architecture, not the TypeScript core.

[Evidence: Rivet introduction](https://docs.rivet.design/index.md) · [Comparison guide](https://docs.rivet.design/comparing-variants.md) · [Pinned npm distribution](https://registry.npmjs.org/rivet-design/-/rivet-design-0.14.19.tgz)
