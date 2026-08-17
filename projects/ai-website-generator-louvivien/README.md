# AI Website Generator by Louvivien

> Research status: **Source-level** · Lifecycle: **historical** · Last reviewed: **2026-08-12**

This early generator joins two model outputs into a deployable page: ChatGPT writes the HTML structure and Stable Horde supplies imagery. GitHub and Vercel are part of the ordinary-user delivery path rather than documentation-only integrations.

## Page source is assembled server-side

[`openai_utils.py`](https://github.com/Louvivien/AI-website-generator/blob/2c2331b513fcc3fdeb889d61cbb3c04f6037894a/openai_utils.py) handles page generation while [`stablehorde.py`](https://github.com/Louvivien/AI-website-generator/blob/2c2331b513fcc3fdeb889d61cbb3c04f6037894a/stablehorde.py) supplies generated image assets. [`main.py`](https://github.com/Louvivien/AI-website-generator/blob/2c2331b513fcc3fdeb889d61cbb3c04f6037894a/main.py) coordinates the page flow exposed through the HTML frontend.

## Repository publication is the persistence boundary

[`github_utils.py`](https://github.com/Louvivien/AI-website-generator/blob/2c2331b513fcc3fdeb889d61cbb3c04f6037894a/github_utils.py) creates or updates the GitHub representation used for deployment. The application itself has no local revision graph. It is historical because the canonical implementation stopped in 2023.

## Source anchors

- [Canonical repository](https://github.com/Louvivien/AI-website-generator)
- [Inspected tree](https://github.com/Louvivien/AI-website-generator/tree/2c2331b513fcc3fdeb889d61cbb3c04f6037894a)
- [Maintainer region evidence](https://github.com/Louvivien)
- Commit: `2c2331b513fcc3fdeb889d61cbb3c04f6037894a`
