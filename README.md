# FreeGLUT Installer for Embarcadero Dev-C++

## Overview

This script automates the installation of FreeGLUT for Embarcadero Dev-C++, simplifying the setup process for OpenGL development in the Dev-C++ environment.

## Features

- Automated installation of FreeGLUT libraries and headers
- Compatible with Embarcadero Dev-C++
- Installs both 32-bit and 64-bit versions
- Requires administrator privileges for system-wide installation

## Prerequisites

- Windows operating system
- Embarcadero Dev-C++ installed in the default location
- FreeGLUT archive extracted to a local directory

## Installation

1. Extract the FreeGLUT archive to a local directory.
2. Run the installation script as administrator.
3. Follow the on-screen prompts to complete the installation.

## Usage

After installation, to use FreeGLUT in your projects:

1. Include the FreeGLUT header in your source code:
   ```c
   #include <GL/freeglut.h>
   ```

2. Link against the FreeGLUT library:
   - In Dev-C++, go to Project Options > Parameters > Linker
   - Add the following linker flag: `-lfreeglut`

## Troubleshooting

If the installation fails:
- Ensure you have administrator privileges.
- Verify that Dev-C++ is installed in the default location.
- Check that the FreeGLUT archive was extracted correctly.

## License

FreeGLUT is distributed under its own license. Please refer to the `COPYING` file in the FreeGLUT distribution for full license details.

## Acknowledgments

- FreeGLUT developers and contributors
- Embarcadero for Dev-C++
- IRedDragonICY from Ahmad Dahlan University for creating this installer

## Disclaimer

This installer is provided as-is, without any warranties. Users are advised to backup their development environment before running the script.

---

For more information on FreeGLUT, visit the [official FreeGLUT website](http://freeglut.sourceforge.net/).

For issues with this installer, please open an issue in the project repository.
