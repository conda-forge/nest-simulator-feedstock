#!/bin/bash
. "${CONDA_PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${COMPILER_FULL}")
#COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"
COMPILER_RUN=$(which cc)

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "COMPILER LINUX BUILD"
  bash nest-config --compiler
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  echo "COMPILER LINUX RUN"
  bash nest-config --compiler
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "COMPILER DARWIN BUILD"
  bash nest-config --compiler
  sed "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config > "${CONDA_PREFIX}"/bin/nest-config-tmp
  sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config-tmp > "${CONDA_PREFIX}"/bin/nest-config-tmp-2  
  mv "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-bac
  mv "${CONDA_PREFIX}"/bin/nest-config-tmp-2 "${CONDA_PREFIX}"/bin/nest-config
  echo "COMPILER DARWIN RUN"
  bash nest-config --compiler
else
  echo "$OSTYPE"
fi
 

