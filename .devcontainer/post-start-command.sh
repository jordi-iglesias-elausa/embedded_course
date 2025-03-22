#!/bin/bash

echo '✅ postStartCommand running..........................................' 

#Get current directory from where the script is running
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Update the git submodules
git submodule update --init --recursive

#Set executable permissions to all files within a relative path
chmod -R +x /workspaces/embedded_course/tools/tasks

# Start the udev service and reload rules
sudo service udev start
sudo udevadm control --reload-rules
sudo udevadm trigger
