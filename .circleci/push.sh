stage=$1

sha1=`git log --format=format:%H -1 ${stage}/`
docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker tag pgrandin/rpi0-buildroot:${stage} pgrandin/rpi0-buildroot:${sha1}
docker push pgrandin/rpi0-buildroot:${stage}
docker push pgrandin/rpi0-buildroot:${sha1}

docker run pgrandin/rpi0-buildroot:${sha1} ls /usr/local/share/buildroot-2017.02.3/output/images/
container=`docker ps -a|grep ${sha1}|cut -f1 -d" "`
[ -d /output ] || mkdir /output
docker cp ${container}:/usr/local/share/buildroot-2017.02.3/output/images/ /output/${stage}
