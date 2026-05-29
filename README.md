# LLM Wiki / AI Second Brain / AI Knowledge Base

LLM Wiki — a self-maintaining personal knowledge management (PKM) system designed specifically for Large Language Models.

Instead of treating an AI like a search engine that loses context between queries, this system acts as an autonomous librarian. By dropping raw files into a designated folder, an LLM agent (such as GitHub Copilot or a custom ingestion pipeline) can analyze content, extract concepts, and compile a structured, interlinked markdown wiki optimized for Retrieval-Augmented Generation (RAG).

---

## 🧠 Core Philosophy

This project shifts away from passive note-taking systems into an active, agent-driven AI operating environment.

* **LLM-Native Formatting:** Every markdown file follows strict token-based chunking limits (maximum 512 tokens per section) for reliable context-window alignment.
* **Anti-Hallucination Measures:** Mandatory YAML frontmatter includes explicit confidence scoring (`low`, `medium`, `high`, `verified`) to improve retrieval reliability.
* **Separation of Extraction and Synthesis:** Raw source material remains isolated from derived knowledge and interpretation.
* **Structured Linking:** Wikilinks and hierarchical relationships create a navigable semantic graph optimized for RAG pipelines.
* **Schema-Driven Organization:** All generated content follows a strict ontology defined in `Schema.md`.

---

## 📂 Repository Structure

The workspace is divided into immutable raw inputs and the generated knowledge base.

```text
.
├── raw/                    # Immutable source files (PDFs, TXT, Markdown, etc.)
├── wiki/                   # Generated interlinked knowledge base
│   ├── .obsidian/          # Obsidian vault configuration
│   ├── concepts/           # Canonical concepts, frameworks, and mental models
│   ├── dashboard/          # Dashboards, analytics, or operational views
│   ├── entities/           # People, organizations, products, or places
│   ├── examples/           # Implementations, case studies, and applied examples
│   ├── notes/              # Freeform thoughts and synthesis notes
│   ├── sources/            # Processed source summaries and metadata
│   ├── index.md            # Global knowledge map and entry point
│   └── log.md              # Append-only activity log
└── Schema.md               # System-wide schema and ingestion rules
```

---

## 📜 Schema.md: The Brain of the System

`Schema.md` is the authoritative specification for the repository.

It defines:

* YAML frontmatter requirements
* Allowed node types
* File naming conventions
* Chunking constraints
* Metadata normalization rules
* Wikilink behavior
* Retrieval-ranking logic
* Agent permissions and restrictions

Any automated agent interacting with this repository should read `Schema.md` before processing or generating content.

---

## Workflow

### Ingest Raw Data

Place unprocessed files into the `raw/` directory:

* PDFs
* Markdown files
* Articles
* Research papers
* Meeting transcripts
* Notes
* Text exports
* Obsidian unprocessed folder

### Process /raw with LLM

1. Pick one of the prompts inside Prompts/ folder;
2. Run an LLM agent of your choise or ingestion pipeline using this prompt;
3. Wait untill agent finish processing;
4. Open your wiki folder with obsidian to study result.


### Expected Results

The ingestion system will:

* Extract and summarize content
* Generate structured markdown nodes
* Route files into the correct `/wiki/` subdirectory
* Enforce YAML frontmatter validation
* Apply token-aware chunking rules
* Create wikilinks between related concepts
* Update `wiki/index.md`
* Append actions to `wiki/log.md`

### Query Your LLM wiki

After you have successfuly processed you raw folder into LLM wiki you can use local LLM tooling or RAG systems to query your knowledge base.

---

## 🔗 Linking System

The wiki uses Obsidian-compatible wikilinks.

Examples:

```md
[[Retrieval Augmented Generation]]
[[Vector Databases|Vector DBs]]
[[LLM Memory Systems#Long-Term Memory]]
```

Features include:

* Bidirectional linking
* Heading-level references
* Graph traversal
* Context-aware retrieval
* Semantic relationship mapping

---

## 🛠 Editor Compatibility

The `/wiki/` directory is fully compatible with Obsidian.

Opening the `wiki/` folder as an Obsidian vault enables:

* Graph visualization
* Native wikilink navigation
* Full-text search
* Tag filtering
* Markdown editing
* Plugin ecosystem support

---

## ⚙️ Design Goals

The system is designed for:

* Long-term AI memory
* Reliable RAG ingestion
* Structured semantic retrieval
* Low hallucination rates
* Human-readable markdown
* Agent interoperability
* Scalable knowledge graphs

---

## 📄 License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0).

You may copy, distribute, and modify the software provided that changes remain documented and derivative works using GPL-licensed code are also distributed under the GPL.

See the `LICENSE` file for details.
