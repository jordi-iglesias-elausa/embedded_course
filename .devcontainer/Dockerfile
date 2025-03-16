# Use the official Ubuntu 22.04 image as the base
FROM ubuntu:22.04

# Prevent interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

################# Common Libraries and Packages #############################
# Update package list and install general dependencies
# -y (yes flag): Automatically answers "yes" to prompts, so installation proceeds without user interaction
# build-essential → A meta-package that includes: gcc, g++, make and another essential tools for compiling software.
#  apt-get clean → Cleans the local repository of retrieved package files that are no longer needed
# rm -rf /var/lib/apt/lists/* → Removes the package lists to reduce the image size
RUN apt-get update 
RUN apt-get install -y python3 
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-setuptools
RUN apt-get install -y python3-dev
RUN apt-get install -y build-essential 
RUN apt-get install -y git 
RUN apt-get install -y ffmpeg 
RUN apt-get install -y unzip 
RUN apt-get install -y xvfb 
RUN apt-get install -y libsdl2-ttf-2.0-0 
RUN apt-get install -y libmtdev-dev 
RUN apt-get install -y xclip 
RUN apt-get install -y libgl1-mesa-glx 
RUN apt-get install -y libgles2-mesa 
RUN apt-get install -y libgl1-mesa-dri 
RUN apt-get install -y mesa-utils 
RUN apt-get install -y usbutils 
RUN apt-get install -y libsdl2-dev 
RUN apt-get install -y libsdl2-image-dev 
RUN apt-get install -y libsdl2-mixer-dev 
RUN apt-get install -y libsdl2-ttf-dev 
RUN apt-get install -y libportmidi-dev 
RUN apt-get install -y libswscale-dev 
RUN apt-get install -y libavformat-dev 
RUN apt-get install -y libavcodec-dev 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libgstreamer1.0-dev 
RUN apt-get install -y gstreamer1.0-plugins-base 
RUN apt-get install -y gstreamer1.0-plugins-good 
RUN apt-get install -y gstreamer1.0-plugins-bad 
RUN apt-get install -y gstreamer1.0-plugins-ugly 
RUN apt-get install -y gstreamer1.0-libav 
RUN apt-get install -y gstreamer1.0-tools 
RUN apt-get install -y gstreamer1.0-x 
RUN apt-get install -y gstreamer1.0-alsa 
RUN apt-get install -y build-essential  
RUN apt-get install -y cmake 
RUN apt-get install -y openjdk-21-jre 
RUN apt-get install -y libusb-1.0-0-dev 
RUN apt-get install -y wget 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y asciidoc 
# RUN apt-get install -y clang-tools-extra 
RUN apt-get install -y bear 
RUN apt-get install -y sudo 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists/*

# Create an alias for python3 as python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Install MegaTools
# This section of the Dockerfile installs MegaTools, a command-line utility for interacting 
# with Mega.nz, a cloud storage service. It allows users to upload, download, and manage files from the Mega cloud.
# The WORKDIR instruction in a Dockerfile sets the working directory for any RUN, CMD, COPY, ADD, and ENTRYPOINT 
# instructions that follow it in the Dockerfile. Think of it like the cd command in a Linux terminal; it changes 
# the directory the subsequent commands will operate within.
WORKDIR /tmp
RUN wget https://megatools.megous.com/builds/megatools-1.10.3.tar.gz && \
    tar -xvf megatools-1.10.3.tar.gz
WORKDIR /tmp/megatools-1.10.3
RUN ./configure && \
    make -j$(nproc) && \
    make install && \
    rm -rf /tmp/megatools-1.10.3.tar.gz /tmp/megatools-1.10.3

################# Kivy Installation #############################
# Install Cython and Kivy (full installation)
# This section installs Kivy, a Python framework for developing multi-touch applications, along with Cython, 
# which is required for compiling Kivy’s performance-critical components
# RUN pip install cython
# RUN pip install Kivy[full]==2.3.0

# Install additional libraries for app development
# RUN pip install pyserial

# Installs two important system utilities:
# software-properties-common: Provides tools like add-apt-repository to manage PPAs (Personal Package Archives).
#                             required for adding third-party repositories (e.g., KiCad PPA or Python PPAs).
# apt-utils: Improves the apt package manager by enabling better interactive handling.
# RUN apt-get update && \
#    apt-get install -y software-properties-common apt-utils

################# C Embedded Software Environment #############################
# Download STM32Cube CTL zip file and set license acceptance
WORKDIR /tmp
# Mega.nz does not allow direct wget or curl downloads due to security tokens and JavaScript-based authentication.
# megadl automates the download process for files hosted on Mega.
RUN /usr/local/bin/megadl https://mega.nz/file/glQ02bBK#yJjuwL7TAwPIuw6Lk7ahzeNIcur2euE-SGkTN7FuMR8
# This environment variable prevents license agreement prompts.
ENV LICENSE_ALREADY_ACCEPTED=1

# Unzip, install, and clean STM32Cube CTL files
RUN unzip -o en.st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh.zip && \
    chmod +x st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh && \
    apt-get update && \
    ./st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    rm -rf en.st-stm32cubeclt_1.16.0_21983_20240628_1741_amd64.deb_bundle.sh.zip

# Install STM32CubeMX
RUN /usr/local/bin/megadl https://mega.nz/file/EwxBUCDL#XX5y5OA-NYerxH0ThHey89RUEUDdyNNDl6KjllWHYqE && \
    unzip -o en.stm32cubemx-lin-v6-12-1.zip -d /root && \
    printf "1\n1\n\n\n\nY\n\n" | /root/SetupSTM32CubeMX-6.12.1 -console && \
    rm -rf en.stm32cubemx-lin-v6-12-1.zip /root/Readme.html /root/SetupSTM32CubeMX-6.12.1 /root/jre

# Install STM32CubeIDE
RUN /usr/local/bin/megadl https://mega.nz/file/wwYWnAzK#ljB_in86Hav7254Rb7swvfwaYjb8ya_z7UM5_tKAKR4
RUN unzip -o en.st-stm32cubeide_1.18.0_24413_20250227_1633_amd64.deb_bundle.sh.zip -d /tmp
RUN chmod +x /tmp/st-stm32cubeide_1.18.0_24413_20250227_1633_amd64.deb_bundle.sh
RUN /tmp/st-stm32cubeide_1.18.0_24413_20250227_1633_amd64.deb_bundle.sh --target /tmp/debfiles/ --noexec && sudo LICENSE_ALREADY_ACCEPTED=1 apt-get -y --no-install-recommends install /tmp/debfiles/***.deb
    
################# User Configuration #############################
# Create a non-root user 'jordimmg' with password '1234', grant sudo access without password
RUN useradd -m jordimmg && echo "jordimmg:1234" | chpasswd && adduser jordimmg sudo
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Add user 'jordimmg' to plugdev and dialout groups for USB access
# plugdev: Allows the user to use USB devices without requiring sudo permissions.
# dialout: Grants access to serial devices, which is crucial for debugging microcontrollers (e.g., STM32, Arduino).
RUN sudo usermod -aG plugdev jordimmg && sudo usermod -aG dialout jordimmg

# Switch to 'jordimmg' user
USER jordimmg

# Preload STM32CubeWBA family files to avoid repeated downloads
# This package is used to generate code with STM32CubeMX
WORKDIR /home/jordimmg/
RUN /usr/local/bin/megadl  https://mega.nz/file/YxpRTJoC#9rc1qGODIoRegj2-K5E3KnfZYJxy2LpFcNhK0Moch8A && \
    unzip -o en.stm32cubewba-v1-5-0.zip && \
    rm -rf /home/jordimmg/en.stm32cubewba-v1-5-0.zip

# Set default workdir
WORKDIR /workspaces/embedded_course

# Copy KiCad's default configuration to avoid reconfiguring the entire Kicad environment on every container build
# RUN mkdir -p /home/jordimmg/.config/kicad/8.0/
# COPY assets/KiCad/kicad_default_conf/ /home/jordimmg/.config/kicad/8.0/

# Update .bashrc with necessary exports and aliases
RUN echo 'export PATH=$PATH:~/.local/bin/' >> ~/.bashrc
RUN echo "alias STM32CubeMX='/usr/local/STMicroelectronics/STM32Cube/STM32CubeMX/STM32CubeMX'" >> ~/.bashrc
RUN echo "alias STM32CubeIDE='/opt/st/stm32cubeide_1.18.0/stm32cubeide'" >> ~/.bashrc