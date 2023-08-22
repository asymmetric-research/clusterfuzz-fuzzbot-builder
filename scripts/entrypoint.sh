#!/bin/bash
set -exo pipefail

git config --global --add safe.directory /github/workspace
exec bash -c "$@"
