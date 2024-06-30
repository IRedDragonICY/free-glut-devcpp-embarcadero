@echo off
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

REM Function to set colors
:Color
SET ESC=0x1b
SET "green=%ESC%[0;32m"
SET "red=%ESC%[0;31m"
SET "reset=%ESC%[0m"
GOTO :EOF

REM Function to check for administrator privileges
:CheckAdmin
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo This script requires administrator privileges.
    echo Please run this script as an administrator.
    pause
    exit /b
)
GOTO :EOF

REM Function to copy files with logging and color-coded output
:CopyFile
SET "source=%~1"
SET "destination=%~2"
COPY /Y "%source%" "%destination%" >nul
IF %ERRORLEVEL% EQU 0 (
    echo !green!Copied %source% to %destination%!reset!
) ELSE (
    echo !red!Failed to copy %source% to %destination%!reset!
)
GOTO :EOF

REM Ensure the script is running with administrator privileges
CALL :Color
CALL :CheckAdmin

REM Check if the default installation directory exists
SET "DEVCPP_DIR=C:\Program Files (x86)\Embarcadero\Dev-Cpp\TDM-GCC-64\x86_64-w64-mingw32"
IF NOT EXIST "%DEVCPP_DIR%" (
    echo !red!Default installation directory not found.!reset!
    echo Ensure Dev-C++ Embarcadero is installed at "%DEVCPP_DIR%".
    pause
    exit /b
)

echo.
echo Installing Freeglut...

REM Copy header files
echo.
echo !green!Copying header files...!reset!
xcopy /s /y /i "include\GL" "%DEVCPP_DIR%\include\GL" >nul
IF %ERRORLEVEL% EQU 0 (
    echo !green!Header files copied successfully.!reset!
) ELSE (
    echo !red!Failed to copy header files.!reset!
)

REM Copy library files for x64
echo.
echo !green!Copying x64 library files...!reset!
CALL :CopyFile "lib\x64\libfreeglut.a" "%DEVCPP_DIR%\lib\libfreeglut.a"
CALL :CopyFile "lib\x64\libfreeglut_static.a" "%DEVCPP_DIR%\lib\libfreeglut_static.a"

REM Copy library files for x32
echo.
echo !green!Copying x32 library files...!reset!
CALL :CopyFile "lib\libfreeglut.a" "%DEVCPP_DIR%\lib32\libfreeglut.a"
CALL :CopyFile "lib\libfreeglut_static.a" "%DEVCPP_DIR%\lib32\libfreeglut_static.a"

REM Copy DLL file to System32
echo.
echo !green!Copying DLL file to System32...!reset!
CALL :CopyFile "bin\x64\freeglut.dll" "C:\Windows\System32\freeglut.dll"

echo.
echo !green!Freeglut installation completed.!reset!
pause
ENDLOCAL
