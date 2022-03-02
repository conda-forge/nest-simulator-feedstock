#!/bin/sh

export MPI_FLAGS=--allow-run-as-root

if [[ $(uname) == Linux ]]; then
  export MPI_FLAGS="$MPI_FLAGS;-mca;plm;isolated"
	export CFLAGS="-I${PREFIX}/include"
	export LDFLAGS="-L${PREFIX}/lib"
fi

if [[ ${target_platform} == osx-64 ]]; then
  CC=$(basename "${CC}")
else
  CC=$(basename "${GCC}")
fi

if [[ $(uname) == Darwin ]] && [[ -n ${CONDA_BUILD_SYSROOT} ]]; then
	echo 'export ${PREFIX}/bin:$PATH"' >> ~/.bash_profile
    LDFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${LDFLAGS}
    CPPFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${CPPFLAGS}
else
    CXXFLAGS="${CXXFLAGS} -lrt"
fi

CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
export CPPFLAGS CFLAGS CXXFLAGS LDFLAGS

mkdir build
cd build

# Linux build
if [[ $(uname) == Linux ]]; then
	cmake -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
        -DREADLINE_ROOT_DIR=$CONDA_PREFIX \
        -Dwith-gsl=$CONDA_PREFIX \
        -DLTDL_ROOT_DIR=$CONDA_PREFIX \
        -Dwith-python=ON \
        -Dwith-ltdl=OFF \
        -Dwith-mpi=OFF \
        -Dwith-boost=ON \
        -DCMAKE_CXX_COMPILER=mpic++ \
        -DCMAKE_C_COMPILER=mpicc \
        ..
fi

#    cmake -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
#        -Dwith-boost=ON \
#        -Dwith-openmp=ON \
#        -Dwith-python=ON \
#        -Dwith-gsl=ON ${PREFIX} \
#        -Dwith-readline=ON ${PREFIX} \
#        -Dwith-ltdl=ON ${PREFIX} \


# OSX build
if [[ $(uname) == Darwin ]]; then
	cmake -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
        -Dwith-boost=ON \
        -DCMAKE_OSX_SYSROOT=${CONDA_BUILD_SYSROOT} \
        -Dwith-openmp=ON \
        -Dwith-python=ON \
        -DPYTHON_EXECUTABLE=${PYTHON}\
        -DPYTHON_LIBRARY=${PREFIX}/lib/libpython${PY_VER}.dylib \
        -Dwith-gsl=${PREFIX} \
        -DREADLINE_ROOT_DIR=${PREFIX} \
        -DLTDL_ROOT_DIR=${PREFIX} \
..
fi

make -j${CPU_COUNT}
make install
cp ${PREFIX}/share/doc/examples/nest/nestrc.sli ${PREFIX}/.nestrc
if [[ -d ${PREFIX}/lib64 ]]
then
    cp -R ${PREFIX}/lib64/* ${PREFIX}/lib
fi

for CHANGE in "activate" "deactivate"
do
    mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    sed "s#!!!SP_DIR!!!#${SP_DIR}#g" "${RECIPE_DIR}/${CHANGE}.sh" > "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
done