#!/bin/bash

echo "🧱 Build project 🧱"

# parse command line arguments
CURRENT_CMAKE_CONFIGURE_PRESET="$1"
CURRENT_CMAKE_BUILD_TARGET_NAME="$2"

# Get the current working directory od the bash script
rootPath=$(pwd)             

echo "CURRENT_CMAKE_CONFIGURE_PRESET: $CURRENT_CMAKE_CONFIGURE_PRESET"
echo "CURRENT_CMAKE_BUILD_TARGET_NAME: $CURRENT_CMAKE_BUILD_TARGET_NAME"

# Create the build directory if it doesn't exist
echo "📁 Creating build folder ..."
mkdir -p "${WORKSPACE_DIR}/build"
cd "${WORKSPACE_DIR}/build"
mkdir -p "$CURRENT_CMAKE_CONFIGURE_PRESET"
cd "$CURRENT_CMAKE_CONFIGURE_PRESET"  

# Execute CMake with the selected preset
echo "👷‍♂️ Executing CMake ..."
if cmake --preset "$CURRENT_CMAKE_CONFIGURE_PRESET" ${WORKSPACE_DIR}; then
    echo "🧱 CMake configuration successful."
else
    echo "❌ CMake configuration failed."
    exit 1
fi

# Execute make to build the target
echo "🧱 Executing make for target '${CURRENT_CMAKE_BUILD_TARGET_NAME}' ..."
if make "$CURRENT_CMAKE_BUILD_TARGET_NAME"; then
    echo "✅ Build successful for target '${CURRENT_CMAKE_BUILD_TARGET_NAME}'."
else
    echo "❌ Build failed for target '${CURRENT_CMAKE_BUILD_TARGET_NAME}'."
    exit 1
fi

# Check if ENABLE_UNIT_TEST is set to ON in CMake cache
ENABLE_UNIT_TESTS=$(cat CMakeCache.txt | grep ENABLE_HOST_UNIT_TESTS | cut -d '=' -f 2)
if [ "$ENABLE_UNIT_TESTS" = "ON" ]; then
    # Execute unit tests
    echo "🔍 Running unit tests ..."
    if "$rootPath/tools/tasks/c_unit_test.sh"; then
        echo "✅ Unit tests passed."
    else
        echo "❌ Unit tests failed."
        exit 1
    fi
fi