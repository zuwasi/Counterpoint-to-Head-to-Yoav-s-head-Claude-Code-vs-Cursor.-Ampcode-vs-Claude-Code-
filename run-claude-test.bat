@echo off
echo ============================================================
echo   Launching Claude Code test in WSL (Linux required for
echo   Jay Framework - repo has filenames invalid on Windows)
echo ============================================================
echo.
echo   DEVIATION NOTED: Running in WSL Ubuntu instead of native
echo   Windows. Jay repo contains filenames with '?' characters
echo   which are invalid on NTFS. This is unavoidable.
echo.
wsl -d Ubuntu-24.04 -- bash /mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/run-claude-test.sh
