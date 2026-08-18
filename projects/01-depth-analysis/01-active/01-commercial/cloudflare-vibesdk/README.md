# Cloudflare VibeSDK

VibeSDK treats design as the whole path from a clarified prompt to a live, branch-scoped deployment — not as a distinct artboard stage. Its defining move is that no single authority owns the artifact: the act of design is spread across four Cloudflare primitives that cooperate without merging.

## Four authorities, one agent loop

`ThinkAgent` runs the model-and-tool loop while a project-specific `SpaceDO` owns the current workspace files, [Cloudflare Artifacts](https://github.com/cloudflare/vibesdk/blob/a318f08625dbb443af7f70dd08d295fd49a0b96b/space/src/space/artifacts-sync.ts) supplies Git commits, branches and restore points, and the [deployment engine](https://github.com/cloudflare/vibesdk/blob/a318f08625dbb443af7f70dd08d295fd49a0b96b/space/src/space/deploy-engine.ts) turns a committed state into a Dynamic Worker preview. A Durable Object Facet owns the generated app's SQLite data. The user watches file/tool changes, inspects browser failures and restores earlier source states — design is what the agent does across all four, not a file one of them labels "the design."

## Restore keeps lineage, not application data

State is versioned as Git history: [rollback](https://github.com/cloudflare/vibesdk/blob/a318f08625dbb443af7f70dd08d295fd49a0b96b/sdk/src/workspace.ts) restores a selected commit into the current branch, creates another commit and redeploys — it never rewrites history destructively. That same granularity is why generated-app data is a separate ledger with its own inspect/reset controls and is not implied to roll back with code. Persistence is distributed across these primitives on purpose, and a [pre-deploy safety gate](https://github.com/cloudflare/vibesdk/blob/a318f08625dbb443af7f70dd08d295fd49a0b96b/worker/agents/utils/preDeploySafetyGate.ts) sits in front of the flow.

Because the whole system makes Cloudflare's own durable primitives the storage layer, VibeSDK is less a standalone design product than a reference for how a cloud platform makes agentic app-building its own distribution channel.
