@echo off
echo ============================================================
echo   COUNTERPOINT TEST: Claude Code - Setup and Launch
echo ============================================================
echo.

:: Record start time
echo TEST START TIME: %date% %time%
echo TEST START TIME: %date% %time% > "%~dp0claude-start-time.txt"

:: Step 1: Clone Jay Framework
echo.
echo [1/5] Cloning Jay Framework...
cd /d C:\Users\danie
if exist "jay-claude-test" (
    echo      jay-claude-test already exists, skipping clone.
) else (
    git clone https://github.com/jay-framework/jay.git jay-claude-test
    if errorlevel 1 (
        echo ERROR: git clone failed
        pause
        exit /b 1
    )
)

:: Step 2: Enter directory
cd /d C:\Users\danie\jay-claude-test
echo [2/5] Working directory: %cd%

:: Step 3: Enable corepack
echo.
echo [3/5] Enabling corepack...
call corepack enable
if errorlevel 1 (
    echo WARNING: corepack enable had issues, continuing anyway...
)

:: Step 4: Install dependencies
echo.
echo [4/5] Installing dependencies (yarn install)...
call yarn install
if errorlevel 1 (
    echo ERROR: yarn install failed
    pause
    exit /b 1
)

:: Step 5: Build
echo.
echo [5/5] Building project (yarn build)...
call yarn build
if errorlevel 1 (
    echo ERROR: yarn build failed
    pause
    exit /b 1
)

:: Record setup complete time
echo.
echo ============================================================
echo   SETUP COMPLETE at %date% %time%
echo ============================================================
echo SETUP COMPLETE: %date% %time% >> "%~dp0claude-start-time.txt"

:: Step 6: Copy prompt to clipboard
echo.
echo Copying prompt to clipboard...
type "%~dp0CLAUDE-PROMPT-PASTE.txt" | clip
echo.
echo ============================================================
echo   PROMPT IS NOW IN YOUR CLIPBOARD
echo ============================================================
echo.
echo   INSTRUCTIONS:
echo   1. Claude Code will open below
echo   2. RIGHT-CLICK to paste the prompt (it is in your clipboard)
echo   3. Press ENTER
echo   4. DO NOT intervene unless Claude asks you a question
echo   5. Record the time you press ENTER as T0
echo.
echo   Press any key to launch Claude Code...
pause >nul

:: Launch Claude Code
echo.
echo Launching Claude Code at %date% %time%
echo CLAUDE LAUNCHED: %date% %time% >> "%~dp0claude-start-time.txt"
call claude
