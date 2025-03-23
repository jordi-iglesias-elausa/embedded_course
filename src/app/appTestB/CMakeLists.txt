# Root CMakeLists.txt file for the project.
cmake_minimum_required(VERSION 3.15.3)

add_executable(appTestB src/main.c)

target_link_libraries(appTestB PRIVATE libTestA)
