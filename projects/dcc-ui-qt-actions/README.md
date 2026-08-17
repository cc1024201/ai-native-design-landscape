# DCC-MCP Qt UI Actions

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

DCC-MCP Qt UI Actions is an installable correction layer for legacy PySide/PyQt tools that lack an agent-friendly API. It prefers stable widget identity and QAction semantics; screen coordinates are deliberately not its primary contract.

## Selector-bound mutation with visual return evidence

The package can click a matched widget, trigger an action, set a value and process the host event loop. [`_qt_actions.py`](https://github.com/dcc-mcp/dcc-ui-qt-actions/blob/0d1ee9475e47d2e9212dbd9e8ce42ad76e09ac22/skill/qt-ui-actions/scripts/_qt_actions.py) centralizes host lookup and validation so each tool does not invent its own unsafe selector behavior.

[`screenshot_widget.py`](https://github.com/dcc-mcp/dcc-ui-qt-actions/blob/0d1ee9475e47d2e9212dbd9e8ce42ad76e09ac22/skill/qt-ui-actions/scripts/screenshot_widget.py) captures the exact widget after a change. The companion inspector is useful for discovery but remains read-only and is not counted separately; this Actions package is where an ordinary correction loop becomes possible.

## Evidence

- [Pinned action package](https://github.com/dcc-mcp/dcc-ui-qt-actions/tree/0d1ee9475e47d2e9212dbd9e8ce42ad76e09ac22)
- [Skill contract](https://github.com/dcc-mcp/dcc-ui-qt-actions/blob/0d1ee9475e47d2e9212dbd9e8ce42ad76e09ac22/skill/qt-ui-actions/SKILL.md)
- [Typed tool manifest](https://github.com/dcc-mcp/dcc-ui-qt-actions/blob/0d1ee9475e47d2e9212dbd9e8ce42ad76e09ac22/skill/qt-ui-actions/tools.yaml)
