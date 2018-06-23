#!/bin/bash -x

instanceName=some-docker-blog
function cleanup() {
    found=`docker ps|grep ${instanceName}`
    if [ ! "$found" == "" ]; then
         docker rm -f ${instanceName}
    fi
}

cleanup

dblog='docker run -it --rm --name ${instanceName} -v '$PWD'/example:/example openkbs/sublime-docker blog'

$dblog /example/burglary.blog

cleanup

