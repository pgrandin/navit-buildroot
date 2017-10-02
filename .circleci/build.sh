set -x
set -e

git checkout ${stage}/Dockerfile

sed -i -e "s/%target%/${target}/" ${stage}/Dockerfile

find ${stage} -type f | xargs md5sum | sort > ${stage}.txt
tag=`md5sum ${stage}.txt | cut -d' ' -f1`
# tag=`git log --format=format:%H -1 ${stage}/`

echo "Going to build/check for pgrandin/${target}-buildroot:${tag}"

from=`grep "FROM pgrandin/" ${stage}/Dockerfile |cut -f2 -d ' '`
if [[ "${from}" != "" ]]; then
    from_tag=`echo $from|cut -f2 -d':'`
    find ${from_tag} -type f | xargs md5sum > ${from_tag}.txt
    from_md5=`md5sum ${from_tag}.txt | cut -d' ' -f1`
    new_from=`echo $from|sed -e "s/${from_tag}/${from_md5}/"`
    sed -i -e "s@${from}@${new_from}@" ${stage}/Dockerfile
    echo "Going to use '${new_from}' to build/check for pgrandin/${target}-buildroot:${tag}"
fi

if [[ "${stage}" == "baseimage" ]]; then
    cat toolchain/${target}-glibc_defconfig >> baseimage/baseimage_defconfig
elif [[ "${stage}" == "graphics-qt5" || "${stage}" == "xorg" ]]; then
    cat toolchain/${target}-glibc_defconfig >> ${stage}/${stage}_defconfig
    cat baseimage/baseimage_defconfig >> ${stage}/${stage}_defconfig
elif [[ "${stage}" == "graphics-gtk" ]]; then
    cat toolchain/${target}-glibc_defconfig >> ${stage}/${stage}_defconfig
    cat baseimage/baseimage_defconfig >> ${stage}/${stage}_defconfig
    cat xorg/xorg_defconfig >> ${stage}/${stage}_defconfig
fi

set +e
docker pull pgrandin/${target}-buildroot:${tag} &&
   docker tag pgrandin/${target}-buildroot:${tag} pgrandin/${target}-buildroot:${stage} ||
   docker build -t pgrandin/${target}-buildroot:${stage} ${stage}
