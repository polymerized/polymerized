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

target "golang" {
    tags = [ "polymerized/golang:latest" ]
    dockerfile = "dist/dockerfile.golang"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}

target "python" {
    tags = [ "polymerized/python:latest" ]
    dockerfile = "dist/dockerfile.python"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}

target "rust" {
    tags = [ "polymerized/rust:latest" ]
    dockerfile = "dist/dockerfile.rust"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}