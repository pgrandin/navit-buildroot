unset PERL_MM_OPT
cat configs/${target}_defconfig \
	../../glibc_defconfig \
	../../cherokee_defconfig > configs/cherokee-${target}_defconfig
echo "BR2_ROOTFS_POST_IMAGE_SCRIPT=\"../../custom-post-image.sh board/${target}/post-image.sh\"" >> configs/cherokee-${target}_defconfig
make defconfig cherokee-${target}_defconfig
make
