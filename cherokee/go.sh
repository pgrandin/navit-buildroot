unset PERL_MM_OPT
cat configs/raspberrypi2_defconfig \
	../../glibc_defconfig \
	../../cherokee_defconfig > configs/cherokee-rpi2_defconfig
make defconfig cherokee-rpi2_defconfig
make

