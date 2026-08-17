# AI Website Generator by Nithin1616

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This Streamlit application asks Gemini for three explicitly delimited source artifacts and uses the same extracted files for visual proof and delivery.

[`ai_generator.py`](https://github.com/Nithin1616/ai-website-generator/blob/87ad51553e3de4be2f992365774ac26353353c8a/services/ai_generator.py) combines page type and content in a LangChain prompt whose response contract separates HTML, CSS and JavaScript. [`utils.py`](https://github.com/Nithin1616/ai-website-generator/blob/87ad51553e3de4be2f992365774ac26353353c8a/utils.py) extracts each repeated delimiter and rejects the result operationally when HTML is absent.

[`app.py`](https://github.com/Nithin1616/ai-website-generator/blob/87ad51553e3de4be2f992365774ac26353353c8a/app.py) concatenates the three strings for an embedded Streamlit preview, writes them as `index.html`, `style.css` and `script.js`, and packages those exact files as a ZIP. The filesystem is a transient delivery stage and the inspected app has no saved project or version history.

## Evidence

- [Canonical repository](https://github.com/Nithin1616/ai-website-generator)
- [Inspected tree](https://github.com/Nithin1616/ai-website-generator/tree/87ad51553e3de4be2f992365774ac26353353c8a)
- Commit: `87ad51553e3de4be2f992365774ac26353353c8a`
