#!/bin/sh

export MPI_FLAGS=--allow-run-as-root

if [[ ${target_platform} == linux-* ]]; then
  export MPI_FLAGS="$MPI_FLAGS;-mca;plm;isolated"
fi

if [[ ${target_platform} == osx-* ]]; then
  CC=$(basename "${CC}")
else
  CC=$(basename "${GCC}")
fi

# if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
#   export CMAKE_ARGS="${CMAKE_ARGS} -Dcythonize-pynest=OFF -DRUN_RESULT=0 -DRUN_RESULT__TRYRUN_OUTPUT:STRING="""
#   pushd pynest || return
#   ${PYTHON} -m cython pynestkernel.pyx --cplus
#   popd || return
# fi

mkdir ../build
pushd ../build || exit
cmake -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
      -Dwith-boost=ON \
      -DCMAKE_OSX_SYSROOT="${CONDA_BUILD_SYSROOT}" \
      -Dwith-openmp=ON \
      -Dwith-python=ON \
      -Dwith-hdf5=ON \
      -DPYTHON_EXECUTABLE="${PYTHON}" \
${SRC_DIR}

make -j"${CPU_COUNT}"
make install

if [[ -d ${PREFIX}/lib64 ]]
then
    cp -R "${PREFIX}"/lib64/* "${PREFIX}"/lib
fi

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    sed "s#!!!SP_DIR!!!#${SP_DIR}#g" "${RECIPE_DIR}/${CHANGE}.sh" > "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done
