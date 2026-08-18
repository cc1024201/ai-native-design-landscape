# H3 agent 工作流/skill 包（03-agent-workflows）

**97 条** · 定义: 为 agent 编写的一整套创作回路

| 档位 | 条数 |
|---|---|
| 01-fully-ai-native 完全 AI-native（v2 total ≥ 9.0） | 1 |
| 02-ai-first AI-first（v2 total 7.0–8.9） | 68 |
| 03-ai-enhanced AI-enhanced（v2 total 4.0–6.9） | 28 |
| 04-ai-tooling AI-tooling（v2 total < 4.0） | 0 |

## 层内不足与缺陷
- **evidence 缺口**（architecture 级，共 5 条，5%）: 3dmodel-skill, cuellar-design-skills, freecad-modeling-skill, shain-design-system-skill, super-design-skills
- **生命周期待刷新** 5: claudesign, design-md-agent-skill, design-system-extractor-skill, penpot-skills, picasso

## 覆盖缺口（结构即缺口——这些 form×band 组合尚无条目）

- `standalone-design-agent`（独立设计 agent 工作空间）: 缺 04-ai-tooling
- `agent-platform-design-surface`（agent 平台内设计面）: 缺 01-fully-ai-native, 03-ai-enhanced, 04-ai-tooling
- `general-agent-visual-tools`（带可视化工具的一般 agent）: 缺 01-fully-ai-native, 04-ai-tooling
- `ai-app-site-builder`（AI 应用/网站构建器）: 缺 01-fully-ai-native, 03-ai-enhanced, 04-ai-tooling
- `code-native-visual-ide`（代码原生可视化编辑器/IDE）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `runtime-overlay-bridge`（运行时叠加/上下文桥）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `agent-controllable-canvas`（agent 可控画布/领域编辑器）: 缺 01-fully-ai-native, 03-ai-enhanced, 04-ai-tooling
- `design-code-bridge`（设计-代码桥）: 缺 01-fully-ai-native, 04-ai-tooling
- `established-visual-platform`（既有视觉平台 + AI）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `visual-decision-verification-workspace`（视觉决策/验证工作空间）: 缺 01-fully-ai-native, 02-ai-first, 04-ai-tooling
- `visual-editor-infrastructure`（可视化编辑器基础设施）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `ai-engineering-design-workspace`（AI 工程设计工作空间）: 缺 01-fully-ai-native, 04-ai-tooling

## 下一步
- 升级 5 条 architecture 级档案
- 核实 active-transition 现状
- 针对 35 个未覆盖组合定向发现（先查档案是否误分层，再查候选登记册）
