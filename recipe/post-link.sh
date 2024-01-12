#!/bin/bash

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${CXX}")
COMPILER_RUN=$(which "${COMPILER_NAME}")


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  cat "${CONDA_PREFIX}"/bin/nest-config | sed "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  cat "${CONDA_PREFIX}"/bin/nest-config | sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
  cat "${CONDA_PREFIX}"/bin/nest-config | sed "s|x86_64-apple-darwin*-clang\+\+|clang++|g" "${CONDA_PREFIX}"/bin/nest-config
else
  echo $OSTYPE
fi