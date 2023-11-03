#!/bin/bash
set -o errexit -o pipefail -o nounset
cd "$(dirname "$0")"

PNPM_HOME=$(pwd)/pnpm-home
export PNPM_HOME

pretty-exec -- rm -rf pnpm-home pnpm-cache node_modules
pretty-exec -- which pnpm
pretty-exec -- pnpm -v
pretty-exec -- bash -c 'time pnpm install --frozen-lockfile --ignore-scripts --reporter=silent'
