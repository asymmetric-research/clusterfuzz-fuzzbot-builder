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
  librocksdb-dev \
  unzip

cd /usr/bin

curl -o llvmorg-17.0.6.zip https://fuzzcorp-dist-a9302fb.s3.us-east-2.amazonaws.com/llvmorg-17.0.6.zip
unzip llvmorg-17.0.6.zip

# install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
rustup toolchain install nightly
rustup default nightly
rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu

ln -s "/usr/bin/llvmorg-17.0.6/bin/clang" clang
ln -s "/usr/bin/llvmorg-17.0.6/bin/clang++" clang++

ln -sf //usr/bin/llvmorg-17.0.6/bin/ld.lld /usr/bin/ld
update-alternatives --install /usr/bin/cc cc "/usr/bin/llvmorg-17.0.6/bin/clang" 50
update-alternatives --install /usr/bin/c++ c++ "/usr/bin/llvmorg-17.0.6/bin/clang++" 50
