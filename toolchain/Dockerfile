FROM ubuntu:16.04

ARG target=rpi0
ENV BUILDROOT_DIR=/usr/local/share/
ENV BUILDROOT_VERSION="2017.08"

RUN apt-get update  && apt-get install -y expect-dev wget git build-essential file cpio unzip python bc \
        && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -nv -q https://github.com/buildroot/buildroot/archive/${BUILDROOT_VERSION}.tar.gz \
	&& tar xfz ${BUILDROOT_VERSION}.tar.gz -C ${BUILDROOT_DIR}  \
	&& rm ${BUILDROOT_VERSION}.tar.gz

ADD ${target}-glibc_defconfig ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/configs/${target}-glibc_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make defconfig ${target}-glibc_defconfig
RUN cd ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/ && make toolchain \
       && rm -rf ${BUILDROOT_DIR}/buildroot-${BUILDROOT_VERSION}/dl
