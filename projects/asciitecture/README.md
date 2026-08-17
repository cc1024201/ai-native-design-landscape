# Asciitecture

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

Asciitecture's technical bet is unusually simple: ASCII is both a visual material and an agent interface. People arrange web controls or diagram shapes on a canvas; the output remains legible text that can be reviewed in Markdown and handed to a coding assistant.

## The export is the interface

At commit [`5532f10a`](https://github.com/AnimaDigitalSolutions/Asciitecture/tree/5532f10adb7d5361a6d8fe52cae8f9d503352ec7) [`Canvas`](https://github.com/AnimaDigitalSolutions/Asciitecture/blob/5532f10adb7d5361a6d8fe52cae8f9d503352ec7/src/components/Canvas.jsx) holds positioned components and renders the ASCII composition. Local storage autosaves the working tabs. Export produces Markdown rather than a proprietary scene package.

The repository does not contain a hidden autonomous agent. Its AI-native boundary is an explicit handoff contract: [`AI_GUIDE`](https://github.com/AnimaDigitalSolutions/Asciitecture/blob/5532f10adb7d5361a6d8fe52cae8f9d503352ec7/AI_GUIDE.md) and template libraries explain the visual vocabulary to an external model. That modest boundary is why it is classified as a general agent visual tool rather than delegated creation.

```text
drag visual components → ASCII scene → Markdown prompt/context → coding agent
          ↑                                             │
          └──────── human edits the returned idea ──────┘
```

No share backend or Git integration is implemented; the artifact is local browser state plus exported text. The organization profile provides no region.

## Evidence

- [Pinned README](https://github.com/AnimaDigitalSolutions/Asciitecture/blob/5532f10adb7d5361a6d8fe52cae8f9d503352ec7/README.md)
- [AI-facing template vocabulary](https://github.com/AnimaDigitalSolutions/Asciitecture/blob/5532f10adb7d5361a6d8fe52cae8f9d503352ec7/src/lib/ai-templates.js)
- [Diagram templates](https://github.com/AnimaDigitalSolutions/Asciitecture/blob/5532f10adb7d5361a6d8fe52cae8f9d503352ec7/src/lib/ai-diagram-templates.js)
