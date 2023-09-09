#!/bin/sh

set -o nounset  # (set -u) No unset variables
set -o errexit  # (set -e) Exit if any statement returns non-true value

PROJECT_NAME="hello-rpi-pico"
BUILD_DIRECTORY="build-release"
CMAKE_ARGS="-DCMAKE_BUILD_TYPE=Release"

cd "$(dirname -- "$0")"

# Create build directory and run cmake if necessary
if [ ! -d "$BUILD_DIRECTORY" ]; then
    mkdir -p "$BUILD_DIRECTORY"
    cd "$BUILD_DIRECTORY"
    eval cmake $CMAKE_ARGS ..
    cd ../
fi

make -C "$BUILD_DIRECTORY"

GIT_VER="$(git describe --tags --dirty)"
RELEASE_FILE="$PROJECT_NAME-$GIT_VER"

cp -vaf "$BUILD_DIRECTORY/$PROJECT_NAME.uf2" "$RELEASE_FILE.uf2"
sha1sum "$RELEASE_FILE.uf2" > "$RELEASE_FILE.txt"
