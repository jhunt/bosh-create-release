#!/bin/sh
set -eu

VERSION=$1
TARBALL="v$VERSION.tgz"

bosh create-release --final --version "$VERSION" --tarball "$TARBALL"
echo "::set-output tarball=$PWD/$TARBALL"
