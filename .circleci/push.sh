stage=$1

sha1=`git log --format=format:%H -1 ${stage}/`
docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker tag pgrandin/rpi0-buildroot:${stage} pgrandin/rpi0-buildroot:${sha1}
docker push pgrandin/rpi0-buildroot:${stage}
docker push pgrandin/rpi0-buildroot:${sha1}
