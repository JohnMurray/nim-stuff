#!/bin/bash

set -euo pipefail

## -----------------------------------------------------
## Constants

INSTALL_BIN_DIR=/usr/local/bin

GREEN='\033[0;32m'
ORANGE='\033[0;33m'
RED='\033[0;31m'
CLEAR='\033[0m'


## -----------------------------------------------------
## Utility methods


function info() { local msg=$1;
  echo -e "${GREEN}[INFO]${CLEAR} ${msg}"
}

function warn() { local msg=$1;
  echo -e "${ORANGE}[WARN]${CLEAR} ${msg}"
}

function error() { local msg=$1;
  echo -e "${RED}[ERROR]${CLEAR} ${msg}"
  exit 1
}

function assert_file() { local file=$1;
    [[ ! -e "$file" ]] && fatal "[ASSERTION FAIL] File '$file' does not exist"
    true
}


## -----------------------------------------------------
## Main

mkdir -p /tmp/nim-install && pushd $_

curl https://nim-lang.org/download/nim-1.4.8-linux_x64.tar.xz --output nim-1.4.8.tar.xz
curl https://nim-lang.org/download/nim-1.4.8-linux_x64.tar.xz.sha256 --output nim-1.4.8.tar.xz.sha256

cat nim-1.4.8.tar.xz.sha256
sha256sum nim-1.4.8.tar.xz

[[ "$(sha256sum nim-1.4.8.tar.xz | awk '{print $1}')" = "$(cat nim-1.4.8.tar.xz.sha256 | awk '{print $1}')" ]] \
  || error "Downloaded nim binary did not match expected SHA256"

tar -xvf nim-1.4.8.tar.xz
pushd nim-1.4.8

./install.sh "$INSTALL_BIN_DIR"
# This copies a lot of files (^^) but for whatever reasons just leaves a bunch of the
# nim support binaries to rot ( ¯\_(ツ)_/¯ ). So do this ourselves I guess
cp bin/* "${INSTALL_BIN_DIR}/"

info "Installed nim"
info "Upgrading nimble"

assert_file "${INSTALL_BIN_DIR}/nimble"
"${INSTALL_BIN_DIR}/nimble" install --accept nimble

popd # nim-1.4.8
popd # nim-install
rm -rf /tmp/nim-install
