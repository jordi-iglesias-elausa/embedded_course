# Root CMakeLists.txt file for the project.

message("###### Processing CMakeLists.txt in folder: ${CMAKE_CURRENT_SOURCE_DIR} ######")

add_library(libTestA STATIC src/lib_test_a.c)

# Specify the include directories for the library
target_include_directories(libTestA PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/inc)

if(ENABLE_HOST_UNIT_TESTS)
  # Add tests
  add_unity_test(test_lib_test_a_2 test/test_lib_test_a.c libTestA)
endif()
