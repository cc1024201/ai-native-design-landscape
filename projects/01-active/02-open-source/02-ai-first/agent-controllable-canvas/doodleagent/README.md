# Doodle Agent

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Doodle Agent is research software but not paper-only evidence. The repository contains a runnable interactive system in which a multimodal model repeatedly sees and changes a real drawing canvas.

## Perception and action share one loop

[FreeDrawingAgent](https://github.com/YIFANK/DoodleAgent/blob/d2563c629d94288586db0280dc02351af3306ec2/free_drawing_agent.py) sends the current canvas image and drawing context to Claude or GPT-4o and parses a brush color and coordinate sequence. [DrawingCanvasBridge](https://github.com/YIFANK/DoodleAgent/blob/d2563c629d94288586db0280dc02351af3306ec2/drawing_canvas_bridge.py) translates those coordinates into browser events on a p5.js canvas.

## Iteration is the correction mechanism

After every stroke batch the system captures the changed canvas and gives that new visual state to the next model call. Mood abstract and free-creation modes vary the prompt but retain the same perception-decision-action cycle.

## User-obtainable artifacts

The command-line demo lets a user choose provider mode run length and creative mode. It saves intermediate and final PNGs alongside parsed instructions stroke histories and session logs. Those outputs establish an ordinary-user creative loop even though the project was built for an evaluation study.

## Limits

The disabled interactive-question menu means most current runs use predefined creative prompts. Selenium drives a local browser and there is no project persistence collaboration or editable version graph. Some checked-in output files are experiment results rather than application source.

## Pinned evidence

- [Repository](https://github.com/YIFANK/DoodleAgent)
- [Inspected tree](https://github.com/YIFANK/DoodleAgent/tree/d2563c629d94288586db0280dc02351af3306ec2)
- [Runnable demo](https://github.com/YIFANK/DoodleAgent/blob/d2563c629d94288586db0280dc02351af3306ec2/demo_free_canvas.py)
- [Canvas implementation](https://github.com/YIFANK/DoodleAgent/blob/d2563c629d94288586db0280dc02351af3306ec2/wisteria.html)
