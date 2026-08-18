# SymXplorer

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

SymXplorer combines symbolic circuit reasoning with machine-learning and evolutionary exploration. It is not an LLM agent: its AI contribution is Bayesian or evolutionary search over an explicit analog design space.

## Symbolic topology and numerical sizing are different layers

At commit [`a241742`](https://github.com/NooriDan/SymXplorer/tree/a241742ddcb4112e88d80d77e3af1d8add45b1d2) SymPy-derived transfer functions and topology models define what a circuit means. [`bayesian_ax.py`](https://github.com/NooriDan/SymXplorer/blob/a241742ddcb4112e88d80d77e3af1d8add45b1d2/src/symxplorer/designer_tools/bayesian_ax.py) and [`evolutionary_nevergrad.py`](https://github.com/NooriDan/SymXplorer/blob/a241742ddcb4112e88d80d77e3af1d8add45b1d2/src/symxplorer/designer_tools/evolutionary_nevergrad.py) explore component choices while SPICE evaluates candidates.

Project YAML defines objectives constraints measurements and parameter bounds. Visualizers expose trade-offs and reports preserve results. The repository now directs new SPICE-in-the-loop sizing work to SpiceXplorer; SymXplorer remains the symbolic topology authority and is therefore marked active-transition rather than merged with its successor.

The maintainer's first-party profile lists Canada.

## Evidence

- [Project setup example](https://github.com/NooriDan/SymXplorer/blob/a241742ddcb4112e88d80d77e3af1d8add45b1d2/examples/5t-ota/ihp-sg13g2/spice/project_setup.yaml)
- [Design-space visualizer](https://github.com/NooriDan/SymXplorer/blob/a241742ddcb4112e88d80d77e3af1d8add45b1d2/src/symxplorer/designer_tools/visualizer.py)
- [Pinned README](https://github.com/NooriDan/SymXplorer/blob/a241742ddcb4112e88d80d77e3af1d8add45b1d2/README.md)
