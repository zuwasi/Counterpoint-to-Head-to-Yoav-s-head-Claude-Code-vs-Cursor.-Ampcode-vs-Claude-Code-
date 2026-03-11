@echo off
setlocal
echo ============================================================
echo   COUNTERPOINT TEST: Claude Code - Setup and Launch
echo ============================================================
echo.

set "JAYDIR=C:\Users\danie\jay-claude-run"
set "LOGFILE=%~dp0claude-start-time.txt"

:: Record start time
echo TEST START TIME: %date% %time%
echo TEST START TIME: %date% %time% > "%LOGFILE%"

:: Step 1: Clone Jay Framework
echo.
echo [1/6] Cloning Jay Framework...
if exist "%JAYDIR%\package.json" (
    echo      %JAYDIR% already set up, skipping clone.
) else (
    if exist "%JAYDIR%" (
        echo      Removing incomplete clone...
        rmdir /s /q "%JAYDIR%" 2>nul
    )
    git clone https://github.com/jay-framework/jay.git "%JAYDIR%"
    if errorlevel 1 (
        echo ERROR: git clone failed
        pause
        exit /b 1
    )
)

:: Step 2: Enter directory
cd /d "%JAYDIR%"
echo [2/6] Working directory: %cd%

:: Verify package.json exists
if not exist "package.json" (
    echo ERROR: package.json not found in %JAYDIR%
    echo The clone may have failed. Delete %JAYDIR% and try again.
    pause
    exit /b 1
)

:: Step 3: Setup Yarn via corepack (handle no-admin gracefully)
echo.
echo [3/6] Setting up Yarn 3 via corepack...
call npx corepack enable 2>nul
if errorlevel 1 (
    echo      npx corepack enable had issues, trying alternative...
    call npm exec corepack enable -- 2>nul
)
:: Set yarn version as specified in the repo
call corepack prepare yarn@3.6.4 --activate 2>nul

:: Step 4: Install dependencies using npx to ensure correct yarn
echo.
echo [4/6] Installing dependencies...
call npx yarn@3.6.4 install
if errorlevel 1 (
    echo ERROR: yarn install failed
    pause
    exit /b 1
)

:: Step 5: Build
echo.
echo [5/6] Building project...
call npx yarn@3.6.4 build
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
echo SETUP COMPLETE: %date% %time% >> "%LOGFILE%"

:: Step 6: Copy prompt to clipboard
echo.
echo [6/6] Copying prompt to clipboard...
type "%~dp0CLAUDE-PROMPT-PASTE.txt" | clip
echo.
echo ============================================================
echo   PROMPT IS NOW IN YOUR CLIPBOARD
echo ============================================================
echo.
echo   INSTRUCTIONS:
echo   1. Claude Code will open in this window
echo   2. RIGHT-CLICK to paste the prompt
echo   3. Press ENTER
echo   4. DO NOT intervene unless Claude asks a question
echo   5. Note: timestamps logged to %LOGFILE%
echo.
echo   Press any key to launch Claude Code...
pause >nul

:: Launch Claude Code
echo.
echo CLAUDE LAUNCHED: %date% %time% >> "%LOGFILE%"
call claude
