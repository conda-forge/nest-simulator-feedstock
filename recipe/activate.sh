#!/bin/bash
. "${CONDA_PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${COMPILER_FULL}")
COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  echo "$OSTYPE"
  cat "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sed "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config > "${CONDA_PREFIX}"/bin/nest-config-tmp
  mv "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-bac
  mv "${CONDA_PREFIX}"/bin/nest-config-tmp "${CONDA_PREFIX}"/bin/nest-config
  sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
  echo "$OSTYPE"
  cat "${CONDA_PREFIX}"/bin/nest-config
else
  echo "$OSTYPE"
fi
 

