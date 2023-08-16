#!/bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

PACQUET_HOME="$(pwd)/pacquet-home"
export PACQUET_HOME

export TRACE='*'

export PATH="$HOME/programming/pacquet/target/release:$PATH"

pretty-exec -- rm -rf "$PACQUET_HOME"

pretty-exec -- which pacquet
