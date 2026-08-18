# AI-Native Design Landscape

> 中文速览：一个证据约束的观测——1504 条 AI 设计工具记录，每条回答两件事：**它如何定义"设计"**、**它如何实现**。不是名录、不是百科、不是科普。121 条值得深度分析（逐篇定制分析），其余 1383 条登记归档。英文正文见下。
> A note: this is an open repository, so the main text is in English; the Chinese summary follows at the end.

An evidence-bounded observation of **1,504 records**, each answering two questions only: **how it defines "design"** and **how it is implemented**. Not a directory, not an encyclopedia, not a science explainer.

**Screening:** 121 records (active only) are worth deep analysis — each gets a custom, per-project analysis. The other 1,383 are classified as *not worth analysis* and are registered only.

## Structure

```
projects/
├── 01-depth-analysis/   121 records worth deep analysis (currently all active)
│   └── 01-active/
│       ├── 01-commercial/   <slug>/README.md   (custom analysis, 88 records)
│       └── 02-open-source/  <slug>/README.md   (custom analysis, 33 records)
└── 02-others/           1,383 records classified as not worth analysis
    ├── <slug>/README.md    (4-line registration entry)
    └── INDEX.md            (full registry table)
```

> The `0x-` prefixes are **file-system sort prefixes only** — they carry no meaning.
> The concept is the word after the prefix (`depth-analysis`, `others`, `active`,
> `commercial`, `open-source`). An archived layer and template/research type exist
> as reserved branches; they currently hold no records.

Every directory layer ships an auto-generated `INDEX.md` (members + evidence gaps),
built by `scripts/build-indexes.py` from the tree itself. The two-tier authority
is `data/quality-tiers.csv`.

## How to explore

- I want a specific product → its `<slug>/README.md` (find the path in `data/slug-paths.json` or use the INDEX tables).
- I want a category → `projects/01-depth-analysis/01-active/01-*/INDEX.md` (worth deep analysis).
- I want the full list of "others" → `projects/02-others/INDEX.md`.

## Data dictionary

| File | Columns / values |
|---|---|
| `data/census.csv` | `slug` · `product` · `organization` · `evidence_depth` · `lifecycle` |
| | `evidence_depth ∈ {source, architecture}` — `source` = pinned to a source revision; `architecture` = closed/distributed, evidence ends at the public boundary |
| | `lifecycle ∈ {active, archived}` — `archived` = historical/sunsetting |
| `data/quality-tiers.csv` | `tier ∈ {depth, other}` — `depth` = worth deep analysis (active only, custom analysis); `other` = registered only |
| `data/slug-paths.json` | slug → tree path (generated; do not hand-edit) |
| `data/candidates.csv` | open candidate register (status: pending/included/duplicate/excluded) |
| `data/discovery-batches.csv` · `verification-waves.csv` · `saturation-strata.csv` | discovery/verification/saturation ledgers |
| `data/organizations.csv` · `identity-map.csv` | organization / alias mapping |

## Known gaps

- 285 records are `architecture`-level evidence (not pinned to source) — flagged in each type INDEX.
- Discovery is not saturated: 26/27 strata still active; team-region evidence known for only 742/2,402 candidate rows.

## Workflow

Contributing: `CONTRIBUTING.md` · Discovery protocol: `DISCOVERY.md` · Integrity check: `python3 scripts/verify-census.py`

---

## 结构说明（中文）

```
projects/
├── 01-depth-analysis/  121 条值得深度分析（当前全为活跃）
│   └── 01-active/01-commercial（88 条 · 商业）/ 02-open-source（33 条 · 开源）
└── 02-others/          1383 条不值得分析 · 仅登记
```

- 目录前的 `0x-` 仅用于文件系统排序，**无概念含义**；概念是前缀后的词。
- 每层有自动生成的 `INDEX.md`（成员 + 证据缺口）；两档依据 `data/quality-tiers.csv`。
- 数据字段：`evidence_depth`（source=钉到源码 / architecture=闭源到证据边界）、`lifecycle`（active/archived）、`tier`（depth=深度分析 / other=仅登记）。
