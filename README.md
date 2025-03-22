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
  - In our project, we use the script `attach_usb_to_wsl.bat` from the Windows machine to attach the USB device corresponding to the ST-LINK device to the WSL (this has to be done with the docker container not opened, only connect to the wsl but without opening the workspace in the container)

  - Download the udev Rules File

    Download the necessary udev rules file from the official repository:

  ```bash
  wget https://github.com/stlink-org/stlink/raw/develop/config/udev/rules.d/49-stlinkv2-1.rules
  ```

  - Move the udev Rules File to the Correct Directory

    Move the downloaded rules file to the appropriate directory:

  ```bash
  sudo cp 49-stlinkv2-1.rules /etc/udev/rules.d/
  ```

  - Start the udev service:

    If the udev service is inactive or not running, start it with:

  ```bash
  sudo service udev start
  ```

  - Reload and Apply udev Rules

    After copying the file, reload the udev rules and trigger them to apply the changes:

  ```bash
  sudo udevadm control --reload-rules
  sudo udevadm trigger
  ```

  - Verify the Installation

    Unplug and reconnect your ST-LINK device, then check its permissions by running:

    This will display the permissions of the ST-LINK device to ensure the rules are applied correctly.

  ```bash
  ls -l /dev/bus/usb/$(lsusb | grep -i 'st-link' | awk '{print $2 "/" $4}' | sed 's/://')
  ```

  - In STM32CubeIde, when configuring the debug, in the "Debugger" tab, we need to sepcify the "Acces port" as 1 - Cortex-M33

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



