#!/usr/bin/env python3
"""Finalize entity-layer classification for all 1504 records.

Layers (H1..H6) with priority order and evidence sources:
  H5 templates/scaffolds      slug pattern
  H4 connection/bridge        slug pattern | product_form | architecture
  H6 research/eval/verify     slug pattern | product_form
  H3 agent workflow/skill     slug/name pattern (skill only, not workflow-builder products)
  H1 commercial product       product_form + organization whitelist + open-core whitelist + subagent review
  H2 open-source project      everything remaining
"""
import csv, re, json, sys
from collections import Counter

ROOT = '/home/zhcao/ai-native-design-landscape'
rows = list(csv.DictReader(open(f'{ROOT}/data/census.csv')))

# --- override map: slug -> layer from subagent review (readable JSON) ---
def load_overrides(path):
    if not path: return {}
    txt = open(path).read()
    # find first [ ... ] block
    start, end = txt.find('['), txt.rfind(']')
    if start == -1 or end == -1:
        print(f'!! no JSON array in {path}', file=sys.stderr); return {}
    try:
        arr = json.loads(txt[start:end+1])
    except Exception as e:
        print(f'!! JSON parse fail {path}: {e}', file=sys.stderr)
        # try to salvage partial array lines
        arr = []
        for line in txt.splitlines():
            line = line.strip().rstrip(',')
            if line.startswith('{') and line.endswith('}'):
                try: arr.append(json.loads(line))
                except Exception: pass
    return {o.get('slug'): (o.get('layer'), o.get('reason','')) for o in arr if o.get('slug')}

OVERRIDES = {}
# entity-layers.csv is the authoritative result (it already contains the
# human boundary-review conclusions in its 'basis' column). Overrides are
# optional inputs for regeneration only.
_override_paths = [p for p in sys.argv[1:] if p.endswith('.json')]
for p in _override_paths:
    OVERRIDES.update(load_overrides(p))
    print(f'loaded overrides from {p}: {len(OVERRIDES)} entries', file=sys.stderr)

# --- constants ---
COMPANIES = set('''google figma bytedance anthropic builder-io wix miro microsoft vercel lovable github anything stackblitz metagpt subframe flutterflow alloy magic-patterns baidu onlook tempo-labs stagewise superdesign galileo-ai framer relume webflow canva motiff gamma etlaq-sa primo uno-platform penpot silex-labs fleck paraflow botlab-art hostinger ux-pilot ai-ui-designer mastergo modao jsdesign boardmix faisca adobe adly wonder banani uxcanvas dmaya youware gendesigns adalo squarespace one-com dualite we0 rocket-new aidesigner komposo pixello quby jenova ux-studio-ai holst-ai easeui appy-pie deepshot-inc pptcraft influencer-studio slidex zoea story recraft kittl dafty dressx orbis-intelligence tapcanvas uxbot autocraft backdraft mowgli-ai uitiful websim-inc soulcanvas aipto devwares step1 dawnlabs prompt-to-app usertesting pegasystems draftbit statecraft designflow figr caliper codecanvas-ai qoqo dreamui superun dora glide-design taploop heygen onlyoffice databricks comfy-org blackmagic-design mermaid chartdb learnhouse dbx tabularisdb tooljet teable budibase drupal flowiseai run-llama frappe mobirise playcode openinterface swark-io codoptic calcstack rocketride ineron contextui-desktop tylina scifig shape caret opsima tencent cloudflare firecrawl sensenova nyno superinterface openui openflowkit locofy codia langflow ragflow tldraw puck onui windframe draftbit fracta-agent-builder tesslate-agent-builder tessra comfyui remotion'''.split())

OPEN_CORE = set('''puck tldraw openflowkit locofy codia openui superinterface openflow-ai-studio langflow tesslate-agent-builder fracta-agent-builder ragflow nyno tessra comfyui remotion drawio-mcp affine onshape-mcp bulletproof-prompt-to-app windframe draftbit flowise budibase tooljet teable n8n'''.split())

H1_FORMS = {'standalone-design-agent','ai-app-site-builder','established-visual-platform','code-native-visual-ide'}

def layer_rule(r):
    s = r['slug'].lower(); name = (r['product'] or '').lower()
    pf = r['product_form']; arch = r['primary_architecture']
    if re.search(r'template|starter|example|scaffold|boilerplate|clone', s): return 'H5'
    if re.search(r'mcp|adapter|bridge|relay|connector', s) or pf=='runtime-overlay-bridge' or arch=='runtime-intent-relay': return 'H4'
    if re.search(r'bench|research|eval|audit|inspect|verify|verification|benchmark|reviewer|review|audit-lens|inspection', s): return 'H6'
    if re.search(r'skill', s) or re.search(r'skill', name): return 'H3'
    if pf in H1_FORMS: return 'H1'
    return 'H2'

def final_layer(r):
    s = r['slug']
    if s in OVERRIDES:
        return OVERRIDES[s][0], 'override:' + OVERRIDES[s][1][:80]
    L = layer_rule(r)
    o = (r['organization'] or '').lower()
    # Global company rule: a record owned by a recognized company/team org is a commercial product,
    # regardless of which product_form its census row uses (fixes known products landing in H2).
    # Skill/workflow packs and bridges keep their rule layer even when company-owned.
    if L == 'H2' and o in COMPANIES:
        return 'H1', f'company org ({o})'
    if L == 'H1':
        if s in OPEN_CORE or o in COMPANIES:
            return 'H1', 'commercial/company or open-core'
        if re.match(r'^[a-z0-9]+(-[a-z0-9]+)+$', o) and '-' in o and o not in COMPANIES:
            return 'H2', f'personal/community org ({o})'
        return 'H1', 'product_form=' + r['product_form']
    return L, 'pattern'

out = []
for r in rows:
    L, basis = final_layer(r)
    out.append((r['slug'], r['product'], r['organization'], r['product_form'], r['evidence_depth'], L, basis))

# write csv
with open(f'{ROOT}/data/entity-layers.csv', 'w', newline='') as fh:
    w = csv.writer(fh)
    w.writerow(['slug','product','organization','product_form','evidence_depth','layer','basis'])
    for row in sorted(out, key=lambda x: (x[5], x[0])):
        w.writerow(row)

c = Counter(x[5] for x in out)
print('layer distribution:')
for k in ['H1','H2','H3','H4','H5','H6']:
    print(f'  {c.get(k,0):>4}  {k}')