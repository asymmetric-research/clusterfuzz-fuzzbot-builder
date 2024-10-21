#!/bin/bash
set -exo pipefail
id
export HOME=/root
. /root/.profile
echo $PATH
echo `which cargo`
git config --global --add safe.directory /github/workspace
export PATH="/usr/bin/llvmorg-17.0.6/bin:$PATH"
exec bash -c "$@"
