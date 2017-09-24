FROM pgrandin/rpi0-buildroot:e4b48946ea389dfc622d1dee371468df02572dde

ENV BUILDROOT_DIR=/usr/local/share/

ADD baseimage_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig baseimage_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-2017.02.3/dl
