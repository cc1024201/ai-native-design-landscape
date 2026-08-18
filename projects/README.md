# projects/ — 分层组织（结构自解释）

**1504 条记录** · 活性 {'active': 1476, 'archived': 28} · 层次 {'H1': 190, 'H2': 1077, 'H3': 97, 'H4': 122, 'H5': 9, 'H6': 9}

```
projects/
├── 01-active/  (1476 条)
│   ├── 01-commercial/  (184)
│   ├── 02-open-source/  (1055)
│   ├── 03-agent-workflows/  (97)
│   ├── 04-bridges/  (122)
│   ├── 05-templates/  (9)
│   ├── 06-research-eval/  (9)
│
├── 02-archived/  (28 条)
│   ├── 01-commercial/  (6)
│   ├── 02-open-source/  (22)
│   ├── 03-agent-workflows/  (0)
│   ├── 04-bridges/  (0)
│   ├── 05-templates/  (0)
│   ├── 06-research-eval/  (0)
│
```

每层目录内有自动生成的 `INDEX.md`：条数 / 成员 / 档位分布 / **覆盖缺口（未覆盖的组合即空缺）** / **不足与缺陷（evidence 缺口、评分状态、生命周期待刷新、边界存疑）** / 下一步。

## 全局现状与缺口
- 地理证据: 2402 候选行中仅 742 有第一方区域证据，其余未知（candidates.csv）
- 发现分层: 27 个声明分层中 26 个仍 active，1 个 paused（channel-figma-forum）→ 发现未饱和
- 语言/区域批次稀疏：多数语言层仅有 1 个基线批次（saturation-strata.csv）
- evidence 深度: 285 条 architecture 级（18%）待升级（各层 INDEX 列明细）

## 结构性债务（已知）
- H2 开源项目 1000+ 条为"混合袋"：含接近产品形态的个人项目（heym、graph-ai），边界判定见对应 INDEX
- 名字不带 mcp 的桥类可能仍留在 H2（talktofigma 已记录）——分层 v3 应做穷举审计
- H5/H6 未评分（模板/研究验证语义不同）——如需要可比性，另立指标
- 3 个 PS1 维护脚本已适配新树但未在 pwsh 实机验证
