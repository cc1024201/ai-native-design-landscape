# AI-Native Design Landscape

一个证据约束的观测：**1504 条记录**，每条记录两件事——它如何定义"设计"，它如何实现。不是名录、不是科普、不是百科全书。

**筛分：** 1504 条中只有 **121 条值得深度分析**（仅活跃项目，见 `projects/01-depth-analysis/`）；其余 1383 条已归入"不值得分析"并登记（见 `projects/02-others/`）。

## 第一件事 — 这 1504 条分别如何定义"设计"

| primary_definition | 条数 | 含义 |
|---|---|---|
| 委托式创作 (`primary_definition`) | 206 | 意图/参考交给 agent 生成并迭代 |
| 原生制品创作 (`primary_definition`) | 353 | 结构化图形/场景/页面/时间线是权威 |
| 可执行源码视觉创作 (`primary_definition`) | 283 | 可视化投影回写源码 |
| 运行时纠正 (`primary_definition`) | 40 | 在运行制品上标注/演示并修复源码 |
| 变体决策 (`primary_definition`) | 18 | 生成备选并存，显式采纳一个 |
| 系统治理 (`primary_definition`) | 144 | 组件/token/规则约束后续工作 |
| 设计-代码翻译 (`primary_definition`) | 70 | 结构/语义在设计与代码权威间迁移 |
| 端到端交付 (`primary_definition`) | 133 | 设计与行为/数据/发布不可分 |
| 视觉协调与证据 (`primary_definition`) | 84 | 视觉制品协调/验证，另一权威拥有实现 |
| 约束驱动工程 (`primary_definition`) | 173 | 尺寸/约束/特征/拓扑/可制造性决定制品 |

每条记录可同时带辅助定义（`data/census.csv` 的 `additional_definitions`）；混合形态由此表达。

## 第二件事 — 这 1504 条分别如何实现

| primary_architecture | 条数 | 含义 |
|---|---|---|
| 源码权威·实时投射 (`primary_architecture`) | 272 | 仓库文件为真，实时投射回写编辑/意图 |
| 运行时意图中继 (`primary_architecture`) | 29 | 运行时桥捕获上下文，另一写入者负责变异 |
| 原生图形权威 (`primary_architecture`) | 338 | 宿主原生结构化图形拥有可编辑制品 |
| 外部 agent 画布 (`primary_architecture`) | 140 | 外部 agent 经 MCP/插件/CLI 操作独立画布 |
| 托管生成制品工作区 (`primary_architecture`) | 69 | 托管制品与修订与编辑/代码收敛 |
| 托管应用项目图 (`primary_architecture`) | 190 | UI/逻辑/数据/配置/发布共居一个项目图 |
| 设计-代码物化 (`primary_architecture`) | 107 | 设计被编译/导出/重建/锚定成代码 |
| 文件系统 agent·视觉证据 (`primary_architecture`) | 224 | 文件+Git 为真，视觉证据协调/验证 agent |
| 候选隔离与晋升 (`primary_architecture`) | 36 | 备选隔离，显式选择/应用一个 |
| 参数化工程模型权威 (`primary_architecture`) | 99 | 约束/特征历史/拓扑/PDM 拥有工程状态 |

每条记录可同时带辅助架构（`additional_architectures`）。

## 结构

```
projects/
├── 01-depth-analysis/  121 条，仅活跃，值得深度分析 → 逐篇定制分析（"如何定义设计/如何实现"）
└── 02-others/          1383 条，已归类为不值得分析 → 仅登记索引，不分析
```

- 每层目录内的 `INDEX.md` 自动生成：成员、质量档、不足/缺陷、覆盖缺口、下一步（`scripts/build-indexes.py`）。
- 质量档：`data/quality-tiers.csv`（depth/other，规则可复现）。
- 分析范围外的证据档案归档在 `02-others/<slug>/README.md`（登记条目）。

## 数据

| 文件 | 内容 |
|---|---|
| `data/census.csv` | 1504 条权威记录：定义/实现标签、形态、证据深度、生命周期 |
| `data/quality-tiers.csv` | 两档筛查结论 |
| `data/slug-paths.json` | slug → 树路径 |
| `data/candidates.csv` · `discovery-batches.csv` · `verification-waves.csv` · `saturation-strata.csv` | 发现与验证登记册 |
| `data/identity-map.csv` · `organizations.csv` · `taxonomy.json` | 别名/组织/分类法 |

## 已知缺口（简短）

- 285 条档案证据深度停在 architecture 级（未到源码）；详见 depth 树各层 INDEX。
- 26/27 发现分层未饱和；地理证据仅 742/2402 行已知——均在 `data/` 登记册中量化。

## 工作流

见 `CONTRIBUTING.md`；发现协议见 `DISCOVERY.md`。
