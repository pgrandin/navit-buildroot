FROM pgrandin/%target%-buildroot:baseimage

ENV BUILDROOT_DIR=/usr/local/share/

ADD xorg_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/xorg_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig xorg_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-2017.02.3/dl
