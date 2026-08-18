# AI Revit Family Maker

> Research status: **Source-level** · Lifecycle: **active-transition** · Last reviewed: **2026-08-12**

AI Revit Family Maker defines AI-assisted BIM design as a typed request that must survive two runtimes: a Pydantic agent produces a constrained family specification and an Autodesk Design Automation AppBundle materializes and flex-tests the Revit family.

## Typed intent crosses the cloud execution boundary

At commit [`d250bab`](https://github.com/blueray32/ai-revit-family-maker/tree/d250babe48692e3d35a9683fb1de8b1f2b81b8a9) [`revit_family_maker/agent.py`](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/revit_family_maker/agent.py) gathers text and image intent into typed dependencies and tools. [`aps_client.py`](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/revit_family_maker/aps_client.py) submits a job while the C# [FamilyCreator](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/RevitAppBundle/FamilyCreator.cs) creates native Revit objects.

The [FlexTester](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/RevitAppBundle/FlexTester.cs) checks parameter combinations before delivery. The `.rfa` family is the native artifact; request JSON logs and previews are supporting evidence.

## Operational caveat

The repository contains substantial deployment notes and generated planning material alongside working code. Autodesk credentials AppBundle registration and a Revit runtime are required; a source audit cannot confirm every cloud deployment claim. The maintainer profile lists Ireland.

## Pinned evidence

- [Family parameter model](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/RevitAppBundle/Models/FamilyParameters.cs)
- [APS activity definition](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/deployment/aps_activity.json)
- [Pinned README](https://github.com/blueray32/ai-revit-family-maker/blob/d250babe48692e3d35a9683fb1de8b1f2b81b8a9/README.md)
