#!/bin/bash

set -euo pipefail

## -----------------------------------------------------
## Utility methods

function info() { local msg=$1;
  echo "${GREEN}[INFO]${CLEAR} ${msg}"
}



## -----------------------------------------------------
## Main

mkdir -p /tmp/nim-install && pushd $_

curl https://nim-lang.org/download/nim-1.4.8-linux_x64.tar.xz \
  --output nim-1.4.8.tar.xz
# TODO: Verify hash (with error log message)

tar -xvf nim-1.4.8.tar.xz
pushd nim-1.4.8

./install.sh /usr/local/bin
# This copies a lot of files (^^) but for whatever reasons just leaves a bunch of the
# nim support binaries to rot ( ¯\_(ツ)_/¯ ). So do this ourselves I guess
cp bin/* /usr/local/bin/

info "Installed nim"
info "Upgrading nimble"

nimble install --accept nimble

popd # nim-1.4.8
popd # nim-install
rm -rf /tmp/nim-install
