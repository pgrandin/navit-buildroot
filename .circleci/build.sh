stage=$1

sha1=`git log --format=format:%H -1 ${stage}/`
docker pull pgrandin/rpi0-buildroot:${sha1} &&
   docker tag pgrandin/rpi0-buildroot:${sha1} pgrandin/rpi0-buildroot:${stage} ||
   docker build -t pgrandin/rpi0-buildroot:${stage} ${stage}
