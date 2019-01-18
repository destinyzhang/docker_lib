# ubuntu使用阿里云制作k8s相关镜像

#### 介绍
k8s_upgrade.sh 配置dockerfile 提供给阿里云使用
k8s_install_ali.sh 使用阿里源安装kubelet kubeadm kubectl
k8s_images_pull.sh 自动从阿里下载制作好的镜像并且改名

sudo curl https://raw.githubusercontent.com/destinyzhang/docker_lib/master/k8s_images_pull.sh | sudo bash -
sudo curl https://raw.githubusercontent.com/destinyzhang/docker_lib/master/k8s_install_ali.sh | sudo bash -


sudo curl https://gitee.com/dylove/docker_lib/raw/master/k8s_images_pull.sh | sudo bash -
sudo curl https://gitee.com/dylove/docker_lib/raw/master/k8s_install_ali.sh | sudo bash -
