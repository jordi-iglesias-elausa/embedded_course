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
 * @file file_name.c
 * @author author_name
 * @date xx/xx/xxxx
 * @brief Brief description of the file
 *
 * Detailed description of the file (if necessary)
 */

// ****** HEADERS ******

// C system headers (e.g., <unistd.h>, <stdlib.h>).
#include <stdio.h>

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

void _exit(int status) {
  (void)status; // Avoid unused variable warning
  while (1) {
    // Infinite loop to simulate a system halt
  }
}

int _write() {
  return 0;
}

int _read() {
  return 0;
}

int _close() {
  return 0;
}

int _fstat() {
  return 0;
}

int _lseek() {
  return 0;
}

int _isatty() {
  return 0;
}

void* _sbrk() {
  return (void*)-1;
}

// ****** GLOBAL FUNCTIONS DEFINITION ******

int main() {
  int a = 10;
  int b = 5;

  int sum = add(a, b);
  int difference = subtract(a, b);
  int product = multiply(a, b);
  float quotient = divide(a, b);

  printf("Execution of the program appTestA\n");
  printf("Sum: %d\n", sum);
  printf("Difference: %d\n", difference);
  printf("Product: %d\n", product);
  printf("Quotient: %.2f\n", quotient);

  return 0;
}
