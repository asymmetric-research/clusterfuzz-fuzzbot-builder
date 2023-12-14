#!/bin/bash

set -exo pipefail


apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
  curl \
  git \
  build-essential \
  lsb-release wget \
  software-properties-common \
  gnupg \
  linux-headers-generic \
  librocksdb-dev

cd /usr/bin
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup toolchain install nightly
rustup default nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu

ln -s ../lib/llvm-17/bin/clang clang
ln -s ../lib/llvm-17/bin/clang++ clang++

ln -sf /usr/bin/ld.lld-17 /usr/bin/ld
update-alternatives --install /usr/bin/cc cc /lib/llvm-17/bin/clang 50
update-alternatives --install /usr/bin/c++ c++ /lib/llvm-17/bin/clang++ 50
