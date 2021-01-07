#!/bin/bash

DOCKER=$(which docker 2>/dev/null)

if [ -z "$DOCKER" ]; then
	echo "docker not found"
	exit 1
fi

BUILD_IMAGE=zenoss/zenoss-centos-base:1.3.4.devtools

$DOCKER run \
	--rm \
	-v $(pwd):/mnt \
	-w /mnt \
	--env USER=$(id -u) \
	--env GROUP=$(id -g) \
	$BUILD_IMAGE \
	/mnt/build.sh
