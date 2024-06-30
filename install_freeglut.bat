@echo off
cd /d "%~dp0"
NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    goto :start
) else (
    echo This script requires administrator privileges.
    echo Please run as administrator.
    pause
    exit /b 1
)

:start
echo  ===================================================================
echo  ^| ^< FreeGLUT Installation Script for Embarcadero Dev-C++ ^>    ^|
echo  ===================================================================
echo.
echo  This script will install FreeGLUT for use with Embarcadero Dev-C++.
echo.
echo  Make sure you have extracted the FreeGLUT archive before running this script.
echo.
:check_default_path
echo  [1/4] Checking Default Installation Path...
echo.
set "default_path=C:\Program Files (x86)\Embarcadero\Dev-Cpp"
:copy_files
echo  [2/4] Copying Files...
echo.
xcopy /E /Y "%cd%\include\GL" "%default_path%\TDM-GCC-64\x86_64-w64-mingw32\include\GL\"
echo  Copied include files...
xcopy /Y "%cd%\lib\x64\*.a" "%default_path%\TDM-GCC-64\x86_64-w64-mingw32\lib\"
echo  Copied x64 lib files...
xcopy /Y "%cd%\lib\*.a" "%default_path%\TDM-GCC-64\x86_64-w64-mingw32\lib32\"
echo  Copied x32 lib files...
xcopy /Y "%cd%\bin\x64\freeglut.dll" "%systemroot%\System32\"
echo  Copied x64 DLL file...
echo.
:success
echo  [3/4] Installation Complete!
echo.
echo  ===================================================================
echo  ^| ^< FreeGLUT has been successfully installed. ^>               ^|
echo  ===================================================================
echo.
echo  To use FreeGLUT in your projects, make sure to:
echo.
echo    1. Add #include ^<GL/freeglut.h^> to your source code.
echo    2. Link with the FreeGLUT library:
echo       - Project Options ^> Parameters ^> Linker: -lfreeglut
echo    installer by IRedDragonICY
echo    from Ahmad Dahlan University
echo.
pause
exit /b 0

:error
echo  [4/4] Installation Failed!
echo.
echo  An error occurred during the installation process. Please check the following:
echo.
echo    - Make sure you have the necessary permissions to write to the installation directory.
echo    - Verify that the FreeGLUT archive was extracted correctly.
echo Installer by IRedDragonICY
echo from Ahmad Dahlan University
echo.
pause
exit /b 1
