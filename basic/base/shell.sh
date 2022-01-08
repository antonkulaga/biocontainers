#!/usr/bin/env bash

set -ef -o pipefail
source activate_env.sh
exec bash -o pipefail -c "$@"