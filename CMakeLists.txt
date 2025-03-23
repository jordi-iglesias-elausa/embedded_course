# Root CMakeLists.txt file for the project.
cmake_minimum_required(VERSION 3.15.3)

project(embedded_course LANGUAGES C CXX)

# Specify the C standard
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED True)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add subdirectories for libraries (tells CMake to process the CMakeLists in those subfolders)
# This ensures that libraries are built before the application (since the app will link against them).
add_subdirectory(src/libs/libTestA)

# Add subdirectories for applications
add_subdirectory(src/app/appTestA)
add_subdirectory(src/app/appTestB)
