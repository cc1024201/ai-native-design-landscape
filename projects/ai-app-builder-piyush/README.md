# AI App Builder by Piyush Agarwal

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This record is the canonical identity for a large public tutorial-derived cluster. It means Piyush's repository is the earliest observable source in this reviewed cluster; it does not assert authorship beyond the public evidence.

## Generation produces a complete React file graph

[gen-ai-code/route.ts](https://github.com/piyush-eon/ai-app-builder/blob/413271de627f9795ba8bcdab6372516dc93ad34b/app/api/gen-ai-code/route.ts) asks the configured model for project files and dependencies. [improve/route.ts](https://github.com/piyush-eon/ai-app-builder/blob/413271de627f9795ba8bcdab6372516dc93ad34b/app/api/improve/route.ts) supplies the current graph and applies file-level updates on later turns.

## Prisma stores current workspace and conversation

[schema.prisma](https://github.com/piyush-eon/ai-app-builder/blob/413271de627f9795ba8bcdab6372516dc93ad34b/prisma/schema.prisma) persists project file JSON and messages. Each accepted turn updates current authority; no independent version table establishes restore points for every previous graph.

## Sandpack closes editing preview and delivery

[CodePanel.tsx](https://github.com/piyush-eon/ai-app-builder/blob/413271de627f9795ba8bcdab6372516dc93ad34b/components/CodePanel.tsx) synchronizes project files into Sandpack for source editing and execution. ZIP export can read the live Sandpack graph so direct human edits remain deliverable.

## Why sixteen repositories are not counted again

Repository creation time places this project on 2026-05-24. The previously counted Ronak repository was created on 2026-06-10 and shares 51 identical path-and-blob pairs with this tree. Sixteen additional repositories reviewed in SAT-DOM-UI-018 share the same core generation persistence and Sandpack files. They remain candidate records with duplicate decisions so the lineage evidence is retained without inflating the product count.

## Evidence

- [Canonical repository](https://github.com/piyush-eon/ai-app-builder)
- [Inspected tree](https://github.com/piyush-eon/ai-app-builder/tree/413271de627f9795ba8bcdab6372516dc93ad34b)
- [Compared Ronak tree](https://github.com/ronak-goyal-code/Ai-website-builder/tree/5ba5da6e927675bd03651c85a9628e0b3339af57)
- Commit: 413271de627f9795ba8bcdab6372516dc93ad34b
