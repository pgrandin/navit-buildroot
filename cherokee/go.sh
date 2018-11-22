set -e

if [ -z ${target+x} ]; then
	echo "You must set the target via an environment variable"
	exit -1
fi
unset PERL_MM_OPT
cat configs/${target}_defconfig \
	../../glibc_defconfig \
	../../cherokee_defconfig \
	../../navit_defconfig > configs/cherokee-${target}_defconfig
echo "BR2_ROOTFS_POST_IMAGE_SCRIPT=\"../../custom-post-image.sh board/${target}/post-image.sh\"" >> configs/cherokee-${target}_defconfig
make defconfig cherokee-${target}_defconfig
make
