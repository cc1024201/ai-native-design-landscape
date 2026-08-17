# AI Website Generator by Shrutika Kapade

> Research status: **Source-level** · Lifecycle: **active** · Last reviewed: **2026-08-12**

This compact Streamlit application asks Gemini for a complete three-part frontend artifact and keeps those parts separately inspectable before download.

[`app.py`](https://github.com/shrutikakapade/AI-Website-Generator-using-LangChain-Google-Gemini-Streamlit/blob/f535d9f74871226f438952588059616f03c9426e/app.py) captures the brief, calls the LangChain Gemini chain, separates HTML, CSS and JavaScript, displays the generated source and renders a live page. [`structure.py`](https://github.com/shrutikakapade/AI-Website-Generator-using-LangChain-Google-Gemini-Streamlit/blob/f535d9f74871226f438952588059616f03c9426e/structure.py) defines the response and page assembly contract.

The Streamlit session owns the current result and exposes it for download; no durable project or version database is present.

## Source record

- [Canonical repository](https://github.com/shrutikakapade/AI-Website-Generator-using-LangChain-Google-Gemini-Streamlit)
- [Inspected commit](https://github.com/shrutikakapade/AI-Website-Generator-using-LangChain-Google-Gemini-Streamlit/commit/f535d9f74871226f438952588059616f03c9426e)
- [Maintainer region evidence](https://github.com/shrutikakapade)
- Commit: `f535d9f74871226f438952588059616f03c9426e`
