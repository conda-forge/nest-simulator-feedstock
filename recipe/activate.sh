#!/bin/bash
. "${CONDA_PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(nest-config --compiler)
COMPILER_NAME=$(basename "${COMPILER_FULL}")
# COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"
COMPILER_RUN=$(which c++)

sed "s|$COMPILER_FULL|$COMPILER_RUN|g" "$CONDA_PREFIX"/bin/nest-config

if [[ $OSTYPE == 'linux'* ]]; then
  sed -i "s|$COMPILER_FULL|$COMPILER_RUN|g" "$CONDA_PREFIX"/bin/nest-config
  cat "$CONDA_PREFIX"/bin/nest-config
fi

if [[ $OSTYPE == 'darwin'* ]]; then
  sed "s|$COMPILER_FULL|$COMPILER_RUN|g" "$CONDA_PREFIX"/bin/nest-config > "$CONDA_PREFIX"/bin/nest-config
  sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "$CONDA_PREFIX"/bin/nest-config
  cat "$CONDA_PREFIX"/bin/nest-config
fi
