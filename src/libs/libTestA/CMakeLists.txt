# Root CMakeLists.txt file for the project.
cmake_minimum_required(VERSION 3.15.3)

add_library(libTestA STATIC src/lib_test_a.c)

# Specify the include directories for the library
target_include_directories(libTestA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)
