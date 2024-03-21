#!/bin/bash

set -exo pipefail
LLVM_VERSION=17


apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
  curl \
  git \
  build-essential \
  lsb-release wget \
  software-properties-common \
  gnupg \
  linux-headers-generic \
  librocksdb-dev \
  autoconf \
  gettext \
  automake \
  autopoint \
  flex \
  bison \
  gcc-multilib \
  llvm \
  lcov \
  protobuf-compiler \
  cmake


cd /usr/bin

wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
./llvm.sh ${LLVM_VERSION}

# install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup toolchain install nightly
rustup toolchain add 1.76.0-x86_64-unknown-linux-gnu
rustup default nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu

ln -s "../lib/llvm-${LLVM_VERSION}/bin/clang" clang
ln -s "../lib/llvm-${LLVM_VERSION}/bin/clang++" clang++

ln -sf /usr/bin/ld.lld-17 /usr/bin/ld
update-alternatives --install /usr/bin/cc cc "/lib/llvm-${LLVM_VERSION}/bin/clang" 50
update-alternatives --install /usr/bin/c++ c++ "/lib/llvm-${LLVM_VERSION}/bin/clang++" 50
