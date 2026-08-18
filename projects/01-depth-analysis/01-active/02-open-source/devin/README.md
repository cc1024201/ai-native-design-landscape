# Devin

Devin answers "what is design" by making it **engineering against a moving
target**: the deliverable is a working change to real software, and design
operates across several machines at once — a fresh cloud session VM, a local
checkout, a worktree, a branch/PR and a recorded visual run. Its definition of
design is therefore not a document but an implementation that must be made
comparable, reviewable and eventually merged.
[What is Devin?](https://docs.devin.ai/get-started/devin-intro)

The decisive mechanism is **Git-centered convergence across plural machines**.
A cloud session boots a fresh copy of an organization snapshot whose
mutations never flow back; the reviewable result is the branch and PR the
agent pushes. The moment of transition — prompt plus snapshot baseline,
through mutable session tree, to branch/commit/PR — is where work becomes an
artifact, not when a session reports "finished" and not when a video renders.
[Environment configuration and snapshots](https://docs.devin.ai/onboard-devin/environment) ·
[Testing & Video Recordings](https://docs.devin.ai/work-with-devin/testing-and-recordings)

Every visual surface is a *projection*, never the source of truth. Computer
Use is a screenshot/action loop over rendered state — it validates screen
behavior but maps to no authored file. Local Preview packages an element's
HTML path, outer HTML, geometry and computed CSS into runtime context, rich
enough to ground a search yet carrying no file, AST or source-map identity;
selection itself changes no source.
[Computer Use](https://docs.devin.ai/work-with-devin/computer-use) ·
[Devin Desktop Previews](https://docs.devin.ai/desktop/previews)

The product manages this sprawl with a control plane rather than one
filesystem: Devin Local, Cascade, cloud Devin and ACP agents appear under one
**Agent Command Center**, Spaces group sessions/PRs/context, and handoff
crosses machines by serializing conversation plus a bounded `git diff` into a
prompt for a fresh VM. Recovery is fourteen separate persistence clocks —
blueprint, snapshot, session, branch, recording, plan, checkpoint, worktree —
and none rewinds the suite. The closed cloud agent and the proprietary
Desktop distribution remain implementation, while public repos expose only
edges like the lossy handoff adapter.
[Agent Command Center](https://docs.devin.ai/desktop/agent-command-center) ·
[Hand off to cloud Devins](https://docs.devin.ai/work-with-devin/devin-handoff) ·
[Open handoff adapter](https://github.com/club-cog/devin-handoff/tree/24a60e0b3030a162bedf709f0922d4b73f440004)
