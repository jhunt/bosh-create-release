#!/bin/sh
set -eu

echo "==================="
env
echo "==================="
set
echo "==================="

VERSION=$INPUT_VERSION
TARBALL="v$VERSION.tgz"

bosh create-release --final --version "$VERSION" --tarball "$TARBALL"
echo "::set-output name=tarball::$PWD/$TARBALL"
