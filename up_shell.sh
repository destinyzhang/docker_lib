#!/bin/bash
#各镜像版本
K8S_VER="v1.13.2"
COREDNS_VER="1.2.6"
ETCD_VER="3.2.24"
PAUSE_VER="3.1"
DOCKER_FILE="Dockerfile"

CDIR=$(cd "$(dirname "$0")";pwd)
echo ${CDIR}
#遍历所有目录
for file in $(ls -F |grep '/$'); do
	fullpath=${CDIR}'/'${file}
	dname=${file%?}
	if [ ${dname:0:5} = 'kube-' ]; then
		cd $fullpath
		echo "FROM gcr.io/google_containers/${dname}:${K8S_VER}" >${DOCKER_FILE}
		echo "MAINTAINER 569964924@qq.com" >>${DOCKER_FILE}
	elif  [ ${dname} = 'etcd-amd64' ]; then
		cd $fullpath
		echo "FROM gcr.io/google_containers/${dname}:${ETCD_VER}" >${DOCKER_FILE}
		echo "MAINTAINER 569964924@qq.com" >>${DOCKER_FILE}
	elif  [ ${dname} = 'pause-amd64' ]; then
		cd $fullpath
		echo "FROM gcr.io/google_containers/${dname}:${PAUSE_VER}" >${DOCKER_FILE}
		echo "MAINTAINER 569964924@qq.com" >>${DOCKER_FILE}
	elif  [ ${dname} = 'coredns' ]; then
		cd $fullpath
		echo "FROM gcr.io/google_containers/${dname}:${COREDNS_VER}" >${DOCKER_FILE}
		echo "MAINTAINER 569964924@qq.com" >>${DOCKER_FILE}
	fi
done