#!/usr/bin/env python3
"""Verify integrity of the data layer: census, organizations, identity map,
candidates, discovery batches, taxonomy refs, and slug <-> tree path mapping.

Python port of the removed verify-census.ps1 (kept the checks that matter for a
Linux environment; dropped the deleted README-registry and derived-count logic).

Usage: python3 scripts/verify-census.py   (exits non-zero on any error)
"""
import csv, json, os, re, sys
from collections import Counter

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
errors = []

def rows(name):
    p = os.path.join(REPO, 'data', name)
    if not os.path.exists(p):
        errors.append(f'missing data/{name}'); return []
    return list(csv.DictReader(open(p)))

def check(cond, msg):
    if not cond: errors.append(msg)

census = rows('census.csv')
organizations = rows('organizations.csv')
identity = rows('identity-map.csv')
candidates = rows('candidates.csv')
batches = rows('discovery-batches.csv')
taxonomy = json.load(open(os.path.join(REPO, 'data', 'taxonomy.json')))
slug_paths = json.load(open(os.path.join(REPO, 'data', 'slug-paths.json')))

# --- census ---
req = ['slug','product','team_lineage','organization','primary_definition',
       'product_form','primary_architecture','evidence_depth','lifecycle']
seen = Counter(r['slug'] for r in census)
for slug, n in seen.items():
    if n > 1: check(False, f"duplicate census slug '{slug}'")
known_defs = {x['id'] for x in taxonomy.get('designDefinitions', [])}
known_forms = {x['id'] for x in taxonomy.get('productForms', [])}
known_arch = {x['id'] for x in taxonomy.get('architectureFamilies', [])}
for r in census:
    for f in req:
        check(bool(r.get(f)), f"{r.get('slug','?')}: empty required field '{f}'")
    for fld, known in (('primary_definition', known_defs), ('product_form', known_forms), ('primary_architecture', known_arch)):
        check(r.get(fld) in known, f"{r.get('slug','?')}: unknown {fld} '{r.get(fld)}'")
    for aid in r['additional_definitions'].split('|'):
        if aid: check(aid in known_defs, f"{r.get('slug','?')}: unknown additional definition '{aid}'")
    for aid in r['additional_architectures'].split('|'):
        if aid: check(aid in known_arch, f"{r.get('slug','?')}: unknown additional architecture '{aid}'")
    extras = [x for x in r['additional_definitions'].split('|') if x]
    if r['primary_definition'] in extras:
        check(False, f"{r['slug']}: primary definition repeated in additional_definitions")
    if r['primary_architecture'] in r['additional_architectures'].split('|'):
        check(False, f"{r['slug']}: primary architecture repeated in additional_architectures")
    check(r['evidence_depth'] in ('source','architecture'), f"{r['slug']}: bad evidence_depth")
    check(r['lifecycle'] in ('active','active-transition','historical','sunsetting'), f"{r['slug']}: bad lifecycle")

# --- organizations ---
org_ids = Counter(r['id'] for r in organizations)
for o, n in org_ids.items():
    if n > 1: check(False, f"duplicate organization id '{o}'")
census_orgs = {r['organization'] for r in census}
for r in organizations:
    check(r['id'] in census_orgs, f"organization '{r['id']}' has no census record")
for o in census_orgs - set(org_ids):
    check(False, f"census organization '{o}' missing from organizations.csv")

# --- identity map ---
names = Counter(r['encountered_name'] for r in identity)
for k, n in names.items():
    if n > 1: check(False, f"identity map repeats encountered name '{k}'")

# --- discovery batches ---
bids = Counter(r['batch_id'] for r in batches)
for b, n in bids.items():
    if n > 1: check(False, f"discovery batch repeats id '{b}'")

# --- candidates ---
statuses = {'pending','included','duplicate','excluded'}
cids = Counter(r['candidate_id'] for r in candidates)
for c, n in cids.items():
    if n > 1: check(False, f"candidate register repeats id '{c}'")
for r in candidates:
    st = r['status']
    check(st in statuses, f"candidate '{r['candidate_id']}': unknown status '{st}'")
    check(r['first_seen_batch'] in bids, f"candidate '{r['candidate_id']}': unknown first_seen_batch")
    if r['team_region'] not in ('unknown','') and not r['region_evidence_url']:
        check(False, f"candidate '{r['candidate_id']}': region without evidence url")
    if r['discovery_url'] and not r['discovery_url'].startswith(('http://','https://','github.com')):
        p = os.path.join(REPO, r['discovery_url'].replace('/','/'))
        check(os.path.exists(p), f"candidate '{r['candidate_id']}': missing local evidence")
    # resolution
    target = r['resolution_target']
    if st == 'included':
        m = re.match(r'^census:(.+)$', target or '')
        check(bool(m), f"included candidate '{r['candidate_id']}' must resolve census:<slug>")
        if m: check(m.group(1) in seen, f"included candidate '{r['candidate_id']}' -> missing census slug")
    elif st == 'duplicate':
        if not target:
            check(False, f"duplicate candidate '{r['candidate_id']}' has no resolution target")
        else:
            m = re.match(r'^census:(.+)$', target)
            if m:
                check(m.group(1) in seen, f"duplicate candidate resolves to missing census slug")
            else:
                m2 = re.match(r'^candidate:(cand-.+)$', target) or re.match(r'^(cand-.+)$', target)
                check(bool(m2), f"duplicate candidate invalid target '{target}'")
                if m2:
                    tid = m2.group(1)
                    check(tid in cids, f"duplicate candidate resolves to missing candidate '{tid}'")
                    check(tid != r['candidate_id'], f"duplicate candidate resolves to itself")
    elif st in ('pending','excluded'):
        check(not target, f"candidate '{r['candidate_id']}' with status '{st}' must not have resolution target")

# --- slug <-> tree path ---
for slug, rel in slug_paths.items():
    p = os.path.join(REPO, 'projects', rel, 'README.md')
    check(os.path.exists(p), f"census slug '{slug}' has no dossier at projects/{rel}")
census_slugs = {r['slug'] for r in census}
extra = set(slug_paths) - census_slugs
missing = census_slugs - set(slug_paths)
for x in extra: check(False, f"slug-path entry '{x}' not in census")
for x in missing: check(False, f"census slug '{x}' missing from slug-paths")

if errors:
    print(f"verify-census: {len(errors)} error(s):")
    for e in errors[:50]:
        print('  -', e)
    sys.exit(1)
print('Landscape verification passed.')
