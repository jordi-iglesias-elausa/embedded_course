# EMBEDDED COURSE

The project is packaged in a devcontainer for Visual Studio Code.

Below you will find a brief guide on how to set up the development environment used.

# Setting up the development environment

## Development environment

The following setup was used during the development of this project. While the project should work with similar setups, using these versions will help minimize compatibility issues.

- **Windows Subsystem for Linux (WSL)**: version 2.4.11
- **Visual Studio Code**: version 1.98
- **Remote Development (VSode extension)**:  version 0.26.0
- **ST-LINK/V2**

Useful links:

- [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
- [Connecting USB devices to WSL](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)
  - In our project, we use the script `attach_usb_to_wsl.bat` from the Windows machine to attach the USB device corresponding to the ST-LINK device to the WSL (and from there to the Docker image running in the WSL).
## Quick start

Once inside the devcontainer you will find the following folders:

- **[Preset]**: Presets for the project build and debug

- **🛠 Project**: Predefined tasks to work with the STM32WLE5C8U6 firmware
  - 🔨 Build &rarr; Compile the firmware
  - 🐞 Debug &rarr; Debug the firmware on target
  - ⚡ Flash &rarr; Flash the firmware to the target
  - 🧹 Clean &rarr; Remove firmware build

- **🧰 Toolbox**: Predefined tasks to open the tools used for the Hardware and Software design
  - ⚙️ STM32CubeMX
  - 🎮 STM32CubeIDE



