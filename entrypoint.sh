#!/bin/sh
set -eu
bosh sync-blobs
bosh create-release --final --version "$INPUT_VERSION" --tarball "$INPUT_TARBALL"
chmod 0644 $INPUT_TARBALL
