BUILDROOT_DIR="local_build"
BUILDROOT_VERSION="2017.08"

mkdir -p ${BUILDROOT_DIR}

wget -nv -q https://github.com/buildroot/buildroot/archive/${BUILDROOT_VERSION}.tar.gz \
	&& tar xfz ${BUILDROOT_VERSION}.tar.gz -C ${BUILDROOT_DIR}  \
	&& rm ${BUILDROOT_VERSION}.tar.gz

cp go.sh ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/
pushd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/
