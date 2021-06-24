#!/bin/bash

set -e

if [ -z ${target+x} ]; then
	echo "You must set the target via an environment variable"
	exit -1
fi

BUILDROOT_DIR="${target}"
COMMIT="650818fb3a6fb7b9bd9fcefabbc187c1bbe95e0a"
BUILDROOT_VERSION="${COMMIT}"

mkdir -p ${BUILDROOT_DIR}

# wget -nv -q https://github.com/buildroot/buildroot/archive/${BUILDROOT_VERSION}.tar.gz \
# 	&& tar xfz ${BUILDROOT_VERSION}.tar.gz -C ${BUILDROOT_DIR}  \
# 	&& rm ${BUILDROOT_VERSION}.tar.gz

git clone https://github.com/buildroot/buildroot.git ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/

cp go.sh ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/
cp -r ../packages/* ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/
pushd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/


git reset --hard ${COMMIT}

patch -p0 < ../../../packages/package.patch
