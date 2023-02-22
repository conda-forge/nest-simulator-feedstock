#!/bin/bash
. "${CONDA_PREFIX}/bin/nest_vars.sh"

cat "$CONDA_PREFIX"/bin/nest-config

env


assert_var() {
   if [[ -z ${!1+x} ]]; then
      echo '!!!!NOT EXISTS!'
      echo $1
   else
      echo '!!!!EXISTS!'
      echo $1
   fi
}

assert_var "PREFIX"




#Source: https://stackoverflow.com/questions/62678246




COMPILER_FULL=$(nest-config --compiler)
#COMPILER_NAME=$(basename "${COMPILER_FULL}")
#COMPILER_RUN="${CONDA_PREFIX}/bin/${COMPILER_NAME}"
COMPILER_RUN=$(which cc)

# sed "s|$COMPILER_FULL|$COMPILER_RUN|g" "$CONDA_PREFIX"/bin/nest-config

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sed -i "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config
  cat "${CONDA_PREFIX}"/bin/nest-config
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sed "s|${COMPILER_FULL}|${COMPILER_RUN}|g" "${CONDA_PREFIX}"/bin/nest-config > "${CONDA_PREFIX}"/bin/nest-config-tmp
  mv "${CONDA_PREFIX}"/bin/nest-config "${CONDA_PREFIX}"/bin/nest-config-bac
  mv "${CONDA_PREFIX}"/bin/nest-config-tmp "${CONDA_PREFIX}"/bin/nest-config
  sed "s|-fopenmp=libomp|-Xclang -fopenmp|g" "${CONDA_PREFIX}"/bin/nest-config
  cat "${CONDA_PREFIX}"/bin/nest-config
else
  echo "$OSTYPE"
fi

# how to add if ostype ?    

