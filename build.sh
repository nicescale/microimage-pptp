#!/bin/bash

set -e

REG_URL=index.csphere.cn
IREG_URL=docker.nicescale.com
IMAGE=microimages/pptp
TAGS="1.4"
BASE_IMAGE=alpine

docker pull $BASE_IMAGE

docker build -t $IMAGE .

docker tag -f $IMAGE $REG_URL/$IMAGE
docker tag -f $IMAGE $IREG_URL/$IMAGE

for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IREG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $IMAGE
docker push $REG_URL/$IMAGE
docker push $IREG_URL/$IMAGE

