#!/bin/bash

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${CXX}")
COMPILER_RUN=$(which "${COMPILER_NAME}")

MAC_BLD_ENV="/Users/runner/miniforge3/conda-bld/nest-simulator_"
MAC_BLD_COMPILER="/_build_env/bin/x86_64-apple-darwin*-clang++"
MAC_COMPILER="${CONDA_PREFIX}/bin/clang++"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  cp "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config.orig
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  cp "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config.orig
  sed -i'.bac' "s|${MAC_BLD_ENV}*${MAC_BLD_COMPILER}|${CONDA_PREFIX}/bin/clang++|g" "${CONDA_PREFIX}"/bin/nest-config
  sed -i'.bac' "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
else
  echo $OSTYPE
fi