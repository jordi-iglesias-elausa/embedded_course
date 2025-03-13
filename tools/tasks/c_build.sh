#!/usr/bin/bash

# Check if exactly one argument is provided
if [ "$#" -ne 1 ]; then
  echo "Error: You must provide a build preset."
  exit 1
else
  preset=$1
fi

# Define the build directory based on the preset
build_dir="/workspaces/embedded_course/software/nucleo_wba52cg_example/cubemx_ws/embedded_course_example_1_led_blink/build/$preset"

# Create the build directory if it does not exist and switch to it
mkdir -p "$build_dir"
cd "$build_dir"

# Print the preset value
echo "Building with preset: $preset"

# Run CMake only if the cache file does not exist (avoids re-running CMake every time)
# # if [ ! -f "$build_dir/CMakeCache.txt" ]; then
  cmake \
    -DCMAKE_BUILD_TYPE="$preset" \
    -DCMAKE_TOOLCHAIN_FILE=/workspaces/embedded_course/tools/cmake/toolchain/arm/gcc-arm-none-eabi.cmake \
    -S /workspaces/embedded_course/software/nucleo_wba52cg_example/cubemx_ws/embedded_course_example_1_led_blink \
    -B "$build_dir" \
    -G "Unix Makefiles"
# fi

# Build
make -j4
