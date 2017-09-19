FROM ubuntu:16.04

ARG target=rpi0
ENV BUILDROOT_DIR=/usr/local/share/

RUN apt-get update  && apt-get install -y expect-dev wget git build-essential file cpio unzip python bc \
        && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -nv -q https://buildroot.org/downloads/buildroot-2017.02.3.tar.gz \
	&& tar xfz buildroot-2017.02.3.tar.gz -C ${BUILDROOT_DIR}  \
	&& rm buildroot-2017.02.3.tar.gz

ADD ${target}-glibc_defconfig ${BUILDROOT_DIR}/buildroot-2017.02.3/configs/${target}-glibc_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make defconfig ${target}-glibc_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && make toolchain
