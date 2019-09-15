# 基于kubeadm的k8s集群部署

kubeadm 是官方维护k8s部署方案. 目标是通过:

​	kube init 和 kube join两条命令完成系统 部署任务. 

​	采用容器化的方式部署出kubelet以外的系统组件.

1. 使用vagrant创建3台linux主机

   [Vagrantfile](note/部署及维护/Vagrantfile)

2. 调整linux主机配置, 安装docker [env.sh](note/部署及维护/env.sh)

   1. 更新系统依赖包
   2. 调整时区
   3. 调整主机名及域名解析
   4. 关闭selinux
   5. 关闭系统防火墙, 启用iptables并清空规则
   6. 关闭虚拟内存
   7. 调整内核参数
   8. 安装docker

3. 使用kubeadm安装集群

   kubeadm config print init-defaults > k8s/kubeadm-init.yml #集群初始化配置

   ``` yaml
   apiVersion: kubeadm.k8s.io/v1beta2
   bootstrapTokens:
   - groups:
     - system:bootstrappers:kubeadm:default-node-token
     token: abcdef.0123456789abcdef
     ttl: 24h0m0s
     usages:
     - signing
     - authentication
   kind: InitConfiguration
   localAPIEndpoint:
     advertiseAddress: 192.168.100.100
     bindPort: 6443
   nodeRegistration:
     criSocket: /var/run/dockershim.sock
     name: dev-k8s-master
     taints:
     - effect: NoSchedule
       key: node-role.kubernetes.io/master
     kubeletExtraArgs:
       pod-infra-container-image: registry.aliyuncs.com/google_containers/pause:3.1
   ---
   apiServer:
     timeoutForControlPlane: 4m0s
   apiVersion: kubeadm.k8s.io/v1beta2
   certificatesDir: /etc/kubernetes/pki
   clusterName: kubernetes
   controllerManager: {}
   dns:
     type: CoreDNS
   etcd:
     local:
       dataDir: /var/lib/etcd
   kind: ClusterConfiguration
   kubernetesVersion: v1.15.0
   networking:
     dnsDomain: cluster.local
     serviceSubnet: 10.96.0.0/12
     podSubnet: 10.244.0.0/16
   scheduler: {}
   imageRepository: registry.aliyuncs.com/google_containers
   ```

   1. kubeadm init --config=kubeadm-init.yml
   2. kubeadm join

   ```
   source <(kubectl completion bash)
   echo "source <(kubectl completion bash)" >> ~/.bashrc
   
   alias k=kubectl
   complete -F __start_kubectl 
   ```

4. 安装网络插件

   wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml 

   多网卡请修改配置, 指定一个网卡 --iface=xxxx

5. 镜像加速:

   1. docker pull [quay.mirrors.ustc.edu.cn/xxx/yyy:zzz](http://quay.mirrors.ustc.edu.cn/xxx/yyy:zzz) 

