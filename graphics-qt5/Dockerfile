FROM pgrandin/%target%-buildroot:baseimage

ENV BUILDROOT_DIR=/usr/local/share/
ENV BUILDROOT_VERSION="2017.08"

ADD graphics-qt5_defconfig ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/configs/graphics-qt5_defconfig
ADD package/navit ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/navit/
COPY package/Config.patch ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/Config.patch
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/package/ && patch -p0 < Config.patch
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make defconfig graphics-qt5_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make \
        && rm -rf ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/dl
