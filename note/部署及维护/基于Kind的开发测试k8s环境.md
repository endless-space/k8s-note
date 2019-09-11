# 基于Kind的开发测试k8s环境

k8s 开发测试环境搭建有多种方案, 诸如:

- kind (kubernetes in docker), 本文选择此种方式, 其他的可以根据需要选择

- minikube

- k3s: rancher的k8s发行版, 做了大幅精简, 可用于资源受限环境

- MicroK8s

----

1. #### vagrant 及 virtualbox安装

   这个直接安装就好了

2. #### 使用vagrant创建linux虚拟机环境

   使用自定义的box

3. #### 在linux虚拟机中安装docker

   参见kubeadm一节的env.sh脚本

4. #### 在linux虚拟机中安装go开发环境

   使用gvm版本管理器

5. #### 在linux虚拟机中安装kind

   调整kind配置, 使用kind创建集群

6. #### 使用kind创建k8s开发测试集群



#### 