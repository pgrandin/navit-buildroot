set -e

if [ -z ${target+x} ]; then
	echo "You must set the target via an environment variable"
	exit -1
fi
unset PERL_MM_OPT
cat configs/${target}_defconfig \
	../../glibc_defconfig \
	../../speedsaver_defconfig \
	../../navit_defconfig \
	> configs/speedsaver-${target}_defconfig

if [[ "$target" -ne "orangepi_zero" ]]; then
	echo "BR2_ROOTFS_POST_IMAGE_SCRIPT=\"../../custom-post-image.sh board/${target}/post-image.sh\"" >> configs/speedsaver-${target}_defconfig
fi
make defconfig speedsaver-${target}_defconfig
make

# to rebuild the kernel only:
# make linux-dirclean; make linux-rebuild; bash go.sh
