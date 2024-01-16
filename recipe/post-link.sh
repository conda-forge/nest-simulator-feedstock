#!/bin/bash

now=$(date +"%b%d-%Y-%H%M%S")

COMPILER_FULL=$(bash nest-config --compiler)
COMPILER_NAME=$(basename "${CXX}")
COMPILER="${CONDA_PREFIX}/bin/${COMPILER_NAME}"

# To use nest with nestml in linux install
#     mamba install -c conda-forge gcc_impl_linux-64 gcc_linux-64 gxx_impl_linux-64 gxx_linux-64
#
# To use nest with nestml in osx-64 install
#     mamba install -c conda-forge clangxx clangxx_impl_osx-64 clangxx_osx-64
#
# To use nest with nestml in osx-arm64 install
#     mamba install -c conda-forge clangxx clangxx_impl_osx-arm64 clangxx_osx-arm64
#
# Update `nest-config.sh` with `.nest-simulator-post-link.sh`

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  cp "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-"${now}".orig
  sed -i "s|${COMPILER_FULL}|${COMPILER}|g" "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  cp "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-"${now}".orig
  sed -i'.bac' "s|${COMPILER_FULL}|${COMPILER}|g" "${CONDA_PREFIX}"/bin/nest-config
  sed -i'.bac' "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
else
  echo $OSTYPE
fi