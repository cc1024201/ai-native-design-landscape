# H2 开源应用/项目（02-open-source）

**1055 条** · 定义: 可独立运行、可部署/复用/贡献（含个人单作者）

| 档位 | 条数 |
|---|---|
| 01-fully-ai-native 完全 AI-native（v2 total ≥ 9.0） | 13 |
| 02-ai-first AI-first（v2 total 7.0–8.9） | 313 |
| 03-ai-enhanced AI-enhanced（v2 total 4.0–6.9） | 505 |
| 04-ai-tooling AI-tooling（v2 total < 4.0） | 224 |

## 层内不足与缺陷
- **evidence 缺口**（architecture 级，共 128 条，12%）: 42maker, aesthetron, ai-design-engineer, ai-design-space, ai-ux-writer, aihouse, anima, archgen, architechtures, archondev, artiso, atlas-3d-design, atlas-design-ux, atomic-component-generator, autodesk-flow-studio …
- **生命周期待刷新** 125: a0-component-studio, a2ui, agent-game-forge, agentforge, agentforge-winka-alcel, agentic-design-canvas, agentic-ui-design-poc, agenticbuilder-showjihyun, ai-canvas-desktop, ai-canvas-studio, ai-cms, ai-component-builder-sfyr …
- **边界存疑** `talktofigma`: 名字不含 mcp 但实质为桥（MCP+WebSocket+Figma 插件），按实体归 H2 待分层 v3 复核
- **边界存疑** `heym`: 接近产品形态的个人开源项目，保守归 H2
- **边界存疑** `graph-ai`: 接近产品形态的个人开源项目，保守归 H2

## 覆盖缺口（结构即缺口——这些 form×band 组合尚无条目）

- `runtime-overlay-bridge`（运行时叠加/上下文桥）: 缺 01-fully-ai-native, 02-ai-first, 03-ai-enhanced, 04-ai-tooling
- `design-code-bridge`（设计-代码桥）: 缺 01-fully-ai-native
- `visual-editor-infrastructure`（可视化编辑器基础设施）: 缺 01-fully-ai-native

## 下一步
- 升级 128 条 architecture 级档案
- 核实 active-transition 现状
- 针对 6 个未覆盖组合定向发现（先查档案是否误分层，再查候选登记册）
