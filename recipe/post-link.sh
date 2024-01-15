#!/bin/bash

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${CXX}")
COMPILER_RUN=$(which "${COMPILER_NAME}")


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  cp "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config.orig
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i'.orig' "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  sed -i'.orig' "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
else
  echo $OSTYPE
fi