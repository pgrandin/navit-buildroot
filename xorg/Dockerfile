FROM pgrandin/%target%-buildroot:baseimage

ENV BUILDROOT_DIR=/usr/local/share/
ENV BUILDROOT_VERSION="2017.08"

ADD xorg_defconfig ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/configs/xorg_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make defconfig xorg_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/dl
