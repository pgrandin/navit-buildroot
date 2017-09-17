FROM pgrandin/rpi0-buildroot:toolchain

ENV BUILDROOT_DIR=/usr/local/share/

ADD navit-gtk_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/navit-gtk_defconfig
ADD package/navit ${BUILDROOT_DIR}/buildroot-2017.02.3/package/navit/
COPY package/Config.in ${BUILDROOT_DIR}/buildroot-2017.02.3/package/Config.in
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig navit-gtk_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make
