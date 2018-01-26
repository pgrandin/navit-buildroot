tag=`git log --format=format:%H -1 ${stage}/`
tag=`md5sum ${stage}.txt | cut -d' ' -f1`

docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker tag pgrandin/${target}-buildroot:${stage} pgrandin/${target}-buildroot:${tag}
docker push pgrandin/${target}-buildroot:${stage}
docker push pgrandin/${target}-buildroot:${tag}

echo "pgrandin/${target}-buildroot:${tag} tagged as pgrandin/${target}-buildroot:${stage}"

docker run pgrandin/${target}-buildroot:${tag} ls /usr/local/share/buildroot-2017.08/output/images/
container=`docker ps -a|grep ${tag}|cut -f1 -d" "`
[ -d /output ] || mkdir /output
docker cp ${container}:/usr/local/share/buildroot-2017.08/output/images/ /output/${stage}
