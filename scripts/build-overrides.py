#!/usr/bin/env python3
"""Rebuild the 184 boundary-review overrides deterministically.

- Reviewer A (92 slugs): from scripts/overrides-a.json (fixed, audited, archived in-session).
- Reviewer B (92 slugs): rebuilt by splitting the deterministic ambiguous list; B reported
  5 H1 (dyad, hanzo-app, redesignr-ai, totalum-ai-app-builder, greatstack-ai-website-builder)
  and 87 H2; those 5 are pinned here, the rest are H2.

Output: scripts/overrides.json (184 entries) consumed by finalize-layers.py.
"""
import csv, re, json, sys

ROOT = '/home/zhcao/ai-native-design-landscape'
rows = list(csv.DictReader(open(f'{ROOT}/data/census.csv')))

def layer(r):
    s = r['slug'].lower(); name = r['product'].lower(); pf = r['product_form']; arch = r['primary_architecture']
    if re.search(r'template|starter|example|scaffold|boilerplate|clone', s): return 'H5'
    if re.search(r'mcp|adapter|bridge|relay|connector', s) or pf == 'runtime-overlay-bridge' or arch == 'runtime-intent-relay': return 'H4'
    if re.search(r'skill|workflow', s) or 'skills' in name or re.search(r'design-?md', s): return 'H3'
    if re.search(r'bench|research|eval|audit|inspect|verify|verification|benchmark|reviewer|review-gate', s): return 'H6'
    if pf in ('standalone-design-agent', 'ai-app-site-builder', 'established-visual-platform', 'code-native-visual-ide'): return 'H1'
    return 'H2'

COMPANIES = set('''google figma bytedance anthropic builder-io wix miro microsoft vercel lovable github anything stackblitz metagpt subframe flutterflow alloy magic-patterns baidu onlook tempo-labs stagewise superdesign galileo-ai framer relume webflow canva motiff gamma etlaq-sa primo uno-platform penpot silex-labs fleck paraflow botlab-art hostinger ux-pilot ai-ui-designer mastergo modao jsdesign boardmix faisca adobe adly wonder banani uxcanvas dmaya youware gendesigns adalo squarespace one-com dualite we0 rocket-new aidesigner komposo pixello quby jenova ux-studio-ai holst-ai easeui appy-pie deepshot-inc pptcraft influencer-studio slidex zoea story recraft kittl dafty dressx orbis-intelligence tapcanvas uxbot autocraft backdraft mowgli-ai uitiful websim-inc soulcanvas aipto devwares step1 dawnlabs prompt-to-app usertesting pegasystems draftbit statecraft designflow figr caliper codecanvas-ai qoqo dreamui superun dora glide-design taploop heygen onlyoffice databricks comfy-org blackmagic-design mermaid chartdb learnhouse dbx tabularisdb tooljet teable budibase drupal flowiseai run-llama frappe mobirise playcode openinterface swark-io codoptic calcstack rocketride ineron contextui-desktop tylina scifig shape caret opsima tencent cloudflare firecrawl sensenova'''.split())
PERSONAL = re.compile(r'^[a-z]+(-[a-z]+)*(-[0-9]+)?$|^[a-z]+[0-9]{2,}$')

h1 = [r for r in rows if layer(r) == 'H1']
def kind(r):
    o = r['organization'].lower()
    if o in COMPANIES: return 'co'
    if PERSONAL.match(o) and '-' in o: return 'pers'
    return 'amb'
amb = [r['slug'] for r in h1 if kind(r) == 'amb']
assert len(amb) == 184, f"ambiant list changed: {len(amb)}"

half = len(amb) // 2  # 92
amb_a, amb_b = amb[:half], amb[half:]

A = json.load(open(f'{ROOT}/scripts/overrides-a.json'))
assert len(A) == 92 and {o['slug'] for o in A} == set(amb_a), "reviewer A mismatch with rebuilt split"

B_H1 = {'dyad', 'hanzo-app', 'redesignr-ai', 'totalum-ai-app-builder', 'greatstack-ai-website-builder'}
assert B_H1 <= set(amb_b)
B = [{'slug': s, 'layer': 'H1', 'reason': '官方产品页/公司运营/托管服务证据（复核汇总）'} if s in B_H1 else
     {'slug': s, 'layer': 'H2', 'reason': '个人或社区维护、可自托管部署的开源项目（复核汇总）'} for s in amb_b]

out = A + B
json.dump(out, open(f'{ROOT}/scripts/overrides.json', 'w'), ensure_ascii=False, indent=1)
print(f'overrides.json written: {len(out)} entries '
      f'({sum(1 for o in out if o["layer"]=="H1")} H1, '
      f'{sum(1 for o in out if o["layer"]=="H2")} H2, '
      f'{sum(1 for o in out if o["layer"]=="H3")} H3, '
      f'{sum(1 for o in out if o["layer"]=="H4")} H4)')