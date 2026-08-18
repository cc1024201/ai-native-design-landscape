#!/usr/bin/env python3
"""Generate INDEX.md from the two-tier tree + census + quality tiers.
Only common-sense concepts: active/archived, commercial/open-source/
templates/research, worth-deep-analysis vs others.
"""
import csv, json, os
from collections import Counter

REPO = '/home/zhcao/ai-native-design-landscape'
os.chdir(REPO)

census = {r['slug']: r for r in csv.DictReader(open('data/census.csv'))}
quality = {r['slug']: r['tier'] for r in csv.DictReader(open('data/quality-tiers.csv'))}
paths = json.load(open('data/slug-paths.json'))
TYPE = {'01-commercial': '商业产品', '02-open-source': '开源项目',
        '03-templates': '模板/脚手架', '04-research': '研究/评测/验证'}

def write(path, content):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'w', encoding='utf-8').write(content)

def type_index(td, typ, slugs):
    rows = []
    for s in sorted(slugs):
        c = census[s]
        rel = os.path.relpath(os.path.join('projects', paths[s]), td).replace(os.sep, '/')
        flag = ' ⚠' if c['evidence_depth'] == 'architecture' else ''
        rows.append(f"| [{c['product']}]({rel}/) | {c['organization']} | {c['evidence_depth']}{flag} | {c['lifecycle']} |")
    arch = [s for s in slugs if census[s]['evidence_depth'] == 'architecture']
    lines = [f"# {TYPE.get(typ, typ)}（{typ}）", '', f'**{len(slugs)} 条**', '',
             '| 项目 | 组织 | 证据深度 | 生命周期 |', '|---|---|---|---|'] + rows
    if arch:
        lines += ['', f'**evidence 缺口**（{len(arch)} 条仅架构级，待源码/文档升级）: ' + ', '.join(arch[:8]) + (' …' if len(arch) > 8 else '')]
    return '\n'.join(lines) + '\n'

# depth tree
for life in ('01-active', '02-archived'):
    ld = os.path.join('projects', '01-depth-analysis', life)
    if not os.path.isdir(ld):
        continue
    life_slugs = []
    for typ in sorted(os.listdir(ld)):
        td = os.path.join(ld, typ)
        if not os.path.isdir(td):
            continue
        slugs = sorted(s for s in os.listdir(td) if os.path.isdir(os.path.join(td, s)))
        life_slugs += slugs
        write(os.path.join(td, 'INDEX.md'), type_index(td, typ, slugs))
    lines = ['# 活跃' if life == '01-active' else '# 归档', '',
             f'**{len(life_slugs)} 条**', '',
             '| 类型 | 条数 |', '|---|---|']
    for typ in ['01-commercial', '02-open-source', '03-templates', '04-research']:
        if os.path.isdir(os.path.join(ld, typ)):
            n = sum(1 for s in os.listdir(os.path.join(ld, typ)) if os.path.isdir(os.path.join(ld, typ, s)))
            lines.append(f'| [{TYPE[typ]}]({typ}/) | {n} |')
    write(os.path.join(ld, 'INDEX.md'), '\n'.join(lines) + '\n')

# others index
other = sorted((s for s, t in quality.items() if t != 'depth'))
rows = []
for s in other:
    c = census[s]
    rel = os.path.relpath(os.path.join('projects', paths[s]), os.path.join('projects', '02-others')).replace(os.sep, '/')
    rows.append(f"| [{c['product']}]({rel}/) | {c['evidence_depth']} | {c['lifecycle']} |")
write(os.path.join('projects', '02-others', 'INDEX.md'),
      '# 02-others — 其他（不值得深度分析）\n\n'
      f'**{len(other)} 条** · 仅登记归档，不分析。\n\n| 项目 | 证据深度 | 生命周期 |\n|---|---|---|\n' + '\n'.join(rows) + '\n')

# depth root
dep = sorted((s for s, t in quality.items() if t == 'depth'))
write(os.path.join('projects', '01-depth-analysis', 'INDEX.md'),
      '# 01-depth-analysis — 值得深度分析\n\n'
      f'活跃项目中判定值得逐篇定制分析的 **{len(dep)} 条**。每篇分析回答两件事：\n\n'
      '- 它如何定义"设计"\n- 它如何实现\n\n组织：生命周期 → 类型（商业/开源/模板/研究）。\n')

# top
depth_n = sum(1 for t in quality.values() if t == 'depth')
write(os.path.join('projects', 'README.md'),
      '# projects/\n\n'
      f'**{len(census)} 条** · 两档：值得深度分析 {depth_n} / 其他 {len(census) - depth_n}\n\n'
      '```\nprojects/\n├── 01-depth-analysis/  值得深度分析（逐篇定制分析）\n│   └── <life>/<类型>/<slug>\n└── 02-others/          其他（仅登记，不分析）\n```\n\n'
      '`data/quality-tiers.csv` 为两档依据；INDEX 由 `scripts/build-indexes.py` 从树生成。\n')

print('INDEX files:',
      sum(1 for r, _, fs in os.walk('projects') if 'INDEX.md' in fs))