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
cp 0004-ARM-dts-orange-pi-zero-enable-i2c.patch ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/board/orangepi/orangepi-zero/patches/linux/
cp -r ../packages/* ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/
pushd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/
patch -p0 < ../../../packages/package.patch
# patch -p0 < ../../../packages/rpi-userland.patch

cat >> board/orangepi/orangepi-zero/linux-extras.config << EOF
# usb serial
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_ACM=y
EOF

bash go.sh
