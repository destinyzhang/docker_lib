ubuntu 使用阿里云制作k8s相关镜像</br>
k8s_upgrade.sh 配置dockerfile 提供给阿里云使用</br>
k8s_install_ali.sh 使用阿里源安装kubelet kubeadm kubectl</br>
k8s_images_pull.sh 自动从阿里下载制作好的镜像并且改名</br>
sudo curl https://raw.githubusercontent.com/destinyzhang/docker_lib/master/k8s_images_pull.sh | sudo bash -</br>
sudo curl https://raw.githubusercontent.com/destinyzhang/docker_lib/master/k8s_install_ali.sh | sudo bash -
