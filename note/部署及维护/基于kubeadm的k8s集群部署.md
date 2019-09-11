# 基于kubeadm的k8s集群部署

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

   1. kubeadm init
   2. kubeadm join