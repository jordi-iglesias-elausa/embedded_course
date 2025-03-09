# Ensure a search path is provided
SEARCH_PATH=${1:-$PWD}

echo "Searching for Makefile in: $SEARCH_PATH"

# Find all directories containing a Makefile
MAKEFILE_DIRS=($(find "$SEARCH_PATH" -type f -name "Makefile" -exec dirname {} \;))

# If multiple Makefiles are found, let the user select one
if [[ ${#MAKEFILE_DIRS[@]} -eq 0 ]]; then
    echo "Error: No Makefiles found in $SEARCH_PATH"
    exit 1
elif [[ ${#MAKEFILE_DIRS[@]} -gt 1 ]]; then
    echo "Multiple Makefiles found. Please select one:"
    select DIR in "${MAKEFILE_DIRS[@]}"; do
        if [[ -n "$DIR" ]]; then
            MAKEFILE_DIR="$DIR"
            break
        fi
    done
else
    MAKEFILE_DIR="${MAKEFILE_DIRS[0]}"
fi

echo "Using Makefile in: $MAKEFILE_DIR"

# Change to the selected directory
cd "$MAKEFILE_DIR" || { echo "Error: Failed to enter directory $MAKEFILE_DIR"; exit 1; }

# Ensure Bear is installed
if ! command -v bear &> /dev/null; then
    echo "Bear is not installed. Installing Bear..."
    sudo apt update
    sudo apt install -y bear
fi

# Check if Makefile exists
if [[ ! -f Makefile ]]; then
    echo "Error: No Makefile found in $BUILD_DIR"
    exit 1
fi

# Clean previous build
echo "Cleaning previous build..."
make clean

# Run Bear to generate compile_commands.json
echo "Generating compile_commands.json..."
bear -- make

# Verify if the file was generated
if [[ -f compile_commands.json ]]; then
    echo "Success: compile_commands.json has been generated in $BUILD_DIR"
else
    echo "Error: Failed to generate compile_commands.json."
    exit 1
fi
