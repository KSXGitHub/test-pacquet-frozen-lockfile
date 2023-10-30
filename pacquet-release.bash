#!/bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

PACQUET_HOME=$(pwd)/pacquet-home
export PACQUET_HOME
PNPM_HOME=$(pwd)/pnpm-home
export PNPM_HOME
export RUST_BACKTRACE=1
export PATH=$HOME/programming/pacquet/target/release:$PATH

pretty-exec -- run-at "$HOME/programming/pacquet" cargo build --release
pretty-exec -- rm -rf pacquet-home node_modules
pretty-exec -- which pacquet
pretty-exec -- bash -c 'time pacquet install --frozen-lockfile'
