FROM pgrandin/%target%-buildroot:baseimage

ENV BUILDROOT_DIR=/usr/local/share/

ADD graphics-qt5_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/graphics-qt5_defconfig
ADD package/navit ${BUILDROOT_DIR}/buildroot-2017.02.3/package/navit/
COPY package/Config.in ${BUILDROOT_DIR}/buildroot-2017.02.3/package/Config.in
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig graphics-qt5_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-2017.02.3/dl
