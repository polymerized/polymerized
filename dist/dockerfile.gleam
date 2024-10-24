# syntax=docker/dockerfile:1
FROM polymerized
# = = = = = = = = = = = = = = = = = = = = =
ENV HOSTNAME=gleam
ENV DEV_COLOR=36
# = = = = = = = = = = = = = = = = = = = = =

RUN brew update
RUN brew install gleam

# = = = = = = = = = = = = = = = = = = = = =
ENTRYPOINT ["/bin/bash"]