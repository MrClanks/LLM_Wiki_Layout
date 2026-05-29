@echo off
setlocal

set ROOT=%cd%

mkdir "%ROOT%\raw"
mkdir "%ROOT%\wiki"

mkdir "%ROOT%\wiki\.obsidian"
mkdir "%ROOT%\wiki\concepts"
mkdir "%ROOT%\wiki\dashboard"
mkdir "%ROOT%\wiki\entities"
mkdir "%ROOT%\wiki\examples"
mkdir "%ROOT%\wiki\notes"
mkdir "%ROOT%\wiki\sources"

type nul > "%ROOT%\wiki\index.md"
type nul > "%ROOT%\wiki\log.md"
type nul > "%ROOT%\Schema.md"

echo Project structure created successfully.

endlocal