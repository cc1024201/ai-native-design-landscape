# Project name

> Research status: **Seed | Product-level | Architecture-level | Source-level** · Last reviewed: **YYYY-MM-DD**

| Field | Value |
|---|---|
| Organization / team | |
| Category | |
| Status | |
| Source availability | |
| Previous names / aliases | |
| Canonical product URL | |
| Canonical source repository | |
| Pinned source revision | `commit SHA`, tag, release, or `N/A — closed source` |

## 1. Product facts

Record only externally verifiable facts about what the product is, what surfaces it ships, what artifacts it accepts/produces, and its lifecycle state.

## 2. Technical direction

Describe the project's own architectural/product direction. Do not compare it with other projects here.

## 3. Technology choices

Record concrete public choices by layer. For closed-source products, leave undisclosed internals unknown.

- **Client / shell:**
- **UI / editor:**
- **Backend / service interface:**
- **Database / storage:**
- **AI / model integration:**
- **Sandbox / execution:**
- **Build / packaging:**

## 4. Artifact and data model

Identify the durable artifact(s) and the important transient representations.

- **Primary durable artifact / source of truth:**
- **Visual/editor representation:**
- **Runtime representation:**
- **Identity model:**
- **Change model:**

State explicitly when a second design document exists versus when the visual surface is a projection of source/runtime state.

## 5. Agent interface

Document how an AI/coding/design agent observes and acts on the project.

- **Invocation surface:**
- **Context provided to agent:**
- **Tool/protocol interface:**
- **Action path:**
- **Approval / human correction path:**

For MCP/ACP/App Server/custom protocols, name concrete methods/tools when source evidence exists.

## 6. Runtime and rendering

Document how the user-visible artifact is executed or rendered.

- **Execution environment:**
- **Renderer:**
- **Preview transport:**
- **Runtime instrumentation:**
- **Isolation / sandbox boundary:**

## 7. Source mapping and targeting

Explain how a visual element, selection, annotation, or canvas node maps back to source or another durable artifact.

- **Stable identity:**
- **DOM/canvas targeting:**
- **Source-location mechanism:**
- **Framework-specific mechanism:**
- **Known unmappable cases:**

Do not write “maps to code” without explaining the mechanism or marking it unknown.

## 8. Persistence and versioning

Document separately:

- **Project/workspace persistence:**
- **Editor/canvas state:**
- **Agent/session history:**
- **Undo/redo:**
- **Checkpoints / branches / versions:**
- **Collaboration state:**

## 9. Open-source implementation map

For open-source/source-available projects, list the concrete implementation locations that establish the architecture.

| Concern | Repository path | What it establishes |
|---|---|---|
| | | |

For closed-source products, replace this section with `N/A — implementation source is not public` and keep only official public evidence elsewhere.

## 10. Commit-level evidence

For source-derived claims, pin a revision before recording implementation facts.

**Pinned revision:** `<full SHA>`

| Claim | Evidence at pinned revision |
|---|---|
| | `path/to/file` |

Prefer immutable GitHub permalinks containing the full commit SHA.

## Product continuity

Record renames, rebrands, acquisitions, or direct predecessor identity only when supported by evidence.

## Evidence boundary

Separate:

- **Fact:** directly established by a primary source or pinned source code.
- **Inference:** a conclusion derived from facts; label it explicitly.
- **Unknown:** do not fill gaps by guessing.

Cross-project comparison belongs in the repository root, never here.

## Research gaps

- 

## Primary sources

- 
