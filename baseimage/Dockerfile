FROM pgrandin/%target%-buildroot:toolchain

ENV BUILDROOT_DIR=/usr/local/share/

ADD baseimage_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make
