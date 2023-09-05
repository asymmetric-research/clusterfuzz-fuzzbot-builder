#!/bin/bash

set -exo pipefail


apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y git build-essential lsb-release wget software-properties-common gnupg linux-headers-5.15.0-56-generic
cd /usr/bin
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

ln -s ../lib/llvm-17/bin/clang clang
ln -s ../lib/llvm-17/bin/clang++ clang++
rm -r /usr/include/x86_64-linux-gnu/

