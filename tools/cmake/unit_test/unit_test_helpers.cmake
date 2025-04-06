function(add_unity_test TEST_NAME TEST_SOURCE)
  # Paths to Unity's script and the generated runner
  set(UNITY_SCRIPT "${PROJECT_SOURCE_DIR}/tools/unity/auto/generate_test_runner.rb")

  # if a path for the file is specified, the folders must exits because generate_test_runner don't create paths automatically
  set(RUNNER_SOURCE "${TEST_NAME}_runner.c")

  # get the absolute path of the test source file
  get_filename_component(TEST_NAME_SRC_ABS_PATH ${TEST_SOURCE} REALPATH)

  # Command to generate the test runner
  add_custom_command(
    OUTPUT ${RUNNER_SOURCE}
    COMMAND ruby ${UNITY_SCRIPT} ${TEST_NAME_SRC_ABS_PATH} ${RUNNER_SOURCE}
    DEPENDS ${TEST_SOURCE}
    COMMENT "Generating test runner for ${TEST_SOURCE}"
    VERBATIM
  )

  # Create an executable for the test
  add_executable(${TEST_NAME} ${TEST_SOURCE} ${RUNNER_SOURCE})

  # Link the test executable with Unity, the target under test, and additional libraries
  target_link_libraries(${TEST_NAME} unity)
  target_link_libraries(${TEST_NAME} ${ARGN}) # Link all aditional dependencies passed as extra arguments

  # Add the test to CTest
  add_test(NAME ${TEST_NAME} COMMAND ${TEST_NAME})
endfunction()
