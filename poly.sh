#!/bin/bash

VERSION="1.0.0"

show_help() {
    echo "usage: $0 [command]"
    echo "commands:"
    echo "  python    - run a python environment"
    echo "  rust      - run a rust environment"
    echo "  golang    - run a golang environment"
    echo "  base      - run the base polymerized environment"
    echo "  version   - show tool version"
}

check_docker() {
    if ! command -v docker &> /dev/null; then
        echo "error: docker is not installed. please install or start docker to use this tool."
        exit 1
    fi
}

run_docker() {
    local language=$1
    docker run --mount type=bind,source="$(pwd)",target=/home/dev/project \
               --mount type=bind,source="$HOME/.config/github-copilot",target=/home/dev/.config/github-copilot \
               --platform linux/amd64 -it --rm "polymerized/${language}"
}

case "$1" in
    python|rust|golang)
        check_docker
        run_docker "$1"
        ;;
    base)
        check_docker
        run_docker "polymerized"
        ;;
    version)
        echo "version: $VERSION"
        ;;
    help)
        show_help
        ;;
    *)
        echo "invalid command: $1"
        show_help
        exit 1
        ;;
esac
