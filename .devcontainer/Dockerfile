# Grab the latest supported Ubuntu version (doesn't have to be an LTS
# version... we're not that uptight)
FROM ubuntu:rolling


ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y curl gcc git xz-utils zsh

COPY scripts/install-nim.sh /tmp/install-nim.sh
RUN /tmp/install-nim.sh
