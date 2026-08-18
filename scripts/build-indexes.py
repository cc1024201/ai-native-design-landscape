#!/usr/bin/env python3
"""Generate INDEX.md at every layer of the projects/ tree so the structure itself
reports coverage, gaps, defects and next steps — no patch documents needed.

Data sources (all must be current):
  data/entity-layers.csv, data/census.csv, data/ai-native-scores-v2.csv,
  data/lifecycle-classification.csv, data/slug-paths.json, data/saturation-strata.csv,
  data/candidates.csv
"""
import csv, json, os, statistics as st
from collections import defaultdict, Counter

REPO = '/home/zhcao/ai-native-design-landscape'
os.chdir(REPO)

# ---------- data ----------
layers   = {r['slug']: r['layer'] for r in csv.DictReader(open('data/entity-layers.csv'))}
census   = {r['slug']: r for r in csv.DictReader(open('data/census.csv'))}
bucket   = {r['slug']: r['bucket'] for r in csv.DictReader(open('data/lifecycle-classification.csv'))}
paths    = json.load(open('data/slug-paths.json'))
scores   = {r['slug']: r for r in csv.DictReader(open('data/ai-native-scores-v2.csv')) if r['total']}
strata   = list(csv.DictReader(open('data/saturation-strata.csv')))
cands    = list(csv.DictReader(open('data/candidates.csv')))

LIFE = {'01-active': 'active', '02-archived': 'archived'}
LAYER = {'H1': ('01-commercial', 'H1 完整商业/托管产品', '用户直接购买/订阅使用，公司或团队运营'),
         'H2': ('02-open-source', 'H2 开源应用/项目', '可独立运行、可部署/复用/贡献（含个人单作者）'),
         'H3': ('03-agent-workflows', 'H3 agent 工作流/skill 包', '为 agent 编写的一整套创作回路'),
         'H4': ('04-bridges', 'H4 连接与桥接层', 'MCP/插件/API 适配/CLI/扩展，本身无模型'),
         'H5': ('05-templates', 'H5 模板/脚手架/示例', '起点素材'),
         'H6': ('06-research-eval', 'H6 研究原型/评估/验证', '论文原型/benchmark/审计/验证器')}
BAND = {'01-fully-ai-native': ('H1H2H3', '完全 AI-native（v2 total ≥ 9.0）'),
        '02-ai-first':       ('H1H2H3', 'AI-first（v2 total 7.0–8.9）'),
        '03-ai-enhanced':    ('H1H2H3', 'AI-enhanced（v2 total 4.0–6.9）'),
        '04-ai-tooling':     ('H1H2H3', 'AI-tooling（v2 total < 4.0）'),
        '01-deep-authoring':   ('H4', '接入深度 9–10：完整创作面'),
        '02-constrained-write':('H4', '接入深度 3–8：受限写入~深变异'),
        '03-read-only':       ('H4', '接入深度 1–2：只读')}
FORMS = ['standalone-design-agent','agent-platform-design-surface','general-agent-visual-tools',
         'ai-app-site-builder','code-native-visual-ide','runtime-overlay-bridge',
         'agent-controllable-canvas','design-code-bridge','established-visual-platform',
         'visual-decision-verification-workspace','visual-editor-infrastructure',
         'ai-engineering-design-workspace']
FORM_NAME = {'standalone-design-agent':'独立设计 agent 工作空间','agent-platform-design-surface':'agent 平台内设计面',
             'general-agent-visual-tools':'带可视化工具的一般 agent','ai-app-site-builder':'AI 应用/网站构建器',
             'code-native-visual-ide':'代码原生可视化编辑器/IDE','runtime-overlay-bridge':'运行时叠加/上下文桥',
             'agent-controllable-canvas':'agent 可控画布/领域编辑器','design-code-bridge':'设计-代码桥',
             'established-visual-platform':'既有视觉平台 + AI','visual-decision-verification-workspace':'视觉决策/验证工作空间',
             'visual-editor-infrastructure':'可视化编辑器基础设施','ai-engineering-design-workspace':'AI 工程设计工作空间'}

def slug_bucket(s): return bucket.get(s, '?')
def score_of(s):
    r = scores.get(s); return float(r['total']) if r else None
def band_of(s):
    lay = layers[s]
    if lay in ('H5','H6'): return None
    t = score_of(s)
    if lay == 'H4':
        return '01-deep-authoring' if (t or 0) >= 8 else '02-constrained-write' if (t or 0) >= 3 else '03-read-only'
    if t is None: return '04-ai-tooling'
    return '01-fully-ai-native' if t >= 9 else '02-ai-first' if t >= 7 else '03-ai-enhanced' if t >= 4 else '04-ai-tooling'

def relpath(slug): return paths.get(slug, '')

def md_escape(t): return str(t).replace('|', '\\|')

# ---------- helpers ----------
def evidence_gaps(slugs):
    a = [s for s in slugs if census[s]['evidence_depth'] == 'architecture']
    return a

def transition_slugs(slugs):
    return [s for s in slugs if census[s]['lifecycle'] == 'active-transition']

def boundary_notes(slugs):
    # 分层边界存疑的已知条目（记录在案的）
    KNOWN = {
        'talktofigma': '名字不含 mcp 但实质为桥（MCP+WebSocket+Figma 插件），按实体归 H2 待分层 v3 复核',
        'heym': '接近产品形态的个人开源项目，保守归 H2',
        'graph-ai': '接近产品形态的个人开源项目，保守归 H2',
        'claude-financial-services': 'Anthropic 出品，公司规则提升为 H1；实质为 skill 集，边界待审',
    }
    return {s: v for s, v in KNOWN.items() if s in slugs}

# ---------- band README ----------
def band_index(life_dir, layer_key, life_key, band, slug_list):
    base = os.path.join(life_dir, LAYER[layer_key][0], band)
    rows = []
    for s in sorted(slug_list, key=lambda x: -(score_of(x) or 0)):
        c = census[s]
        t = score_of(s)
        mark = '⚠' if c['evidence_depth'] == 'architecture' else ''
        rel = os.path.relpath(os.path.join('projects', relpath(s)), base).replace(os.sep, '/')
        rows.append(f'| [{c["product"]}]({rel}/) | {md_escape(t) if t is not None else "—"} | {c["evidence_depth"]} {mark} | {c["lifecycle"]} |')
    lines = []
    lines.append(f'# {band} — {BAND[band][1]}')
    lines.append('')
    lines.append(f'/**{LAYER[layer_key][1]}** · 条目数 **{len(slug_list)}** */')
    lines.append('')
    lines.append('| 项目 | v2 总分 | evidence | lifecycle |')
    lines.append('|---|---|---|---|')
    lines.extend(rows)
    if not rows:
        lines.append('_（空档：此组合尚无条目）_')
    lines.append('')
    # gaps: 同层其他 band 未覆盖 form 的说明由 band 内 form 层承担；这里列出本 band 的数字化缺口
    evg = evidence_gaps(slug_list)
    trs = transition_slugs(slug_list)
    notes = boundary_notes(slug_list)
    lines.append('## 不足与缺陷')
    if evg:
        lines.append(f'- **Evidence 缺口**（{len(evg)} 条仅 architecture 级，待源码/文档升级）: ' + ', '.join(evg[:12]) + (' …' if len(evg) > 12 else ''))
    else:
        lines.append('- Evidence 缺口：无（全部 source 级）')
    if trs:
        lines.append(f'- **生命周期刷新**（{len(trs)} 条 active-transition 待核实）: ' + ', '.join(trs[:12]) + (' …' if len(trs) > 12 else ''))
    if notes:
        for s, v in notes.items():
            lines.append(f'- **边界存疑** `{s}`: {v}')
    lines.append('')
    lines.append('## 下一步')
    nxt = []
    if evg: nxt.append(f'升级 {len(evg)} 条 architecture 级档案的 evidence 深度')
    if trs: nxt.append('核实 active-transition 生命周期现状')
    if not nxt: nxt.append('本档无已知待办；如发现有新的完全档候选，通过 census 评审加入')
    for n in nxt: lines.append(f'- {n}')
    return '\n'.join(lines) + '\n'

# ---------- form README ----------
def form_index(fdir, form, slugs):
    lines = []
    lines.append(f'# {form} — {FORM_NAME.get(form, form)}')
    lines.append('')
    lines.append(f'**{len(slugs)} 条** · census product_form 分类')
    lines.append('')
    rows = []
    for s in sorted(slugs, key=lambda x: -(score_of(x) or 0)):
        c = census[s]
        t = score_of(s)
        mark = '⚠' if c['evidence_depth'] == 'architecture' else ''
        rel = os.path.relpath(os.path.join('projects', relpath(s)), fdir).replace(os.sep, '/')
        rows.append(f'| [{c["product"]}]({rel}/) | {md_escape(t) if t is not None else "—"} | {c["evidence_depth"]} {mark} | {c["lifecycle"]} | {c["organization"]} |')
    lines.append('| 项目 | v2 总分 | evidence | lifecycle | org |')
    lines.append('|---|---|---|---|---|')
    lines.extend(rows)
    lines.append('')
    evg = evidence_gaps(slugs); trs = transition_slugs(slugs)
    notes = boundary_notes(slugs)
    lines.append('## 本 form 的不足')
    if evg: lines.append(f'- evidence 缺口 {len(evg)}: ' + ', '.join(evg[:8]) + (' …' if len(evg) > 8 else ''))
    if trs: lines.append(f'- 生命周期待刷新 {len(trs)}: ' + ', '.join(trs[:8]))
    if not evg and not trs: lines.append('- 暂无已知缺口')
    if notes:
        for s, v in notes.items(): lines.append(f'- 边界存疑 `{s}`: {v}')
    return '\n'.join(lines) + '\n'

# ---------- layer README ----------
def layer_index(life_dir, layer_key, life_key):
    dirname, title, _def = LAYER[layer_key]
    d = os.path.join(life_dir, dirname)
    os.makedirs(d, exist_ok=True)
    slugs = [s for s in layers if layers[s] == layer_key and slug_bucket(s) == life_key]
    lines = []
    lines.append(f'# {title}（{dirname}）')
    lines.append('')
    lines.append(f'**{len(slugs)} 条** · 定义: {_def}')
    lines.append('')
    # band 统计
    if layer_key in ('H1','H2','H3'):
        bdist = Counter(band_of(s) for s in slugs)
        lines.append('| 档位 | 条数 |')
        lines.append('|---|---|')
        for b in ['01-fully-ai-native','02-ai-first','03-ai-enhanced','04-ai-tooling']:
            lines.append(f'| {b} {BAND[b][1]} | {bdist.get(b, 0)} |')
        lines.append('')
    elif layer_key == 'H4':
        bdist = Counter(band_of(s) for s in slugs)
        lines.append('| 接入深度档 | 条数 |')
        lines.append('|---|---|')
        for b in ['01-deep-authoring','02-constrained-write','03-read-only']:
            lines.append(f'| {b} {BAND[b][1]} | {bdist.get(b, 0)} |')
        lines.append('')
    # 评分状态
    if layer_key in ('H5','H6'):
        lines.append('> 本层不评分（模板/研究验证语义不同），待办见下文。')
        lines.append('')
    evg = evidence_gaps(slugs)
    trs = transition_slugs(slugs)
    notes = boundary_notes(slugs)
    lines.append('## 层内不足与缺陷')
    if layer_key in ('H1','H2','H3'):
        unscored = [s for s in slugs if score_of(s) is None]
        if unscored: lines.append(f'- **未评分** {len(unscored)}: ' + ', '.join(unscored[:10]))
    if evg: lines.append(f'- **evidence 缺口**（architecture 级，共 {len(evg)} 条，{100*len(evg)//max(len(slugs),1)}%）: ' + ', '.join(evg[:15]) + (' …' if len(evg) > 15 else ''))
    if trs: lines.append(f'- **生命周期待刷新** {len(trs)}: ' + ', '.join(trs[:12]) + (' …' if len(trs) > 12 else ''))
    if notes:
        for s, v in notes.items(): lines.append(f'- **边界存疑** `{s}`: {v}')
    if not evg and not trs and not notes: lines.append('- 本层暂无记录在案的缺口')
    lines.append('')
    # 覆盖缺口（form × band 未覆盖组合）
    if layer_key in ('H1','H2','H3'):
        covered = {(band_of(s) or '', census[s]['product_form']) for s in slugs}
        missing_combos = [(f, b) for b in ['01-fully-ai-native','02-ai-first','03-ai-enhanced','04-ai-tooling'] for f in FORMS if (b, f) not in covered]
        if missing_combos:
            lines.append('## 覆盖缺口（结构即缺口——这些 form×band 组合尚无条目）')
            lines.append('')
            byf = defaultdict(list)
            for f, b in missing_combos: byf[f].append(b)
            for f in FORMS:
                if f in byf:
                    lines.append(f'- `{f}`（{FORM_NAME.get(f, "")}）: 缺 ' + ', '.join(sorted(byf[f])))
            lines.append('')
    lines.append('## 下一步')
    nxt = []
    if evg: nxt.append(f'升级 {len(evg)} 条 architecture 级档案')
    if trs: nxt.append('核实 active-transition 现状')
    if layer_key in ('H1','H2','H3'):
        if missing_combos: nxt.append(f'针对 {len(missing_combos)} 个未覆盖组合定向发现（先查档案是否误分层，再查候选登记册）')
    if layer_key == 'H4': nxt.append('接入深度为独立指标；保持各桥档案的深度证据更新')
    if layer_key in ('H5','H6'): nxt.append('本层多为素材/工具性条目，保持按需扩展即可；如增量大，可细分')
    if not nxt: nxt.append('暂无待办')
    for n in nxt: lines.append(f'- {n}')
    return '\n'.join(lines) + '\n', d, slugs

# ---------- lifecycle README ----------
def life_index(life_dir, life_key):
    lines = []
    slugs = [s for s in layers if slug_bucket(s) == life_key]
    lines.append(f'# {"活跃记录" if life_key == "active" else "归档记录"}（{os.path.basename(life_dir)}）')
    lines.append('')
    lines.append(f'**{len(slugs)} 条**')
    ldist = Counter(layers[s] for s in slugs)
    lines.append('')
    lines.append('| 层次 | 条数 |')
    lines.append('|---|---|')
    for k in ['H1','H2','H3','H4','H5','H6']:
        lines.append(f'| [{LAYER[k][1]}]({LAYER[k][0]}/) | {ldist.get(k, 0)} |')
    lines.append('')
    evg = [s for s in slugs if census[s]['evidence_depth'] == 'architecture']
    trs = [s for s in slugs if census[s]['lifecycle'] == 'active-transition']
    lines.append('## 不足与缺陷')
    if life_key == 'active':
        lines.append(f'- evidence 缺口（architecture 级）: {len(evg)} 条（{100*len(evg)//max(len(slugs),1)}%）')
        lines.append(f'- 生命周期 active-transition 待刷新: {len(trs)} 条')
    else:
        lines.append('| 项目 | lifecycle | evidence | 组织 |')
        lines.append('|---|---|---|---|')
        for s in sorted(slugs):
            c = census[s]
            rel = os.path.relpath(os.path.join('projects', relpath(s)), life_dir).replace(os.sep, '/')
            lines.append(f'| [{c["product"]}]({rel}/) | {c["lifecycle"]} | {c["evidence_depth"]} | {c["organization"]} |')
        lines.append('')
        lines.append('> 归档材料为最终状态；仅在发现新生命周期证据时更新（各档案应声明 cutoff）。逐条原因见各档案正文。')
    lines.append('')
    lines.append('## 下一步')
    if life_key == 'active':
        lines.append(f'- 优先处理 evidence 缺口与 active-transition 刷新（详见各层 INDEX）')
    else:
        lines.append('- 定期重查归档项是否有复活/重启证据')
    return '\n'.join(lines) + '\n'

# ---------- top README ----------
def top_index():
    total = len(layers)
    ldist = Counter(layers.values())
    bdist = Counter(bucket.values())
    lines = []
    lines.append('# projects/ — 分层组织（结构自解释）')
    lines.append('')
    lines.append(f'**{total} 条记录** · 活性 {dict(bdist)} · 层次 {dict(ldist)}')
    lines.append('')
    lines.append('```')
    lines.append('projects/')
    for life, lk in LIFE.items():
        ldist_life = Counter(layers[s] for s in layers if bucket.get(s) == lk)
        lines.append(f'├── {life}/  ({bdist[lk]} 条)')
        for k in ['H1','H2','H3','H4','H5','H6']:
            lines.append(f'│   ├── {LAYER[k][0]}/  ({ldist_life.get(k,0)})')
        lines.append('│')
    lines.append('```')
    lines.append('')
    lines.append('每层目录内有自动生成的 `INDEX.md`：条数 / 成员 / 档位分布 / **覆盖缺口（未覆盖的组合即空缺）** / **不足与缺陷（evidence 缺口、评分状态、生命周期待刷新、边界存疑）** / 下一步。')
    lines.append('')
    # 全局缺陷
    lines.append('## 全局现状与缺口')
    ungeo = sum(1 for c in cands if c['status'] == 'included' and c['team_region'] == 'unknown')
    act_strata = sum(1 for s in strata if s['state'] == 'active')
    paused = [s['stratum_id'] for s in strata if s['state'] == 'paused']
    lines.append(f'- 地理证据: {len(cands)} 候选行中仅 {sum(1 for c in cands if c["team_region"] not in ("unknown",""))} 有第一方区域证据，其余未知（candidates.csv）')
    lines.append(f'- 发现分层: 27 个声明分层中 {act_strata} 个仍 active，{len(paused)} 个 paused（{", ".join(paused) or "无"}）→ 发现未饱和')
    lines.append('- 语言/区域批次稀疏：多数语言层仅有 1 个基线批次（saturation-strata.csv）')
    eva_total = sum(1 for s in layers if census[s]['evidence_depth'] == 'architecture')
    lines.append(f'- evidence 深度: {eva_total} 条 architecture 级（{100*eva_total//total}%）待升级（各层 INDEX 列明细）')
    # 已知结构性债务
    lines.append('')
    lines.append('## 结构性债务（已知）')
    lines.append('- H2 开源项目 1000+ 条为"混合袋"：含接近产品形态的个人项目（heym、graph-ai），边界判定见对应 INDEX')
    lines.append('- 名字不带 mcp 的桥类可能仍留在 H2（talktofigma 已记录）——分层 v3 应做穷举审计')
    lines.append('- H5/H6 未评分（模板/研究验证语义不同）——如需要可比性，另立指标')
    lines.append('- 3 个 PS1 维护脚本已适配新树但未在 pwsh 实机验证')
    return '\n'.join(lines) + '\n'

def write(path, content):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    open(path, 'w', encoding='utf-8').write(content)

# ---------- main ----------
for life_key, life_dirn in [('active', '01-active'), ('archived', '02-archived')]:
    life_dir = os.path.join('projects', life_dirn)
    write(os.path.join(life_dir, 'INDEX.md'), life_index(life_dir, life_key))
    for layer_key in ['H1','H2','H3','H4','H5','H6']:
        content, d, slugs = layer_index(life_dir, layer_key, life_key)
        write(os.path.join(d, 'INDEX.md'), content)
        if layer_key in ('H1','H2','H3','H4'):
            for b in BAND:
                band_slugs = [s for s in slugs if band_of(s) == b]
                if not band_slugs:
                    continue
                bd = os.path.join(d, b)
                write(os.path.join(bd, 'INDEX.md'), band_index(life_dir, layer_key, life_key, b, band_slugs))
                # form sub-dirs
                fdist = Counter(census[s]['product_form'] for s in band_slugs)
                for f, cnt in fdist.items():
                    fd = os.path.join(bd, f)
                    os.makedirs(fd, exist_ok=True)
                    form_slugs = [s for s in band_slugs if census[s]['product_form'] == f]
                    write(os.path.join(fd, 'INDEX.md'), form_index(fd, f, form_slugs))
        else:
            # H5/H6: no band dir; write form INDEX directly
            fdist = Counter(census[s]['product_form'] for s in slugs)
            for f in FORMS:
                fs = [s for s in slugs if census[s]['product_form'] == f]
                if not fs: continue
                fd = os.path.join(d, f)
                os.makedirs(fd, exist_ok=True)
                write(os.path.join(fd, 'INDEX.md'), form_index(fd, f, fs))

write(os.path.join('projects', 'README.md'), top_index())

# report
n = sum(1 for root, _, files in os.walk('projects') if 'INDEX.md' in files)
print('INDEX.md files generated:', n)
print('projects/README.md written')
EOF_CHECK = True