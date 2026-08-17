# AI Website Generator by GururajCharan

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This is a deliberately small Streamlit website generator. Its entire authority chain is visible in one file: prompt submission model invocation source cleanup filesystem materialization visual preview and ZIP delivery.

## Gemini writes one self-contained page

[`website_file.py`](https://github.com/GururajCharan/AI_Website_Generator/blob/45ad3b0c0c2b931ec716af8070a1c42505bf7061/website_file.py) sends the user's text to a Gemini chat model under a contract for embedded HTML CSS and JavaScript. It strips markdown fences but otherwise treats the returned document as authoritative source; there is no intermediate schema or component governance layer.

## Preview and download share the same file

The app writes that response to `index.html`, places the file in `website.zip` and passes the in-memory source to Streamlit's HTML component for visual proof. Because the fixed filenames are overwritten on each run and no project store exists, the inspected implementation provides delivery but neither session isolation nor version recovery.

## Evidence

- [Canonical repository](https://github.com/GururajCharan/AI_Website_Generator)
- [Inspected tree](https://github.com/GururajCharan/AI_Website_Generator/tree/45ad3b0c0c2b931ec716af8070a1c42505bf7061)
- Commit: `45ad3b0c0c2b931ec716af8070a1c42505bf7061`
