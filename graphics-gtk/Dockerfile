FROM pgrandin/rpi0-buildroot:xorg

ENV BUILDROOT_DIR=/usr/local/share/
ENV BUILDROOT_VERSION="2017.08"

ADD graphics-gtk_defconfig ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/configs/graphics-gtk_defconfig
ADD package/navit ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/navit/
COPY package/Config.in ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/Config.in
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make defconfig graphics-gtk_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/dl
