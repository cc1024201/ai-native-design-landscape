#!/usr/bin/env python3
"""Layer-wise AI-native score report from data/entity-layers.csv + data/ai-native-scores.csv."""
import csv, statistics as st
from collections import defaultdict, Counter

layers = []
for r in csv.DictReader(open('data/entity-layers.csv')):
    layers.append(r)
scores = {r['slug']: r for r in csv.DictReader(open('data/ai-native-scores.csv'))}

by = defaultdict(list)
for r in layers:
    s = scores.get(r['slug'])
    if s: by[r['layer']].append((r['slug'], r['product'], float(s['total']), s))

order = ['H1','H2','H3','H4','H5','H6']
names = {'H1':'完整商业/托管产品','H2':'开源应用/项目','H3':'agent 工作流/skill 包','H4':'连接与桥接层','H5':'模板/脚手架/示例','H6':'研究原型/评估/验证'}
print("== 每层 AI-native 分数（统一分数仅层内有意义）==")
for k in order:
    items = by[k]
    if not items: continue
    ts = sorted(t for _,_,t,_ in items)
    n = len(ts)
    med = st.median(ts)
    hi = sum(1 for t in ts if t >= 7)
    bucket = Counter(('9+' if t>=9 else '7-8.9' if t>=7 else '4-6.9' if t>=4 else '1-3.9') for t in ts)
    print(f"\n{k} {names[k]}  n={n}  中位={med:.1f}  ≥7:{hi}({100*hi/n:.0f}%)  {dict(bucket)}")
    top = sorted(items, key=lambda x:-x[2])[:8]
    print("   top:", ', '.join(f"{s}({t:.1f})" for s,_,t,_ in top))
    low = sorted(items, key=lambda x:x[2])[:3]
    print("   low:", ', '.join(f"{s}({t:.1f})" for s,_,t,_ in low))
# cross-layer sanity: H4 ceiling violations
print("\n== H4 连接层中 total>=4 的条目（按封顶规则应≤3.5 复核）==")
for k in ['H4','H5','H6']:
    viol = sorted([(t,s) for s,_,t,_ in by[k] if t>=4], reverse=True)
    print(f"{k} 违反封顶条数: {len(viol)}")
    print("   ", ', '.join(f"{s}({t})" for t,s in viol[:10]))