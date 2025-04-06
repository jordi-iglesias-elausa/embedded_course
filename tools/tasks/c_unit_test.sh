#!/bin/bash

echo "🔍 Execute Unit Test 🔍"
ctest --progress --output-on-failure > ctest-log.log 2>&1
code ctest-log.log

exit 0