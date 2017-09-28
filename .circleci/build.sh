set -x

sha1=`git log --format=format:%H -1 ${stage}/`
sed -i -e "s/%target%/${target}/" ${stage}/Dockerfile

from=`grep "FROM pgrandin/" ${stage}/Dockerfile |cut -f2 -d ' '`

if [[ "${from}" != "" ]]; then
    from_tag=`echo $from|cut -f2 -d':'`
    sha1_tag=`git log --format=format:%H -1 ${from_tag}/`
    new_from=`echo $from|sed -e "s/${from_tag}/${sha1_tag}/"`
    git checkout ${stage}/Dockerfile
    sed -i -e "s@${from}@${new_from}@" ${stage}/Dockerfile
fi


if [[ "${stage}" == "baseimage" ]]; then
    cat toolchain/${target}-glibc_defconfig >> baseimage/baseimage_defconfig
elif [[ "${stage}" == "graphics-qt5" || "${stage}" == "xorg" ]]; then
    cat toolchain/${target}-glibc_defconfig >> ${stage}/${stage}_defconfig
    cat baseimage/baseimage_defconfig >> ${stage}/${stage}_defconfig
elif [[ "${stage}" == "graphics-gtk" ]]; then
    cat toolchain/${target}-glibc_defconfig >> ${stage}/${stage}_defconfig
    cat baseimage/baseimage_defconfig >> ${stage}/${stage}_defconfig
    cat baseimage/xorg_defconfig >> ${stage}/${stage}_defconfig
fi

docker pull pgrandin/${target}-buildroot:${sha1} &&
   docker tag pgrandin/${target}-buildroot:${sha1} pgrandin/${target}-buildroot:${stage} ||
   docker build -t pgrandin/${target}-buildroot:${stage} ${stage}
