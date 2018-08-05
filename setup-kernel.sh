#!/bin/bash

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

kernel="$(uname -r)"
apt-get install "linux-headers-$kernel" "linux-image-$kernel"
