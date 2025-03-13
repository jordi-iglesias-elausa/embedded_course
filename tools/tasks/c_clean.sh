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

# Remove build directory
echo "Cleaning build directory: $build_dir"
rm -rf "$build_dir"