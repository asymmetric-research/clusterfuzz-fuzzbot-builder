#!/bin/bash
set -exo pipefail
id
export HOME=/root
. /root/.profile
echo $PATH
echo `which cargo`
git config --global --add safe.directory /github/workspace
exec bash -c "$@"
