#!/bin/bash
. "${CONDA_PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(nest-config --compiler)
COMPILER_NAME=$(basename "${COMPILER_FULL}")
COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"

sed -i "s|$COMPILER_FULL|$COMPILER_RUN|g" $CONDA_PREFIX/bin/nest-config
