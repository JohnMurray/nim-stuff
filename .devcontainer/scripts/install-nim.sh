#!/bin/bash

set -euo pipefail

mkdir -p /tmp/nim-install && pushd $_

curl https://nim-lang.org/download/nim-1.4.8-linux_x64.tar.xz \
  --output nim-1.4.8.tar.xz

tar -xvf nim-1.4.8.tar.xz
pushd nim-1.4.8

./install.sh /usr/local/bin

popd # nim-1.4.8
popd # nim-install
rm -rf /tmp/nim-install
