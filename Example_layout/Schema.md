# LLM Wiki Schema Definition

This document defines the **ontology**, **metadata requirements**, and **formatting constraints** for all markdown files in the knowledge base. The ingestion script and LLM rely on this schema for **parsing**, **embedding**, and **retrieval**.

## 1. YAML Frontmatter

Every file **MUST** contain a valid YAML frontmatter block at the top. Below is a literal, valid example:

```yaml
---
id: "YYYYMMDDHHMMSS"
title: "Retrieval-Augmented Generation"
type: "concept"
status: "active"
confidence: "high"
summary: "Technique where external knowledge is retrieved before LLM response generation."
tags:
  - machine-learning
  - vector-search
created: "2026-05-29T12:00:00Z"
modified: "2026-05-29T15:30:00Z"
aliases:
  - "RAG"
---

```

### Frontmatter Definitions

| Field | Data Type | Description |
| --- | --- | --- |
| **id** | String | A **unique UUID** or **timestamp** identifying the file. |
| **title** | String | Must **identically match** the single H1 heading in the document. |
| **type** | String | Must exactly match one of the defined **Allowed Node Types**. |
| **status** | String | Valid states: `draft`, `active`, or `archived`. |
| **confidence** | String | **low**, **medium**, **high**, or **verified**. Reduces hallucinations by weighting factuality. |
| **summary** | String | **Mandatory.** A concise TL;DR. Drastically improves LLM retrieval quality. |
| **tags** | Array | **Lowercase, hyphen-separated** strings for metadata filtering. |
| **created** | String | **ISO 8601** formatted datetime (e.g., YYYY-MM-DDTHH:MM:SSZ). |
| **modified** | String | **ISO 8601** formatted datetime of the last edit. |
| **aliases** | Array | Alternative names, acronyms, or misspellings for **entity resolution**. |

## 2. Naming Convention and Folder Structure

* **Strict Kebab-Case:** All filenames MUST use lowercase kebab-case (e.g., `vector-database-comparison.md`).
* **Explicit Folder Hierarchy:** Files must be placed into the following exact structure based on type:

```text
raw/
└── wiki/
    ├── concepts/
    ├── entities/
    ├── examples/
    ├── notes/
    ├── sources/
    ├── index.md
    └── log.md

```

## 3. Allowed Node Types

The `type` field in the frontmatter **MUST** be one of the following:

* **concept:** Theoretical frameworks, ideas, or mental models.
* **entity:** People, organizations, products, or places.
* **source:** Books, articles, podcasts, research papers, or videos.
* **log:** Time-bound journal entries, meeting notes, or daily logs.
* **index:** Maps of content (MOC) aggregating links to other nodes.
* **example:** Specific instances, case studies, or practical implementations.
* **note:** Freeform thoughts, rough ideas, or unstructured text.

## 4. Tags Normalization

All tags must strictly follow these rules:

* **Lowercase only**
* **Hyphen-separated**
* **No spaces**
* **No duplicates**

## 5. Modified Field Enforcement

* The `modified` field format is strictly **ISO 8601**.
* It **MUST be updated on every file modification** automatically by the ingestion agent.

## 6. Structural Constraints & Chunking

* **Single H1:** Each file **MUST** have exactly one `#` heading, matching the title in frontmatter.
* **Token-Based Chunking:** Headings (`##` and `###`) should be used frequently. No text block under a heading should exceed **512 tokens** to ensure optimal context window alignment.
* **Chunk Boundaries:** Never split **code blocks**, **tables**, or **equations** across chunks.
* **Conceptual Overlap:** Ensure conceptual overlap across heading boundaries. When breaking a large topic, **repeat key context** or use transitional sentences so that isolated chunks maintain their independent meaning.
* **No HTML:** Use pure Markdown. Avoid raw HTML tags as they **degrade embedding quality**.

## 7. Linking System Review

* **Wikilinks:** Use `[[File Name]]` or `[[File Name|Display Text]]` for internal linking.
* **Block references:** Link to specific headings using `[[File Name#Heading]]`.
* **Directionality:** Notes should bias towards **bottom-up linking** (specific concepts linking up to broader index notes).
* **Concept Integrity:** Every concept **MUST** have **at least 1 incoming link** OR be marked as **orphan**.

## 8. Source Type Rules Review

If the file is a source (`type: "source"`), it must adhere to strict extraction guidelines:

* **Section Formatting:** The body MUST contain the following sections in order:
* `## Metadata`: Author, URL, publication date.
* `## TL;DR`: A strictly **1-3 sentence summary**.
* `## Highlights` or `## Notes`: The extracted text or personal thoughts.


* **No Derived Knowledge:** Sources must **never** contain derived knowledge outside extraction sections. Keep **raw extraction completely separate** from interpretation.
* **External Links Limitation:** **Never** follow or open external links outside the `raw` folder starting with `http`, `https`, or `www`, etc.

## 9. Advanced LLM Directives

When the LLM reads this repository, it MUST adhere to the following logic system:

### 9.1 Embedding Rules

* **Embed:** Title, summary, headings, and chunk content.
* **Do Not Embed:** Navigation blocks, autogenerated timestamps, and repetitive metadata.

### 9.2 Retrieval Ranking

Ranking priority for RAG queries:

1. **Semantic similarity**
2. **Recency**
3. **Source confidence** (`verified` > `high` > `medium` > `low`)
4. **Explicit links**
5. **Document importance** (Concept nodes > Source nodes)

### 9.3 Memory Layers (TTLs)

* **Short-Term Memory:** Stores recent conversations, temporary plans, and active tasks. **TTL: 7 days.**
* **Long-Term Memory:** Stores stable facts, personal preferences, and distilled knowledge. **TTL: Indefinite.**

### 9.4 Agent Restrictions

Automated agents operating on this repository:

* **MAY:** Create summaries, propose links, generate tags, and detect duplicates.
* **MAY NOT:** Delete source material, overwrite verified facts, or remove citations. Treat aliases as equivalent to the title for **entity resolution**. Ignore files marked `status: archived` during active querying.

