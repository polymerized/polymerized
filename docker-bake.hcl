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

target "python" {
    tags = [ "polymerized/python:latest" ]
    dockerfile = "dockerfile.python"
    platforms = [ "linux/amd64" ]
    contexts = { polymerized = "target:base" }
}
