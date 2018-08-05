#!/bin/bash

if [[ "$USER" != "root" ]]; then
  echo "script must run as root"
  exit 1
fi

set -eux

export DEBIAN_FRONTEND=noninteractive

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD
release="$(lsb_release -cs)"
echo "deb https://repo.iovisor.org/apt/$release $release main" | tee /etc/apt/sources.list.d/iovisor.list
echo "deb [trusted=yes] https://repo.iovisor.org/apt/$release $release-nightly main" | tee -a /etc/apt/sources.list.d/iovisor.list

apt-get install -y software-properties-common
apt-get update
apt-get upgrade -y
