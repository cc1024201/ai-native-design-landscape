#!/usr/bin/env python3
"""Generate INDEX.md from the two-tier tree itself + census + quality tiers.
No self-invented concepts: no entity-layer ids, no AI-native bands.
"""
import csv, json, os
from collections import Counter, defaultdict

REPO = '/home/zhcao/ai-native-design-landscape'
os.chdir(REPO)

census = {r['slug']: r for r in csv.DictReader(open('data/census.csv'))}
quality = {r['slug']: r['tier'] for r in csv.DictReader(open('data/quality-tiers.csv'))}

LAYER_DIR = {'01-commercial': '商业产品', '02-open-source': '开源项目',
             '03-agent-workflows': 'agent 工作流/skill 包', '04-bridges': '连接与桥接层',
             '05-templates': '模板/脚手架', '06-research-eval': '研究/评测/验证'}
FORM = {'standalone-design-agent':'独立设计 agent 工作空间','agent-platform-design-surface':'agent 平台内设计面',
        'general-agent-visual-tools':'带可视化工具的一般 agent','ai-app-site-builder':'AI 应用/网站构建器',
        'code-native-visual-ide':'代码原生可视化编辑器/IDE','runtime-overlay-bridge':'运行时叠加/上下文桥',
        'agent-controllable-canvas':'agent 可控画布/领域编辑器','design-code-bridge':'设计-代码桥',
        'established-visual-platform':'既有视觉平台 + AI','visual-decision-verification-workspace':'视觉决策/验证工作空间',
        'visual-editor-infrastructure':'可视化编辑器基础设施','ai-engineering-design-workspace':'AI 工程设计工作空间'}

def registry_rows(slugs, base):
    rows = []
    for s in sorted(slugs):
        c = census[s]
        rel = os.path.relpath(os.path.join('projects', paths[s]), base).replace(os.sep, '/')
        flag = ' ⚠' if c['evidence_depth'] == 'architecture' else ''
        rows.append(f"| [{c['product']}]({rel}/) | {c['primary_definition']} | {c['primary_architecture']} | {c['evidence_depth']}{flag} | {c['lifecycle']} |")
    return rows

def form_index(fd, form, slugs):
    rows = registry_rows(slugs, fd)
    lines = [f"# {form} — {FORM.get(form, form)}", '',
             f'**{len(slugs)} 条** · census product_form 分类', '',
             '| 项目 | 定义 | 实现 | evidence | 生命周期 |', '|---|---|---|---|---|']
    lines += rows
    arch_gap = [s for s in slugs if census[s]['evidence_depth'] == 'architecture']
    if arch_gap:
        lines += ['', f'**evidence 缺口**（{len(arch_gap)} 条仅 architecture 级）: ' + ', '.join(arch_gap[:8]) + (' …' if len(arch_gap) > 8 else '')]
    return '\n'.join(lines) + '\n'

def layer_index(d, layer_dir, slugs):
    title = LAYER_DIR.get(layer_dir, layer_dir)
    lines = [f"# {title}（{layer_dir}）", '', f'**{len(slugs)} 条**', '']
    qd = Counter(quality.get(s, '?') for s in slugs)
    lines += ['| 质量档 | 条数 |', '|---|---|',
              f'| 值得深度分析 | {qd.get("depth", 0)} |', f'| 其他 | {qd.get("other", 0)} |', '']
    forms = Counter(census[s]['product_form'] for s in slugs)
    lines += ['| 产品形态 | 条数 |', '|---|---|']
    for f, n in forms.most_common():
        lines.append(f'| {f} | {n} |')
    lines.append('')
    arch_gap = [s for s in slugs if census[s]['evidence_depth'] == 'architecture']
    transition = [s for s in slugs if census[s]['lifecycle'] == 'active-transition']
    lines.append('## 缺口')
    if arch_gap:
        lines.append(f'- evidence 缺口（architecture 级 {len(arch_gap)} 条）: ' + ', '.join(arch_gap[:10]) + (' …' if len(arch_gap) > 10 else ''))
    if transition:
        lines.append(f'- 生命周期 active-transition 待核实（{len(transition)} 条）: ' + ', '.join(transition[:8]) + (' …' if len(transition) > 8 else ''))
    if not arch_gap and not transition:
        lines.append('- 暂无记录在案的缺口')
    return '\n'.join(lines) + '\n', d

def others_index():
    other = sorted((s for s, t in quality.items() if t != 'depth'), key=lambda x: x)
    lines = ['# 02-others — 已归类为"不值得深度分析"', '',
             '这些项目经筛判定为不值得深度分析。**不再分析**，仅登记归档。', '',
             '| 项目 | 定义 | 实现 | 生命周期 |', '|---|---|---|---|']
    for s in other:
        c = census[s]
        rel = os.path.relpath(os.path.join('projects', paths[s]), os.path.join('projects', '02-others')).replace(os.sep, '/')
        lines.append(f"| [{c['product']}]({rel}/) | {c['primary_definition']} | {c['primary_architecture']} | {c['lifecycle']} |")
    return '\n'.join(lines) + '\n'


def write(path, content):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'w', encoding='utf-8').write(content)

paths = json.load(open('data/slug-paths.json'))

# depth tree: 01-depth-analysis/<life>/<layer>/<form>/<slug>
for life in ('01-active', '02-archived'):
    life_dir = os.path.join('projects', '01-depth-analysis', life)
    if not os.path.isdir(life_dir): continue
    for layer_dir in sorted(os.listdir(life_dir)):
        if layer_dir.startswith('.'): continue
        ld = os.path.join(life_dir, layer_dir)
        if not os.path.isdir(ld): continue
        layer_slugs = []
        for form in sorted(os.listdir(ld)):
            fd = os.path.join(ld, form)
            if not os.path.isdir(fd): continue
            slugs = [s for s in os.listdir(fd) if os.path.isdir(os.path.join(fd, s)) and s != 'INDEX.md']
            layer_slugs += slugs
            write(os.path.join(fd, 'INDEX.md'), form_index(fd, form, slugs))
        content, _ = layer_index(ld, layer_dir, layer_slugs)
        write(os.path.join(ld, 'INDEX.md'), content)

# others: 02-others/<slug>
write(os.path.join('projects', '02-others', 'INDEX.md'), others_index())

# depth root
dep = sorted((s for s, t in quality.items() if t == 'depth'), key=lambda x: x)
write(os.path.join('projects', '01-depth-analysis', 'INDEX.md'),
      '# 01-depth-analysis — 值得深度分析\n\n'
      f'活跃项目中判定值得逐篇定制分析的 {len(dep)} 条。每篇分析"如何定义设计 / 如何实现"。\n\n'
      '组织：生命周期 → 类型（商业/开源/工作流/桥）→ 产品形态。\n')

# top
lines = ['# projects/', '',
         f'**{len(census)} 条** · 两档：值得深度分析 {sum(1 for t in quality.values() if t == "depth")} / 其他 {sum(1 for t in quality.values() if t != "depth")}',
         '', '```', 'projects/', '├── 01-depth-analysis/  值得深度分析（逐篇定制分析）', '│   └── <life>/<类型>/<形态>/<slug>', '└── 02-others/          其他（仅登记，不分析）', '```', '',
         '`data/quality-tiers.csv` 为两档依据；INDEX 由 `scripts/build-indexes.py` 从树生成。']
write(os.path.join('projects', 'README.md'), '\n'.join(lines) + '\n')

print('INDEX.md files generated:',
      sum(1 for r, _, fs in os.walk('projects') if 'INDEX.md' in fs))
