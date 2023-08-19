#!/bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

PACQUET_HOME="$(pwd)/pacquet-home"
export PACQUET_HOME
export TRACE=${TRACE:-pacquet=info}
export RUST_BACKTRACE=1
export PATH="$HOME/programming/pacquet/target/debug:$PATH"

pretty-exec -- run-at "$HOME/programming/pacquet" cargo build
pretty-exec -- rm -rf pacquet-home node_modules pacquet-lock.yaml
pretty-exec -- which pacquet
pretty-exec -- pacquet install
