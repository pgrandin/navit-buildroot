FROM ubuntu:16.04

ENV BUILDROOT_DIR=/usr/local/share/

RUN apt-get update  && apt-get install -y expect-dev wget git build-essential file cpio unzip python bc \
        && apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget -nv -q https://buildroot.org/downloads/buildroot-2017.02.3.tar.gz \
	&& tar xfz buildroot-2017.02.3.tar.gz -C ${BUILDROOT_DIR}  \
	&& rm buildroot-2017.02.3.tar.gz

ADD package/navit ${BUILDROOT_DIR}/buildroot-2017.02.3/package/navit/
COPY package/Config.in ${BUILDROOT_DIR}/buildroot-2017.02.3/package/Config.in
COPY config-navit-gtk ${BUILDROOT_DIR}/buildroot-2017.02.3/.config
COPY build.sh ${BUILDROOT_DIR}/buildroot-2017.02.3/build.sh
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && bash build.sh toolchain
RUN cd ${BUILDROOT_DIR}/buildroot-2017.02.3/ && bash build.sh

# For testing purposes only
RUN apt-get update  && apt-get install -y libncurses5-dev vim
