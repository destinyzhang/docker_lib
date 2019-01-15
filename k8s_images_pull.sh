#!/bin/bash
#各镜像版本
K8S_VER="v1.13.2"
COREDNS_VER="1.2.6"
ETCD_VER="3.2.24"
PAUSE_VER="3.1"
AliRegPach="registry.cn-shenzhen.aliyuncs.com/zzfdyl"
K8sRegPach="k8s.gcr.io"
Arch="-amd64"
ImageList=(
	"${AliRegPach}/coredns:${COREDNS_VER}" 
	"${AliRegPach}/etcd${Arch}:${ETCD_VER}"
	"${AliRegPach}/pause${Arch}:${PAUSE_VER}"
	"${AliRegPach}/kube-apiserver${Arch}:${K8S_VER}"
	"${AliRegPach}/kube-controller-manager${Arch}:${K8S_VER}"
	"${AliRegPach}/kube-proxy${Arch}:${K8S_VER}"
	"${AliRegPach}/kube-scheduler${Arch}:${K8S_VER}"
)

TagList=(
	"${K8sRegPach}/coredns:${COREDNS_VER}" 
	"${K8sRegPach}/etcd:${ETCD_VER}"
	"${K8sRegPach}/pause:${PAUSE_VER}"
	"${K8sRegPach}/kube-apiserver:${K8S_VER}"
	"${K8sRegPach}/kube-controller-manager:${K8S_VER}"
	"${K8sRegPach}/kube-proxy:${K8S_VER}"
	"${K8sRegPach}/kube-scheduler:${K8S_VER}"
)

echo 'images-count:'${#ImageList[*]}
for ((i=0;i<${#ImageList[*]};i++));
do
	docker pull ${ImageList[i]}
	docker tag ${ImageList[i]} ${TagList[i]}
	docker rmi ${ImageList[i]}
done

docker images