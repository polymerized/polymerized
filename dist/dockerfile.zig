# syntax=docker/dockerfile:1
FROM polymerized
# = = = = = = = = = = = = = = = = = = = = =
ENV HOSTNAME=zig
ENV DEV_COLOR=33
# = = = = = = = = = = = = = = = = = = = = =

RUN brew update
RUN brew install zig

# = = = = = = = = = = = = = = = = = = = = =
ENTRYPOINT ["/bin/bash"]