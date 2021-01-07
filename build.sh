#!/bin/bash

if ! grep docker /proc/1/cgroup -qa; then
	echo "Only run this script in a docker container."
	exit 1
fi

if [ $UID -ne 0 ]; then
	echo "Running as UID "$UID
	echo "Only run this script as root."
	exit 1
fi

groupadd -f -g $GROUP build
useradd -d /home/build -m -s /bin/bash -u $USER -g $GROUP build 
echo "build ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

su - build -c "make -C /mnt dist"
