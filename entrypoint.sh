#!/bin/sh
set -eu
bosh create-release --final --version "$INPUT_VERSION" --tarball "$INPUT_TARBALL"
