#!/bin/bash

if ! command -v docker > /dev/null 2>&1; then
    printf "[polymerized] 'docker' command not found.\n"
    exit 1
fi

function run {
    docker run --name "polymerized" --mount type=bind,source="$(pwd)",target=/home/dev/project --platform linux/amd64 -it --rm polymerized/$1
}

run "python"
