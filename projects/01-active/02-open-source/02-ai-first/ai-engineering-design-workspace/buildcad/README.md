# BuildCAD

> Research status: **Architecture-level** · Last reviewed: **2026-08-12**

| Field | Value |
|---|---|
| Team | BuildCAD AI · team region not established |
| Ordinary job | create and review parametric engineering geometry in the cloud or through an external agent |
| Authority | saved BuildCAD model until standard or host-native export |
| Agent interfaces | built-in chat and MCP connector |
| Lifecycle | active |

## Two agent paths target one cloud model

The in-app agent interprets dimensions materials tolerances and manufacturing constraints then builds browser-previewable CAD. A team can request changes and review designs together with cloud version history. The MCP connector lets Claude Cursor or another client create preview and save models using the user's external subscription.

Delivery covers STEP IGES STL OBJ glTF DXF and claimed native files for SolidWorks AutoCAD and Fusion 360. These formats carry different levels of editability; the public site does not prove that every parametric relationship survives every target. The browser model remains the only directly evidenced shared authority before export.

Claims about validation against manufacturing constraints production readiness and industry adoption are not independently tested here. The implementation geometry kernel MCP schema and revision model are closed.

## Primary evidence

- [BuildCAD browser agent and export workflow](https://buildcad.ai/)
- [BuildCAD MCP connector](https://buildcad.ai/mcp)
