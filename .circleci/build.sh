sha1=`git log --format=format:%H -1 ${stage}/`
docker pull pgrandin/${target}-buildroot:${sha1} &&
   docker tag pgrandin/${target}-buildroot:${sha1} pgrandin/${target}-buildroot:${stage} ||
   sed -i -e "s/%target/${target}/" ${stage}/Dockerfile &&
   docker build -t pgrandin/${target}-buildroot:${stage} ${stage}
