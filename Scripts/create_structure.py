#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
from typing import Final

ROOT: Final[Path] = Path.cwd()

DIRECTORIES: Final[tuple[str, ...]] = (
    "raw",
    "wiki",
    "wiki/concepts",
    "wiki/dashboard",
    "wiki/entities",
    "wiki/examples",
    "wiki/notes",
    "wiki/sources",
)

FILES: Final[tuple[str, ...]] = (
    "wiki/index.md",
    "wiki/log.md",
    "Schema.md",
)


def create_directories() -> None:
    for directory in DIRECTORIES:
        path: Path = ROOT / directory
        path.mkdir(parents=True, exist_ok=True)
        print(f"[DIR ] {path}")


def create_files() -> None:
    for file_path in FILES:
        path: Path = ROOT / file_path

        if not path.exists():
            path.touch()
            print(f"[FILE] {path}")
        else:
            print(f"[SKIP] {path}")


def main() -> None:
    create_directories()
    create_files()
    print("\nProject structure created successfully.")


if __name__ == "__main__":
    main()
