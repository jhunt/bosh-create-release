#!/bin/sh
set -eu
cat > config/private.yml <<EOF
---
blobstore:
  provider: s3
  options:
    access_key_id:     $INPUT_S3_ACCESS_KEY_ID
    secret_access_key: $INPUT_S3_SECRET_ACCESS_KEY
EOF
bosh create-release --version "$INPUT_VERSION" --tarball "$INPUT_TARBALL" --final
chmod 0644 "$INPUT_TARBALL"
