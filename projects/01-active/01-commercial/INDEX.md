# H1 完整商业/托管产品（01-commercial）

**184 条** · 定义: 用户直接购买/订阅使用，公司或团队运营

| 档位 | 条数 |
|---|---|
| 01-fully-ai-native 完全 AI-native（v2 total ≥ 9.0） | 19 |
| 02-ai-first AI-first（v2 total 7.0–8.9） | 99 |
| 03-ai-enhanced AI-enhanced（v2 total 4.0–6.9） | 56 |
| 04-ai-tooling AI-tooling（v2 total < 4.0） | 10 |

## 层内不足与缺陷
- **evidence 缺口**（architecture 级，共 129 条，70%）: adalo-ai, adly, adobe-firefly-creative-agent, ai-ui-designer, aidesigner, aipto, alloy, anthropic-claude-design, anything, appy-pie-ui, atoms, autocraft, backdraft, baidu-comate, baidu-miaoda …
- **生命周期待刷新** 23: adobe-firefly-creative-agent, autocraft, caliper, cofounder, comfy-in-app-agent, dawn-design, faisca, figma-weave, frappe-studio, komposo, microsoft-designer, pixello …
- **边界存疑** `claude-financial-services`: Anthropic 出品，公司规则提升为 H1；实质为 skill 集，边界待审

## 覆盖缺口（结构即缺口——这些 form×band 组合尚无条目）

- `standalone-design-agent`（独立设计 agent 工作空间）: 缺 04-ai-tooling
- `agent-platform-design-surface`（agent 平台内设计面）: 缺 01-fully-ai-native, 04-ai-tooling
- `general-agent-visual-tools`（带可视化工具的一般 agent）: 缺 03-ai-enhanced, 04-ai-tooling
- `ai-app-site-builder`（AI 应用/网站构建器）: 缺 04-ai-tooling
- `runtime-overlay-bridge`（运行时叠加/上下文桥）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `agent-controllable-canvas`（agent 可控画布/领域编辑器）: 缺 01-fully-ai-native, 04-ai-tooling
- `design-code-bridge`（设计-代码桥）: 缺 01-fully-ai-native, 04-ai-tooling
- `visual-decision-verification-workspace`（视觉决策/验证工作空间）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `visual-editor-infrastructure`（可视化编辑器基础设施）: 缺 01-fully-ai-native, 03-ai-enhanced
- `ai-engineering-design-workspace`（AI 工程设计工作空间）: 缺 01-fully-ai-native, 02-ai-first

## 下一步
- 升级 129 条 architecture 级档案
- 核实 active-transition 现状
- 针对 22 个未覆盖组合定向发现（先查档案是否误分层，再查候选登记册）
