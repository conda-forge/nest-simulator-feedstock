#!/bin/sh

export MPI_FLAGS=--allow-run-as-root

export CXXFLAGS="-Wno-c++11-narrowing"

if [[ ${target_platform} == linux-* ]]; then
  export MPI_FLAGS="$MPI_FLAGS;-mca;plm;isolated"
fi

if [[ $(uname) == Linux ]]; then
    export MPI_FLAGS="$MPI_FLAGS;-mca;plm;isolated"
	export CFLAGS="-I${PREFIX}/include"
	export LDFLAGS="-L${PREFIX}/lib"
fi

if [[ ${target_platform} == osx-* ]]; then
  CC=$(basename "${CC}")
else
  CC=$(basename "${GCC}")
fi

if [[ $(uname) == Darwin ]] && [[ -n ${CONDA_BUILD_SYSROOT} ]]; then
	echo 'export ${PREFIX}/bin:$PATH"' >> ~/.bash_profile
	CFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${CFLAGS}
    LDFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${LDFLAGS}
    CPPFLAGS="-isysroot ${CONDA_BUILD_SYSROOT} "${CPPFLAGS}
fi

CPPFLAGS="${CPPFLAGS} -I${PREFIX}/include"
CXXFLAGS="${CXXFLAGS} -lrt"

export CPPFLAGS CFLAGS CXXFLAGS LDFLAGS



# if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
#   export CMAKE_ARGS="${CMAKE_ARGS} -Dcythonize-pynest=OFF -DRUN_RESULT=0 -DRUN_RESULT__TRYRUN_OUTPUT:STRING="""
#   pushd pynest || return
#   ${PYTHON} -m cython pynestkernel.pyx --cplus
#   popd || return
# fi

mkdir ../build
pushd ../build || exit
cmake -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" ${SRC_DIR}

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
