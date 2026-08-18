# AI-Native Design Landscape

一个证据约束的观测：**1504 条记录**，每条记录两件事——**它如何定义"设计"**、**它如何实现**。不是名录、不是百科、不是科普。

**筛分：** 1504 条中 **121 条值得深度分析**（仅活跃项目）；其余 1383 条已归入"不值得分析"并登记。

## 结构

```
projects/
├── 01-depth-analysis/  121 条 · 仅活跃 · 值得逐篇定制分析
│   └── <活跃|归档>/<商业|开源|模板|研究>/<slug>
└── 02-others/          1383 条 · 仅登记归档，不分析
```

- 每篇深度分析回答两件事：`它如何定义"设计"` + `它如何实现`——逐篇定制，非模板。
- `projects/` 内每层有自动生成的 `INDEX.md`（成员、证据缺口）。
- 两档依据：`data/quality-tiers.csv`。

## 数据

| 文件 | 内容 |
|---|---|
| `data/census.csv` | 1504 条记录：slug · 产品 · 组织 · 证据深度（源码/架构）· 生命周期（活跃/归档） |
| `data/quality-tiers.csv` | 两档筛查（值得深度分析 / 其他） |
| `data/slug-paths.json` | slug → 树路径 |
| `data/candidates.csv` · `discovery-batches.csv` · `verification-waves.csv` · `saturation-strata.csv` | 发现与验证登记册（候选/批次/验证/饱和度） |
| `data/organizations.csv` · `identity-map.csv` | 组织 / 别名映射 |

## 已知缺口

- 285 条档案证据深度停在架构级（未到源码）——各类型 INDEX 已标注。
- 发现未饱和：26/27 分层仍活跃；地理证据仅 742/2402 行已知。

## 工作流

见 `CONTRIBUTING.md`；发现协议见 `DISCOVERY.md`。
