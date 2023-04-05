#!/bin/sh

pass -c ecryptfs

[ -d "$CLOUD" ] || mkdir -v $CLOUD

sudo mount \
  -t ecryptfs \
  -o ecryptfs_cipher=aes \
  -o ecryptfs_key_bytes=32 \
  -o ecryptfs_passthrough=n \
  -o ecryptfs_enable_filename_crypto=n \
  $HOME/Dropbox/encrypted $CLOUD

