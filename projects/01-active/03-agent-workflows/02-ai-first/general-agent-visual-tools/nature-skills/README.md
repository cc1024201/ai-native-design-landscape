# nature-skills

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

`nature-skills` is a collection of Claude skills grounded in journal guidance and published-paper observations. Its Design surface combines publication figure authoring with paper-to-presentation transformation; other skills for prose, citation and data statements remain supporting parts of the same collection.

## Figure design begins with an information contract

`nature-figure` classifies chart families and establishes typography, semantic color, journal size and panel purpose before plotting. It requires an information hierarchy across panels and rejects redundant panels that answer the same question. Matplotlib or R source plus source data remains the reproducible authority.

Primary SVG keeps text as `<text>` nodes; PNG at 300 dpi is a secondary preview. Figure QA reviews both source rules and the rendered composition. `nature-paper2ppt` extends a paper into an editable presentation workflow, but does not turn the figure preview into a second canonical dataset.

## Collection and evidence boundary

The repository's rules cite primary publication and author-guideline observations, but “Nature-style” is a maintained interpretation rather than journal certification. Examples use simulated data and demonstrate the contract; they do not validate a user's scientific claims.

- [Pinned nature-skills revision](https://github.com/niuz257470-ctrl/natureskills/tree/bbd6a0cdd5ef81ca48ec8f7fb494e5d01fc26160)
- [Figure skill](https://github.com/niuz257470-ctrl/natureskills/blob/bbd6a0cdd5ef81ca48ec8f7fb494e5d01fc26160/nature-figure/SKILL.md)
- [Figure QA contract](https://github.com/niuz257470-ctrl/natureskills/blob/bbd6a0cdd5ef81ca48ec8f7fb494e5d01fc26160/nature-figure/references/qa-contract.md)
- [Paper-to-PowerPoint skill](https://github.com/niuz257470-ctrl/natureskills/blob/bbd6a0cdd5ef81ca48ec8f7fb494e5d01fc26160/nature-paper2ppt/SKILL.md)
