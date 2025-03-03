#!/bin/bash

#Get current directory from where the script is running
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#Update the git submodules
git submodule update --init --recursive
#Set executable permissions to all files within a relative path
chmod -R +x ./tools/tasks
