#!/bin/bash
source "${PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(nest-config --compiler)
COMPILER_NAME=$(basename "${COMPILER_FULL}")

perl -i -pe's/${COMPILER_FULL}/${CONDA_PREFIX}\/bin\/${COMPILER_NAME}/' "${PREFIX}/bin/nest-config"
