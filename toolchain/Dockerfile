FROM ubuntu:16.04

ENV BUILDROOT_DIR=/usr/local/share/

RUN apt-get update  && apt-get install -y expect-dev wget git build-essential file cpio unzip python bc \
        && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -nv -q https://buildroot.org/downloads/buildroot-2017.02.3.tar.gz \
	&& tar xfz buildroot-2017.02.3.tar.gz -C ${BUILDROOT_DIR}  \
	&& rm buildroot-2017.02.3.tar.gz

ADD rpi0-glibc_toolchain ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/rpi0-glibc_toolchain
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig rpi0-glibc_toolchain
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make toolchain
