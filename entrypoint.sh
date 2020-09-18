#!/bin/sh
set -eu

VERSION=$INPUT_VERSION
TARBALL="v$VERSION.tgz"

set -x
bosh create-release --final --version "$VERSION" --tarball "$TARBALL"
echo "::set-output name=tarball::$PWD/$TARBALL"
