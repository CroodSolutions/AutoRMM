@echo off
setlocal

REM Get full paths
set "SCRIPT_DIR=%~dp0"
set "AHK_EXE=%SCRIPT_DIR%AutoHotkey64.exe"
set "AHK_SCRIPT=%SCRIPT_DIR%Install-Action1.ahk"

REM Double-check file exists
if not exist "%AHK_SCRIPT%" (
    echo ERROR: Could not find script: %AHK_SCRIPT%
    pause
    exit /b 1
)

REM Run the AHK script with elevation
powershell -Command "Start-Process -FilePath '%AHK_EXE%' -ArgumentList '\"%AHK_SCRIPT%\"' -Verb runAs"

endlocal
