# Root CMakeLists.txt file for the project.

message("###### Processing CMakeLists.txt in folder: ${CMAKE_CURRENT_SOURCE_DIR} ######")

if(ENABLE_HOST_EXAMPLES_DEBUG OR ENABLE_HOST_EXAMPLES_RELEASE)
  add_executable(appTestB src/main.c)
  target_link_libraries(appTestB PRIVATE libTestA)
endif()
