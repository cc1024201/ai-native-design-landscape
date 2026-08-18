# MasterGo AI

MasterGo AI answers "what is design" with governance: design is a reusable, team-owned native graph that generation must respect rather than merely imitate. The agent's job is not to produce the best-looking pixels but to operate inside an approved design identity so that later human and AI edits stay consistent with it.

## Generation is constrained by the library, not just the model

From natural language, a reference image or `design.md`, MasterGo AI can produce a whole interface, a component or a page framework, and insert the result into the canvas as editable vector layers and components. For enterprise use it can call an existing team library so output draws on approved components, styles and icons instead of approximating their look. That library constraint is the decisive mechanism: it is what separates governed generation from free generation, and it makes system governance the primary Design definition for this record.

## Three surfaces converge on one host-owned graph

| Surface | What happens | Authority consequence |
|---|---|---|
| AI 快搭 | prompt, image or `design.md` generates UI and front-end code | generated UI can be promoted into editable native layers |
| AI 设计助手 | agent calls canvas-editing capabilities directly | current MasterGo file is mutated in place |
| MCP | external tools create/modify layers and read structured layout | outside agent reaches the same host graph |

The Design Assistant distinguishes Agent mode, which edits, from Chat mode, which only advises — a clear statement that design authority stays with the file and not with unsanctioned advice. First-party material describes a higher-level JSON representation and one AST kernel that can target React, Vue and mini-program stacks while mapping tokens, component libraries and layer metadata. This is public architecture, not implementation: generated code reads as a projection from the design graph, and nothing in the public documents promises lossless reverse update from arbitrary code edits. Design lives in the versioned collaborative file; code is one delivery surface of it. The current service agreement identifies the provider and a Beijing address ([MasterGo AI](https://mastergo.com/ai), [AI Design Assistant](https://mastergo.com/help/AI/Agent), [file and native-canvas model](https://mastergo.com/help/get-started/get-started), [provider and address](https://mastergo.com/serviceAgreement)), supporting a China team-region classification without inferring geography from the product language.
