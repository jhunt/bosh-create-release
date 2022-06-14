#!/bin/sh
set -eu
VERSION=${INPUT_VERSION:-}
TARBALL=${INPUT_TARBALL:-bosh-release.tgz}

git config --global --add safe.directory $PWD

if [ "x${VERSION:-}" = "x" ]; then
  bosh -n --no-color create-release --timestamp-version --force --tarball "$TARBALL"
  exit 0
fi

# real, production-y release
cat > config/private.yml <<EOF
---
blobstore:
  provider: s3
  options:
    access_key_id:     $INPUT_S3_ACCESS_KEY_ID
    secret_access_key: $INPUT_S3_SECRET_ACCESS_KEY
EOF
bosh -n --no-color create-release --version "$VERSION" --tarball "$TARBALL" --final
chmod 0644 "$TARBALL"
ls -lah $TARBALL
