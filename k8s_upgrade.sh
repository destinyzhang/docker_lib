#!/bin/bash
#各镜像版本
K8S_VER="v1.13.2"
COREDNS_VER="1.2.6"
ETCD_VER="3.2.24"
PAUSE_VER="3.1"
HELM_VER="v2.12.3"

DOCKER_FILE="Dockerfile"
GCRIO="gcr.io"
NS_GOOGLE_CTER="google_containers"
NS_HELM="kubernetes-helm"

CDIR=$(cd "$(dirname "$0")";pwd)
echo ${CDIR}
#遍历所有目录
for file in $(ls -F |grep '/$'); do
	fullpath=${CDIR}'/'${file}
	dname=${file%?}
	namespace=${NS_GOOGLE_CTER}
	imgvar="latest"
	if [ ${dname:0:5} = 'kube-' ]; then
		imgvar=${K8S_VER}
	elif  [ ${dname} = 'etcd-amd64' ]; then
		imgvar=${ETCD_VER}
	elif  [ ${dname} = 'pause-amd64' ]; then
		imgvar=${PAUSE_VER}
	elif  [ ${dname} = 'coredns' ]; then
		imgvar=${COREDNS_VER}
	elif [ ${dname} = 'tiller' ]; then
		namespace=${NS_HELM}
		imgvar=${HELM_VER}
	else
		continue
	fi
	cd $fullpath
	echo "FROM ${GCRIO}/${namespace}/${dname}:${imgvar}" >${DOCKER_FILE}
	echo "MAINTAINER 569964924@qq.com" >>${DOCKER_FILE}
done