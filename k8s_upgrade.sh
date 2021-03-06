#!/bin/bash
#各镜像版本
K8S_VER="v1.13.2"
COREDNS_VER="1.2.6"
ETCD_VER="3.2.24"
PAUSE_VER="3.1"
HELM_VER="v2.12.3"
DASHBOARD_VER="v1.10.1"
METRICS_VER="v0.3.1"

#镜像名称
IMAGE_DIRS=(
	"coredns"
	"etcd-amd64"
	"kube-apiserver-amd64"
	"kube-controller-manager-amd64"
	"kube-proxy-amd64"
	"kube-scheduler-amd64"
	"pause-amd64"
	"tiller"
	"kubernetes-dashboard-amd64"
	"metrics-server-amd64"
)

#镜像版本
IMAGE_VER=(
	${COREDNS_VER}
	${ETCD_VER}
	${K8S_VER}
	${K8S_VER}
	${K8S_VER}
	${K8S_VER}
	${PAUSE_VER}
	${HELM_VER}
	${DASHBOARD_VER}
	${METRICS_VER}
)

#地址
IMAGE_URL=(
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/google_containers"
	"gcr.io/kubernetes-helm"
	"k8s.gcr.io"
	"k8s.gcr.io"
)

CDIR=$(pwd)
echo ${CDIR}' images-count:'${#IMAGE_DIRS[*]}

for ((i=0;i<${#IMAGE_DIRS[*]};i++));
do
	fullpath=${CDIR}'/'${IMAGE_DIRS[i]}
	echo ${fullpath}
	if [ ! -d ${fullpath} ]; then
		mkdir -p ${fullpath}
	fi
	cd ${fullpath}
	echo "FROM ${IMAGE_URL[i]}/${IMAGE_DIRS[i]}:${IMAGE_VER[i]}" > Dockerfile
	echo "MAINTAINER 569964924@qq.com" >> Dockerfile
done
