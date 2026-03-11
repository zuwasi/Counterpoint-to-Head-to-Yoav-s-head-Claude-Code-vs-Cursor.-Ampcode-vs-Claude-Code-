@echo off
echo ============================================================
echo   Launching Ampcode test setup in WSL
echo ============================================================
echo.
wsl -d Ubuntu-24.04 -- bash -c "sed -i 's/\r$//' /mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/run-ampcode-test.sh && chmod +x /mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/run-ampcode-test.sh && /mnt/c/Users/danie/Counterpoint-Ampcode-vs-Claude/run-ampcode-test.sh"
