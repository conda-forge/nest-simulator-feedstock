#!/bin/bash

. "${CONDA_PREFIX}/bin/nest_vars.sh"

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${CXX}")
#COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"
COMPILER_RUN=$(which "${COMPILER_NAME}")

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "COMPILER LINUX BUILD" >> "${PREFIX}"/.messages.txt
  bash nest-config --compiler >> "${PREFIX}"/.messages.txt
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  echo "COMPILER LINUX RUN" >> "${PREFIX}"/.messages.txt
  bash nest-config --compiler >> "${PREFIX}"/.messages.txt
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "COMPILER DARWIN BUILD" >> "${PREFIX}"/.messages.txt
  bash nest-config --compiler >> "${PREFIX}"/.messages.txt
  sed "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config > "${CONDA_PREFIX}"/bin/nest-config-tmp
  sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config-tmp > "${CONDA_PREFIX}"/bin/nest-config-tmp-2
  mv "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-bac
  mv "${CONDA_PREFIX}"/bin/nest-config-tmp-2 "${CONDA_PREFIX}"/bin/nest-config
  echo "COMPILER DARWIN RUN" >> "${PREFIX}"/.messages.txt
  bash nest-config --compiler >> "${PREFIX}"/.messages.txt
  cat "${CONDA_PREFIX}"/bin/nest-config >> "${PREFIX}"/.messages.txt
else
  echo "$OSTYPE" >> "${PREFIX}"/.messages.txt
fi


