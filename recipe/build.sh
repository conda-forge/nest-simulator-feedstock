#!/bin/sh

export MPI_FLAGS=--allow-run-as-root

if [[ ${target_platform} == linux-* ]]; then
  export MPI_FLAGS="$MPI_FLAGS;-mca;plm;isolated"
fi

if [[ ${target_platform} == osx-64 ]]; then
  CC=$(basename "${CC}")
else
  CC=$(basename "${GCC}")
fi

# Test cython
sed '/^#!/d' ${PREFIX}/bin/cython
sed '1 i ${PREFIX}/bin/python' Textdatei 
cat ${PREFIX}/bin/cython

mkdir build
cd build

CMAKE_PREFIX_PATH=${CONDA_PREFIX} cmake ${CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
        -Dwith-boost=ON \
        -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
        -Dwith-openmp=ON \
        -Dwith-python=ON \
        -DPYTHON_EXECUTABLE=${PYTHON} \
        -DPython_EXECUTABLE=${PYTHON} \
        -Dwith-gsl=${PREFIX} \
        -DREADLINE_ROOT_DIR=${PREFIX} \
        -DLTDL_ROOT_DIR=${PREFIX} \
..

make -j${CPU_COUNT}
make install

if [[ -d ${PREFIX}/lib64 ]]
then
    cp -R ${PREFIX}/lib64/* ${PREFIX}/lib
fi

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    sed "s#!!!SP_DIR!!!#${SP_DIR}#g" "${RECIPE_DIR}/${CHANGE}.sh" > "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done
