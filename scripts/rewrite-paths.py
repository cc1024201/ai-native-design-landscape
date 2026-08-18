#!/usr/bin/env python3
"""Rewrite all references to old flat projects/<slug> paths to the new layered paths."""
import csv, sys, os

REPO = '/home/zhcao/ai-native-design-landscape'
os.chdir(REPO)

moves = []
for line in open('/tmp/moves.tsv'):
    old, new, *_rest = line.rstrip('\n').split('\t')
    moves.append((old, new))
# longest-first so nested slugs replace correctly
moves.sort(key=lambda x: -len(x[0]))

# files to rewrite (path, keep_trailing_slash for markdown links)
targets = []
for f in ['README.md', 'EVIDENCE_ATLAS.md', 'AI-NATIVE.md', 'LAYERS.md', 'LIFECYCLE.md', 'CONTRIBUTING.md', 'PROJECT_TEMPLATE.md']:
    p = os.path.join(REPO, f)
    if os.path.exists(p): targets.append((p, False))
for f in ['candidates.csv']:
    targets.append((os.path.join(REPO, 'data', f), False))

total_repl = 0
for path, _keep_slash in targets:
    text = open(path, encoding='utf-8').read()
    n = 0
    for old, new in moves:
        # replace projects/<slug> and projects/<slug>/ variants
        count = text.count(old)
        if count:
            text = text.replace(old, new)
            n += count
    open(path, 'w', encoding='utf-8').write(text)
    print(f'{os.path.relpath(path)}: {n} replacements')
    total_repl += n
print('TOTAL replacements:', total_repl)