@workspace Review the strict formatting rules in `Schema.md`, the current structure in `wiki/index.md`, and the history in `wiki/log.md`. 

I need to batch-process all documents currently in the `/raw` folder to generate the full wiki. 

For every file in `/raw`, execute the following:
1. **Analyze** the content.
2. **Generate** a new markdown file in the appropriate `/wiki/` subdirectory (`sources`, `concepts`, `entities`, `notes`, or `examples`). 
3. **Enforce** the exact YAML frontmatter, types, and 500-word chunking constraints defined in `Schema.md`.
4. **Update** the Catalog section of `wiki/index.md` with a link and a 1-sentence summary for each new file created.
5. **Append** a single batch-processing entry to `wiki/log.md` detailing the files created.