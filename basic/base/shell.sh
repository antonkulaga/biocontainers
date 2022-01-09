#!/usr/bin/env bash

set -ef -o pipefail
source /usr/local/bin/activate_env.sh
exec bash -o pipefail -c "$@"