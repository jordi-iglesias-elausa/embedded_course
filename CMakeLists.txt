# Root CMakeLists.txt file for the project.
cmake_minimum_required(VERSION 3.28.1)

message("###### Processing CMakeLists.txt in folder: ${CMAKE_CURRENT_SOURCE_DIR} ######")

project(embedded_course LANGUAGES C ASM)

# Specify CMake generator for Linux (generator will produce standard Makefiles, compatible with the make build tool)
set(CMAKE_GENERATOR "Unix Makefiles" CACHE STRING "Default generator for Linux")

message("66666666666666666666666 SELECTED_CMAKE_PRESET: ${SELECTED_CMAKE_PRESET}")

# Set the toolchain file based on a configuration preset
if(SELECTED_CMAKE_PRESET STREQUAL "NUCLEO_WBA52CG_EXAMPLES_DEBUG" OR(SELECTED_CMAKE_PRESET STREQUAL "NUCLEO_WBA52CG_EXAMPLES_RELEASE"))
  message("Using toolchain file for NUCLEO_WBA52CG")
  include("/workspaces/embedded_course/tools/cmake/toolchain/arm/gcc-arm-none-eabi.cmake")
elseif((SELECTED_CMAKE_PRESET STREQUAL "HOST_EXAMPLES_DEBUG") OR(SELECTED_CMAKE_PRESET STREQUAL "HOST_EXAMPLES_RELEASE"))
  message("Using toolchain file for Linux host")
  include("/workspaces/embedded_course/tools/cmake/toolchain/linux_host/gcc-linux-host.cmake")
elseif(SELECTED_CMAKE_PRESET STREQUAL "HOST_UNIT_TESTS_DEBUG" OR(SELECTED_CMAKE_PRESET STREQUAL "HOST_UNIT_TESTS_RELEASE"))
  message("Using toolchain file for Linux host unit tests")
  include("/workspaces/embedded_course/tools/cmake/toolchain/linux_host/gcc-linux-host.cmake")
else()
  message(FATAL_ERROR "You have to select a target in the configuration preset.")
endif()

# check toolchain file
message("C Compiler used: '${CMAKE_C_COMPILER}'")
message("C++ Compiler used: '${CMAKE_CXX_COMPILER}'")

# Check output folders
message("Source folder: ${PROJECT_SOURCE_DIR}")
message("Binary folder: ${PROJECT_BINARY_DIR}")

# Set project version
set(PROJECT_VERSION_MAJOR 1)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH RC1)
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")
message("Version: ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

# Specify the C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# print compiler and flags for each language and build type
foreach(lang C CXX)
  message("Compiler for language ${lang}: ${CMAKE_${lang}_COMPILER}")

  foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
    message("Flags for language ${lang} + build type ${build_type}: ${CMAKE_${lang}_FLAGS_${build_type}}")
  endforeach()
endforeach()

add_subdirectory(tools)

if(ENABLE_HOST_EXAMPLES)
  message("Enabling host examples")
  add_subdirectory(src)
endif()

if(ENABLE_HOST_UNIT_TESTS)
  message("Enabling host unit tests")

  include(CTest)

  # include helpers for unit tests
  list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/tools/cmake/unit_test)
  include(unit_test_helpers)

  add_subdirectory(src)
endif()

if(ENABLE_NUCLEO_WBA52CG_EXAMPLES)
  message("Enabling NUCLEO_WBA52CG examples")
  add_subdirectory(src/nucleo_wba52gc)
endif()
