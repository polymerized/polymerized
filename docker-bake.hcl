group "all" {
    targets = [
        "default",
        "python",
        "golang",
        "rust",
    ]
}

target "base" {
    tags = [ "polymerized-polymerized-base:latest" ]
    dockerfile = "dockerfile.base"
    platforms = [ "linux/amd64" ]
}

target "default" {
    tags = [ "polymerized/polymerized:latest" ]
    dockerfile = "dockerfile.custom"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}

// = = = = = = = = = = = = = =

target "golang" {
    tags = [ "polymerized/golang:latest" ]
    dockerfile = "dist/dockerfile.golang"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}

target "rust" {
    tags = [ "polymerized/rust:latest" ]
    dockerfile = "dist/dockerfile.rust"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}

// = = = = = = = = = = = = = =

group "python" {
    targets = [
        "python_v3-12-7",
        "python_v3-11-8",
        "python_v3-9-17"
    ]
}

target "python_v3-12-7" {
    tags = [ 
        "polymerized/python:latest",
        "polymerized/python:3.12.7"
    ]
    dockerfile = "dist/dockerfile.python"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
    args = { VERSION = "3.12.7" }
}

target "python_v3-11-8" {
    tags = [ 
        "polymerized/python:3.11.8"
    ]
    dockerfile = "dist/dockerfile.python"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
    args = { VERSION = "3.11.8" }
}

target "python_v3-9-17" {
    tags = [
        "polymerized/python:3.9.17"
    ]
    dockerfile = "dist/dockerfile.python"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
    args = { VERSION = "3.9.17" }
}