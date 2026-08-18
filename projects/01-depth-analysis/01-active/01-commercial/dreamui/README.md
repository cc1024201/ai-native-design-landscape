# DreamUI

DreamUI answers "what is design" with one editable Figma graph that many different artifact loops write into. It is a single plugin surface by Noor Maqsood spanning prompt-to-screen, connected product flows, selected-layer chat editing, screenshot and HTML reconstruction, variants, critique, tokens and history. The point is that every path ends in native Figma layers the user can keep editing.

The decisive mechanism is that all these operations converge on a mutable native graph: a prompt or a screenshot or selected layers all produce editable Figma output, which then feeds chat edit, critique, continuation, variants, a UI kit or code. Generation history lets previous runs be restored or remixed back into the graph. Native editability is the strongest evidence available because the hosted implementation is closed — node identity across turns, token extraction, variant lineage and history persistence are not public.

The non-AI utilities (contrast checking, Iconify insertion) sit on the same surface but are not agentic behavior, which keeps the boundary honest. Creator identity is public while team location is not, so region is unknown.

- [Creator's complete feature announcement](https://forum.figma.com/showcase-your-work-14/dreamui-figma-plugin-by-noor-maqsood-56341)
- [Figma Community plugin](https://www.figma.com/community/plugin/1656620010944492160/dreamui-ai-ui-generator-design-system-wireframe-generator-ai-design-copilot-tokens-html)
