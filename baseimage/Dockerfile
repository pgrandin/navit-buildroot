FROM pgrandin/%target%-buildroot:toolchain

ENV BUILDROOT_DIR=/usr/local/share/
ENV BUILDROOT_VERSION="2017.08"

ADD baseimage_defconfig ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/configs/baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make defconfig baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/dl
