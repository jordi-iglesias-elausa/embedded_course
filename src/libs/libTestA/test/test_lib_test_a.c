/********************************************************************************
 * Copyright (C) 2024 by Elausa
 * The software has been developed by Elausa.
 * Elausa is the owner of all rights derived from the intellectual property of
 * this software. The status of Elausa as the author of this software must
 * always be recognized, as well as preserving its integrity. This software is
 * provided 'as is', without warranty of any kind, express or implied. Elausa
 * assumes no responsibility for any incidents that may occur as a result of
 * negligent or malicious use of the software. Elausa assigns the economic
 * rights derived from the intellectual property to [COMPANY_NAME]. This text
 * cannot be omitted or deleted from this file. It must always be kept in the
 * header of the file even if modifications are made to the software.
 ********************************************************************************/

/**
 * @file test_lib_test_a.c
 * @author jordi iglesias
 * @date xx/xx/xxxx
 * @brief Brief description of the file
 *
 * Detailed description of the file (if necessary)
 */

// ****** HEADERS ******

// C system headers (e.g., <unistd.h>, <stdlib.h>).
#include <unity.h>

// C/C++ standard library headers (e.g., <algorithm>, <cstddef>).

// Other libraries' .h files.

// Your project's .h files.
#include "lib_test_a.h"

// ****** MACROS ******

// ****** TYPEDEFS DECLARATION ******

// ****** TYPEDEFS DEFINITION ******

// ****** STATIC VARIABLES ******

// ****** GLOBAL VARIABLES ******

// ****** STATIC FUNCTIONS DECLARATION ******

// ****** STATIC FUNCTIONS DEFINITION ******

// Test Setup function (optional)
void setUp(void) {
  // This runs before each test, can be left empty if no setup is needed
}

// Test Tear Down function (optional)
void tearDown(void) {
  // This runs after each test, can be left empty if no cleanup is needed
}

// ****** GLOBAL FUNCTIONS DEFINITION ******

void test_libTestA_check_add(void) {
  uint16_t expected = 10;

  TEST_ASSERT_EQUAL(expected, add(4, 6));
}

void test_libTestA_check_add_withFailure(void) {
  uint16_t expected = 11;

  TEST_ASSERT_EQUAL(expected, add(1, 9));
}