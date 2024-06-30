@echo off

echo  ===================================================================
echo  | < FreeGLUT Installation Script for Embarcadero Dev-C++ >    |
echo  ===================================================================
echo.

echo  This script will install FreeGLUT for use with Embarcadero Dev-C++.
echo.
echo  Make sure you have extracted the FreeGLUT archive before running this script.
echo.

:get_install_path
set "default_path=C:\Program Files (x86)\Embarcadero\Dev-Cpp"
set "manual_path="

echo  [1/4] Checking Default Installation Path...
echo.
echo  Default installation path: "%default_path%"
echo.
choice /C YN /M "Use default installation path? (Y/N) "
if %errorlevel%==2 (
    set /p manual_path="Enter the desired installation path: "
    if not exist "%manual_path%" (
        echo Error: Invalid installation path.
        goto error
    )
) else (
    set "manual_path=%default_path%"
)

:copy_files
echo  [2/4] Copying Files...
echo.

if not exist "%manual_path%\TDM-GCC-64\x86_64-w64-mingw32\include\GL" mkdir "%manual_path%\TDM-GCC-64\x86_64-w64-mingw32\include\GL"
xcopy /E /Y "%cd%\include\GL" "%manual_path%\TDM-GCC-64\x86_64-w64-mingw32\include\GL\" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to copy include files. Please run the script as administrator.
    goto error
)
echo  Copied include files...

xcopy /Y "%cd%\lib\x64\*.a" "%manual_path%\TDM-GCC-64\x86_64-w64-mingw32\lib\" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to copy x64 lib files. Please run the script as administrator.
    goto error
)
echo  Copied x64 lib files...

xcopy /Y "%cd%\lib\*.a" "%manual_path%\TDM-GCC-64\x86_64-w64-mingw32\lib32\" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to copy x32 lib files. Please run the script as administrator.
    goto error
)
echo  Copied x32 lib files...

copy /Y "%cd%\bin\x64\freeglut.dll" "%systemroot%\System32\" >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Failed to copy x64 DLL file. Please run the script as administrator.
    goto error
)
echo  Copied x64 DLL file...
echo.

:success
echo  [3/4] Installation Complete!
echo.
echo  ===================================================================
echo  | < FreeGLUT has been successfully installed. >               |
echo  ===================================================================
echo.
echo  To use FreeGLUT in your projects, make sure to:
echo.
echo    1. Add #include <GL/freeglut.h> to your source code.
echo    2. Link with the FreeGLUT library:
echo       - Project Options > Parameters > Linker: -lfreeglut
echo    installer by IRedDragonICY
echo    from Ahmad Dahlan University
echo.
pause
exit

:error
echo  [4/4] Installation Failed!
echo.
echo  An error occurred during the installation process. Please check the following:
echo.
echo    - Make sure you have the necessary permissions to write to the installation directory.
echo    - Verify that the FreeGLUT archive was extracted correctly.
echo.
pause
exit